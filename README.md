# Atlas Finance — Análise de Carteira e Inadimplência

Projeto de portfólio em **Análise de Dados** sobre uma carteira fictícia de crédito ao consumidor.

A proposta é entender **onde está concentrado o risco da carteira**, sem criar um modelo de decisão de crédito individual.

> Os dados são sintéticos e foram criados exclusivamente para estudo e portfólio.

## Pergunta central

**Quais características estão mais associadas à inadimplência da carteira e onde a empresa deveria concentrar sua atenção?**

## Stack

- SQL Server / T-SQL
- Power BI

## Base

- 3,200 clientes
- 3,567 contratos de crédito
- 2 tabelas relacionais
- Dados entre 2024 e 2026

## KPIs principais

| Indicador | Resultado |
|---|---:|
| Empréstimos ativos | 3,072 |
| Clientes na carteira | 2,806 |
| Saldo devedor | R$ 44,867,096.74 |
| Taxa de inadimplência 30+ | 13.70% |
| Saldo inadimplente | R$ 6,872,737.08 |
| Ticket médio do empréstimo | R$ 20,311.56 |

## O que foi analisado

- Qualidade e padronização dos dados
- Tamanho da carteira
- Faixas de atraso
- Inadimplência por produto
- Inadimplência por faixa de renda
- Comprometimento de renda
- Concentração geográfica
- Saldo devedor e saldo inadimplente

## Principais insights

- **Crédito Pessoal** apresentou a maior taxa de inadimplência por produto.
- A faixa de comprometimento **Acima de 35%** apresentou maior incidência de inadimplência.
- **SP** concentra o maior saldo devedor, o que representa tamanho de carteira, não necessariamente maior risco.
- O case mostra por que é importante separar **volume financeiro** de **taxa de inadimplência**.

## Estrutura

```text
atlas-finance-credit-risk-analysis/
├── data/raw/
├── sql/
├── outputs/
├── dashboard/
├── docs/
└── README.md
```

## Arquivos SQL

1. `01_views_limpeza.sql` — camada tratada
2. `02_qualidade_dados.sql` — auditoria
3. `03_kpis_carteira.sql` — indicadores principais
4. `04_inadimplencia_segmentacoes.sql` — análises por segmento

## Limitação importante

As análises são **descritivas**. Uma taxa maior em determinado grupo não prova causalidade e não deve ser usada, isoladamente, para decisões individuais de crédito.
