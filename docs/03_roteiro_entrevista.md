# Como explicar o projeto em entrevista

## Pitch de 60 segundos

> “No projeto Atlas Finance eu analisei uma carteira fictícia de crédito ao consumidor usando SQL Server e Power BI. Trabalhei com duas tabelas principais: clientes e empréstimos. Primeiro fiz uma auditoria simples da qualidade dos dados e criei views para padronizar estado, produto e status sem alterar a base bruta. Depois construí KPIs como saldo devedor, ticket médio, taxa de inadimplência e saldo associado a contratos com mais de 30 dias de atraso. Em seguida segmentei a carteira por produto, renda, comprometimento de renda e estado. Um dos principais achados foi que o comprometimento da parcela em relação à renda apresentou uma diferença clara de inadimplência entre faixas. O objetivo do projeto não foi prever risco individual, mas entender onde o risco estava concentrado na carteira.” 

## Perguntas prováveis

### O que você chamou de inadimplência?
Contratos ativos com mais de 30 dias de atraso. É uma regra analítica definida para o case.

### Por que usar comprometimento de renda?
Porque uma parcela de R$ 1.000 representa situações muito diferentes para alguém com renda de R$ 2.500 e alguém com renda de R$ 10.000.

### Qual a diferença entre saldo devedor e valor contratado?
Valor contratado é o valor original do crédito. Saldo devedor é quanto ainda permanece em aberto.

### Por que não dizer que renda baixa causa inadimplência?
Porque a análise é descritiva. Uma associação observada não prova causalidade.

### Qual conceito SQL você mais usou?
JOIN para relacionar cliente e empréstimo, CASE WHEN para criar faixas, GROUP BY para segmentações e agregações como SUM, COUNT e AVG.
