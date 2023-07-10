SELECT
    P.Produto_Descricao,
    P.GruSub_ID,
    P.GraTam_ID,
    TV.Valor_Venda,
    I.Ipi_Alíquota,
    ROUND(ISNULL(I.Ipi_Alíquota / 100 * TV.Valor_Venda, 0), 2) AS Valor_IPI,
    ST.Mva AS Mva_ICMS_ST,
    ST.Alíquota_ICMS,
    ROUND(ISNULL(ST.Mva / 100 * (TV.Valor_Venda + ISNULL(I.Ipi_Alíquota / 100 * TV.Valor_Venda, 0)), 0), 2) AS Valor_ICMS_ST
FROM
    Produtos P
    JOIN Tabelas_Valores TV 
        ON P.Valor_ID = TV.Valor_ID
    LEFT JOIN Ipi_Impostos I 
        ON P.Produto_ID = I.Produto_ID
    LEFT JOIN IcmsSt_Impostos ST 
        ON P.Produto_ID = ST.Produto_ID;
GO

/*
Produto_Descricao   GruSub_ID   GraTam_ID   Valor_Venda Ipi_Alíquota    Valor_IPI   Mva_ICMS_ST Alíquota_ICMS   Valor_ICMS_ST
Produto 1   1   1   10.50   8.00    0.84000000  80.00   18.00   9.07000000000
Produto 1   2   2   11.00   8.00    0.88000000  80.00   18.00   9.50000000000
Produto 1   3   3   12.00   8.00    0.96000000  80.00   18.00   10.37000000000
Produto 2   4   4   15.00   8.00    1.20000000  80.00   18.00   12.96000000000
Produto 2   5   5   16.00   8.00    1.28000000  80.00   18.00   13.82000000000
Produto 2   6   6   17.00   8.00    1.36000000  80.00   18.00   14.69000000000
Produto 3   7   7   20.00   8.00    1.60000000  80.00   18.00   17.28000000000
Produto 3   8   8   21.00   8.00    1.68000000  80.00   18.00   18.14000000000
Produto 3   9   9   22.00   8.00    1.76000000  80.00   18.00   19.01000000000
*/