SELECT
    P.Produto_ID AS Código,
    P.Produto_Descricao AS Descrição,
    GRU.Grupo_Descricao AS Grupo,
    SUB.SubGrupo_Descricao AS SubGrupo,
    G.Grade_Descricao AS GradeDescrição,
    T.Tamanho_Descricao AS Tamanho,
    EG.EstGra_Quantidade AS QtdGrade,
    TV.Tabela_ID AS CódigoTabela,
    TA.Tabela_Descricao AS DescriçãoTabela,
    TV.Valor_Venda AS ValorProduto,
    I.Ipi_Alíquota,
    ROUND(ISNULL(I.Ipi_Alíquota / 100 * TV.Valor_Venda, 0), 2) AS Valor_IPI, --is null para validar os produtos que não tem IPI, portanto valor nulo é igual a zero
    ST.Mva AS Mva_ICMS_ST,
    ST.Alíquota_ICMS,
    ROUND((TV.Valor_Venda + (TV.Valor_Venda * ST.Mva / 100)) * ST.Alíquota_ICMS / 100, 2) AS Valor_ICMS_ST
FROM
    Produtos P
    JOIN Grades_Tamanhos GT 
        ON P.GraTam_ID = GT.GraTam_ID
    JOIN Grades G 
        ON GT.Grade_ID = G.Grade_ID
    JOIN Grupos_SubGrupos GS 
        ON P.GruSub_ID = GS.GruSub_ID
    JOIN Grupos GRU 
        ON GS.Grupo_ID = GRU.Grupo_ID
    JOIN SubGrupos SUB 
        ON GS.SubGrupo_ID = SUB.SubGrupo_ID
    JOIN Estoques_Grades EG 
        ON P.EstGra_ID = EG.EstGra_ID
    JOIN Tabelas_Valores TV 
        ON P.Valor_ID = TV.Valor_ID
    JOIN Tabelas TA 
        ON TV.Tabela_ID = TA.Tabela_ID
    JOIN Tamanhos T 
        ON GT.Tamanho_ID = T.Tamanho_ID
    LEFT JOIN Ipi_Impostos I 
        ON P.Produto_ID = I.Produto_ID
    LEFT JOIN IcmsSt_Impostos ST 
        ON P.Produto_ID = ST.Produto_ID;
GO

/* APENAS PARA CONHECIMENTO DOS LEITORES

--PARA CALCULAR O IPI, FOI REALIZADO O CALCULO:
Descrição: "Produto 1"
Valor: R$ 10,50
Alíquota do IPI: 8%

--Com base nesses dados, podemos calcular o IPI da seguinte forma:

Calculo do IPI: (AlíquotaIPI / 100) * ValorVenda
Valor do IPI: (8 / 100) * R$ 10,50 = R$ 0,84

--PARA CALCULAR O ICMS ST, FOI REALIZADO O CALCULO:
Descrição: "Produto 1"
Valor: R$ 10,50
Alíquota do ICMS: 18%
MVA (Margem de Valor Agregado): 80%

--Com base nesses dados, podemos calcular o ICMS ST da seguinte forma:

Cálculo da Base de Cálculo do ICMS ST:
Valor do produto: R$ 10,50
MVA: 80%
Valor adicionado: R$ 10,50 * (80% / 100) = R$ 8,40
Base de cálculo do ICMS ST: Valor do produto + Valor adicionado = R$ 10,50 + R$ 8,40 = R$ 18,90
Alíquota do ICMS ST: 18%
ICMS ST: Base de cálculo do ICMS ST * (Alíquota do ICMS ST / 100) = R$ 18,90 * (18% / 100) = R$ 3,40

*/
/*
Código  Descrição   Grupo   SubGrupo    GradeDescrição  Tamanho QtdGrade    CódigoTabela    DescriçãoTabela ValorProduto    Ipi_Alíquota    Valor_IPI   Mva_ICMS_ST Alíquota_ICMS   Valor_ICMS_ST
1   Produto 1   Grupo 1 Subgrupo 1  Camiseta    Pequeno 100 1   Tabela 1    10.50   8.00    0.84000000  80.00   18.00   3.40000000000
2   Produto 1   Grupo 1 Subgrupo 2  Camiseta    Médio   200 2   Tabela 2    11.00   8.00    0.88000000  80.00   18.00   3.56000000000
3   Produto 1   Grupo 1 Subgrupo 3  Camiseta    Grande  150 3   Tabela 3    12.00   8.00    0.96000000  80.00   18.00   3.89000000000
4   Produto 2   Grupo 2 Subgrupo 1  Blusa       Pequeno 10  1   Tabela 1    15.00   8.00    1.20000000  80.00   18.00   4.86000000000
5   Produto 2   Grupo 2 Subgrupo 2  Blusa       Médio   60  2   Tabela 2    16.00   8.00    1.28000000  80.00   18.00   5.18000000000
6   Produto 2   Grupo 2 Subgrupo 3  Blusa       Grande  190 3   Tabela 3    17.00   8.00    1.36000000  80.00   18.00   5.51000000000
7   Produto 3   Grupo 3 Subgrupo 1  Calça       Pequeno 70  1   Tabela 1    20.00   8.00    1.60000000  80.00   18.00   6.48000000000
8   Produto 3   Grupo 3 Subgrupo 2  Calça       Médio   50  2   Tabela 2    21.00   8.00    1.68000000  80.00   18.00   6.80000000000
9   Produto 3   Grupo 3 Subgrupo 3  Calça       Grande  120 3   Tabela 3    22.00   8.00    1.76000000  80.00   18.00   7.13000000000
*/