# Dashboard — Atlas Finance

O projeto foi pensado para um dashboard de **uma página**, propositalmente mais simples que o NexaShop.

## Cards

- Saldo Devedor
- Empréstimos Ativos
- Clientes na Carteira
- Taxa de Inadimplência 30+
- Saldo Inadimplente
- Ticket Médio do Empréstimo

## Visuais

1. **Barras:** Taxa de inadimplência por tipo de empréstimo
2. **Colunas:** Taxa de inadimplência por faixa de renda
3. **Barras:** Taxa de inadimplência por comprometimento da renda
4. **Barras empilhadas:** Empréstimos por faixa de atraso
5. **Mapa ou barras:** Saldo devedor por estado

## Medidas DAX sugeridas

```DAX
Saldo Devedor =
CALCULATE(
    SUM(vw_carteira_analitica[saldo_devedor]),
    vw_carteira_analitica[status] <> "Quitado"
)

Empréstimos Ativos =
CALCULATE(
    DISTINCTCOUNT(vw_carteira_analitica[id_emprestimo]),
    vw_carteira_analitica[status] <> "Quitado"
)

Empréstimos Inadimplentes =
CALCULATE(
    DISTINCTCOUNT(vw_carteira_analitica[id_emprestimo]),
    vw_carteira_analitica[status] <> "Quitado",
    vw_carteira_analitica[flag_inadimplencia_30d] = 1
)

Taxa de Inadimplência =
DIVIDE(
    [Empréstimos Inadimplentes],
    [Empréstimos Ativos]
)

Saldo Inadimplente =
CALCULATE(
    SUM(vw_carteira_analitica[saldo_devedor]),
    vw_carteira_analitica[status] <> "Quitado",
    vw_carteira_analitica[flag_inadimplencia_30d] = 1
)

Ticket Médio =
CALCULATE(
    AVERAGE(vw_carteira_analitica[valor_contratado]),
    vw_carteira_analitica[status] <> "Quitado"
)
```

## Leitura do dashboard

A página deve responder rapidamente:
**qual o tamanho da carteira, quanto está em risco e onde a inadimplência está concentrada?**
