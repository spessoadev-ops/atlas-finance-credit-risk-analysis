USE AtlasFinancePortfolio;
GO

CREATE OR ALTER VIEW dbo.vw_clientes_limpos AS
SELECT
    id_cliente,
    idade,
    UPPER(LTRIM(RTRIM(estado))) AS estado,
    CAST(renda_mensal AS decimal(12,2)) AS renda_mensal,
    tempo_cliente_meses,
    CASE
        WHEN renda_mensal IS NULL THEN 'Não informado'
        WHEN renda_mensal < 3000 THEN 'Até R$ 3 mil'
        WHEN renda_mensal < 5000 THEN 'R$ 3 a 5 mil'
        WHEN renda_mensal < 8000 THEN 'R$ 5 a 8 mil'
        WHEN renda_mensal < 12000 THEN 'R$ 8 a 12 mil'
        ELSE 'Acima de R$ 12 mil'
    END AS faixa_renda
FROM dbo.clientes;
GO

CREATE OR ALTER VIEW dbo.vw_emprestimos_limpos AS
SELECT
    id_emprestimo,
    id_cliente,
    CASE
        WHEN LOWER(LTRIM(RTRIM(tipo_emprestimo))) IN ('credito pessoal','crédito pessoal') THEN 'Crédito Pessoal'
        WHEN LOWER(LTRIM(RTRIM(tipo_emprestimo))) = 'consignado' THEN 'Consignado'
        WHEN LOWER(LTRIM(RTRIM(tipo_emprestimo))) = 'financiamento veicular' THEN 'Financiamento Veicular'
        WHEN LOWER(LTRIM(RTRIM(tipo_emprestimo))) = 'refinanciamento' THEN 'Refinanciamento'
        ELSE LTRIM(RTRIM(tipo_emprestimo))
    END AS tipo_emprestimo,
    CAST(valor_contratado AS decimal(14,2)) AS valor_contratado,
    numero_parcelas,
    CAST(valor_parcela AS decimal(12,2)) AS valor_parcela,
    CAST(saldo_devedor AS decimal(14,2)) AS saldo_devedor,
    dias_atraso,
    CASE
        WHEN LOWER(LTRIM(RTRIM(status))) = 'em dia' THEN 'Em dia'
        WHEN LOWER(LTRIM(RTRIM(status))) = 'atrasado' THEN 'Atrasado'
        WHEN LOWER(LTRIM(RTRIM(status))) = 'inadimplente' THEN 'Inadimplente'
        WHEN LOWER(LTRIM(RTRIM(status))) = 'quitado' THEN 'Quitado'
        ELSE LTRIM(RTRIM(status))
    END AS status,
    CAST(data_contratacao AS date) AS data_contratacao,
    CASE
        WHEN dias_atraso = 0 THEN 'Em dia'
        WHEN dias_atraso BETWEEN 1 AND 30 THEN '1 a 30 dias'
        WHEN dias_atraso BETWEEN 31 AND 60 THEN '31 a 60 dias'
        WHEN dias_atraso BETWEEN 61 AND 90 THEN '61 a 90 dias'
        ELSE 'Acima de 90 dias'
    END AS faixa_atraso,
    CASE WHEN dias_atraso > 30 THEN 1 ELSE 0 END AS flag_inadimplencia_30d
FROM dbo.emprestimos;
GO

CREATE OR ALTER VIEW dbo.vw_carteira_analitica AS
SELECT
    e.*,
    c.idade,
    c.estado,
    c.renda_mensal,
    c.tempo_cliente_meses,
    c.faixa_renda,
    CASE 
        WHEN c.renda_mensal IS NULL OR c.renda_mensal = 0 THEN NULL
        ELSE e.valor_parcela / c.renda_mensal
    END AS comprometimento_renda
FROM dbo.vw_emprestimos_limpos e
INNER JOIN dbo.vw_clientes_limpos c
    ON c.id_cliente = e.id_cliente;
GO
