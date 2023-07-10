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
    TV.Valor_Venda AS ValorProduto
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
        ON GT.Tamanho_ID = T.Tamanho_ID;


/*
Código  Descrição   Grupo   SubGrupo    GradeDescrição  Tamanho QtdGrade    CódigoTabela    DescriçãoTabela ValorProduto
1   Produto 1   Grupo 1 Subgrupo 1  Camiseta    Pequeno 100 1   Tabela 1    10.50
2   Produto 1   Grupo 1 Subgrupo 2  Camiseta    Médio   200 2   Tabela 2    11.00
3   Produto 1   Grupo 1 Subgrupo 3  Camiseta    Grande  150 3   Tabela 3    12.00
4   Produto 2   Grupo 2 Subgrupo 1  Blusa       Pequeno 10  1   Tabela 1    15.00
5   Produto 2   Grupo 2 Subgrupo 2  Blusa       Médio   60  2   Tabela 2    16.00
6   Produto 2   Grupo 2 Subgrupo 3  Blusa       Grande  190 3   Tabela 3    17.00
7   Produto 3   Grupo 3 Subgrupo 1  Calça       Pequeno 70  1   Tabela 1    20.00
8   Produto 3   Grupo 3 Subgrupo 2  Calça       Médio   50  2   Tabela 2    21.00
9   Produto 3   Grupo 3 Subgrupo 3  Calça       Grande  120 3   Tabela 3    22.00
*/