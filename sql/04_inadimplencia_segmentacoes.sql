USE AtlasFinancePortfolio;
GO

-- Inadimplência por produto
SELECT
    tipo_emprestimo,
    COUNT(*) AS emprestimos,
    SUM(saldo_devedor) AS saldo_devedor,
    SUM(flag_inadimplencia_30d) AS inadimplentes,
    SUM(flag_inadimplencia_30d) * 100.0 / COUNT(*) AS taxa_inadimplencia_pct
FROM dbo.vw_carteira_analitica
WHERE status <> 'Quitado'
GROUP BY tipo_emprestimo
ORDER BY taxa_inadimplencia_pct DESC;

-- Inadimplência por faixa de renda
SELECT
    faixa_renda,
    COUNT(DISTINCT id_cliente) AS clientes,
    COUNT(*) AS emprestimos,
    SUM(flag_inadimplencia_30d) * 100.0 / COUNT(*) AS taxa_inadimplencia_pct
FROM dbo.vw_carteira_analitica
WHERE status <> 'Quitado'
GROUP BY faixa_renda
ORDER BY taxa_inadimplencia_pct DESC;

-- Comprometimento de renda
SELECT
    CASE
        WHEN comprometimento_renda IS NULL THEN 'Não informado'
        WHEN comprometimento_renda < 0.15 THEN 'Até 15%'
        WHEN comprometimento_renda < 0.25 THEN '15% a 25%'
        WHEN comprometimento_renda < 0.35 THEN '25% a 35%'
        ELSE 'Acima de 35%'
    END AS faixa_comprometimento,
    COUNT(*) AS emprestimos,
    AVG(comprometimento_renda) AS comprometimento_medio,
    SUM(flag_inadimplencia_30d) * 100.0 / COUNT(*) AS taxa_inadimplencia_pct
FROM dbo.vw_carteira_analitica
WHERE status <> 'Quitado'
GROUP BY
    CASE
        WHEN comprometimento_renda IS NULL THEN 'Não informado'
        WHEN comprometimento_renda < 0.15 THEN 'Até 15%'
        WHEN comprometimento_renda < 0.25 THEN '15% a 25%'
        WHEN comprometimento_renda < 0.35 THEN '25% a 35%'
        ELSE 'Acima de 35%'
    END
ORDER BY taxa_inadimplencia_pct DESC;

-- Carteira por estado
SELECT
    estado,
    COUNT(DISTINCT id_cliente) AS clientes,
    SUM(saldo_devedor) AS saldo_devedor,
    SUM(CASE WHEN flag_inadimplencia_30d = 1 THEN saldo_devedor ELSE 0 END)
        AS saldo_inadimplente
FROM dbo.vw_carteira_analitica
WHERE status <> 'Quitado'
GROUP BY estado
ORDER BY saldo_devedor DESC;
