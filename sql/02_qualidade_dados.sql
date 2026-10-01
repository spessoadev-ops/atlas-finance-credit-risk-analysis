USE AtlasFinancePortfolio;
GO

-- Volume
SELECT COUNT(*) AS total_clientes FROM dbo.clientes;
SELECT COUNT(*) AS total_emprestimos FROM dbo.emprestimos;

-- IDs duplicados
SELECT id_cliente, COUNT(*) qtd
FROM dbo.clientes
GROUP BY id_cliente
HAVING COUNT(*) > 1;

SELECT id_emprestimo, COUNT(*) qtd
FROM dbo.emprestimos
GROUP BY id_emprestimo
HAVING COUNT(*) > 1;

-- Nulos
SELECT
    SUM(CASE WHEN renda_mensal IS NULL THEN 1 ELSE 0 END) AS renda_nula
FROM dbo.clientes;

-- Valores categóricos brutos
SELECT estado, COUNT(*) qtd
FROM dbo.clientes
GROUP BY estado
ORDER BY estado;

SELECT tipo_emprestimo, COUNT(*) qtd
FROM dbo.emprestimos
GROUP BY tipo_emprestimo
ORDER BY tipo_emprestimo;

SELECT status, COUNT(*) qtd
FROM dbo.emprestimos
GROUP BY status
ORDER BY status;

-- Empréstimos sem cliente
SELECT COUNT(*) AS emprestimos_sem_cliente
FROM dbo.emprestimos e
LEFT JOIN dbo.clientes c
    ON c.id_cliente = e.id_cliente
WHERE c.id_cliente IS NULL;
