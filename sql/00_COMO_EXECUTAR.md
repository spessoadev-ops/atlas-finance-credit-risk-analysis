# Como executar no SQL Server

1. Crie um banco chamado `AtlasFinancePortfolio`.
2. Importe:
   - `data/raw/clientes.csv` como tabela `clientes`
   - `data/raw/emprestimos.csv` como tabela `emprestimos`
3. Confira tipos:
   - IDs: INT
   - renda/valores: DECIMAL
   - datas: DATE
   - textos: VARCHAR/NVARCHAR
4. Execute os SQLs na ordem:
   - 01_views_limpeza.sql
   - 02_qualidade_dados.sql
   - 03_kpis_carteira.sql
   - 04_inadimplencia_segmentacoes.sql
5. Compare os resultados com os arquivos da pasta `outputs/`.
