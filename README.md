# Atlas Finance — Análise de Carteira e Inadimplência

**Português** | [English](./README.en.md)

Projeto de portfólio em **Análise de Dados** sobre uma carteira fictícia de crédito ao consumidor.

O objetivo do projeto é entender **onde está concentrado o risco da carteira**, quais segmentos apresentam maior inadimplência e como diferentes características se relacionam com o comportamento de pagamento.

> Os dados são sintéticos e foram criados exclusivamente para estudo e portfólio.

## Pergunta central

**Quais características estão mais associadas à inadimplência da carteira e onde a empresa deveria concentrar sua atenção?**

## Stack

- SQL Server / T-SQL
- Power BI

## Base de dados

O projeto utiliza duas tabelas relacionais:

- **clientes** — informações demográficas e financeiras dos clientes
- **emprestimos** — informações dos contratos de crédito

A base contém:

- 3.200 clientes
- 3.567 contratos de crédito
- dados entre 2024 e 2026

## KPIs principais

| Indicador | Resultado |
|---|---:|
| Empréstimos ativos | 3.072 |
| Clientes na carteira | 2.806 |
| Saldo devedor | R$ 44,87 milhões |
| Taxa de inadimplência 30+ | 13,70% |
| Saldo inadimplente | R$ 6,87 milhões |
| Ticket médio dos empréstimos | análise disponível no projeto |

## O que foi analisado

- Qualidade e padronização dos dados
- Tamanho da carteira
- Saldo devedor
- Faixas de atraso
- Inadimplência por produto
- Inadimplência por faixa de renda
- Comprometimento da renda
- Concentração geográfica da carteira
- Saldo associado a contratos inadimplentes

## Regra de inadimplência

Para este projeto, um contrato foi considerado **inadimplente quando possui mais de 30 dias de atraso**.

Essa é uma regra analítica definida para o case e não representa uma regra universal do mercado de crédito.

## Principais insights

- **Crédito Pessoal** apresentou a maior taxa de inadimplência entre os produtos analisados.
- Clientes com comprometimento de renda **acima de 35%** apresentaram maior incidência de inadimplência.
- A análise mostrou que **volume financeiro e risco não são a mesma coisa**.
- Estados com maior saldo devedor não necessariamente apresentam maior taxa de inadimplência.
- O comprometimento da parcela em relação à renda se mostrou uma variável importante para segmentar a carteira.

## Conceito importante: comprometimento de renda

O comprometimento de renda foi calculado comparando:

```text
valor da parcela
÷
renda mensal
