USE AtlasFinancePortfolio;
GO

-- KPIs da carteira ativa
SELECT
    COUNT(DISTINCT id_emprestimo) AS emprestimos_ativos,
    COUNT(DISTINCT id_cliente) AS clientes_na_carteira,
    SUM(valor_contratado) AS valor_contratado,
    SUM(saldo_devedor) AS saldo_devedor,
    AVG(valor_contratado) AS ticket_medio_emprestimo,
    AVG(valor_parcela) AS parcela_media
FROM dbo.vw_carteira_analitica
WHERE status <> 'Quitado';

-- Taxa de inadimplência por empréstimo
SELECT
    SUM(flag_inadimplencia_30d) * 100.0 / COUNT(*) AS taxa_inadimplencia_pct
FROM dbo.vw_carteira_analitica
WHERE status <> 'Quitado';

-- Saldo em inadimplência
SELECT
    SUM(CASE WHEN flag_inadimplencia_30d = 1 THEN saldo_devedor ELSE 0 END)
        AS saldo_inadimplente
FROM dbo.vw_carteira_analitica
WHERE status <> 'Quitado';

-- Faixas de atraso
SELECT
    faixa_atraso,
    COUNT(*) AS emprestimos,
    SUM(saldo_devedor) AS saldo_devedor
FROM dbo.vw_carteira_analitica
WHERE status <> 'Quitado'
GROUP BY faixa_atraso
ORDER BY MIN(dias_atraso);
