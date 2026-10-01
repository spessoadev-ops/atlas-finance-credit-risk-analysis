# Dicionário de Dados

## clientes.csv

| Campo | Descrição |
|---|---|
| id_cliente | Identificador único do cliente |
| idade | Idade |
| estado | UF |
| renda_mensal | Renda mensal informada |
| tempo_cliente_meses | Tempo de relacionamento com a empresa |

## emprestimos.csv

| Campo | Descrição |
|---|---|
| id_emprestimo | Identificador único do contrato |
| id_cliente | Cliente relacionado |
| tipo_emprestimo | Produto de crédito |
| valor_contratado | Valor original contratado |
| numero_parcelas | Quantidade de parcelas |
| valor_parcela | Valor mensal da parcela |
| saldo_devedor | Saldo ainda em aberto |
| dias_atraso | Dias de atraso |
| status | Situação atual |
| data_contratacao | Data de contratação |

## Regra principal

Para este case, um empréstimo é tratado como **inadimplente quando possui mais de 30 dias de atraso**.

A regra é uma convenção analítica do projeto, não uma regra universal do mercado.
