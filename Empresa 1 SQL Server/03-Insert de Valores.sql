USE EMPRESA1
GO

-- INSERT DE VALORES

-- TABELA Tamanhos
INSERT INTO Tamanhos (Tamanho_Descricao)
VALUES ('Pequeno'), ('Médio'), ('Grande');
GO

/*
SELECT *
FROM Tamanhos;
GO

Tamanho_ID    Tamanho_Descricao
1      Pequeno
2      Médio
3      Grande
*/

-- TABELA Grades
INSERT INTO Grades (Grade_Descricao)
VALUES ('Camiseta'), ('Blusa'), ('Calça');
GO

/*
SELECT *
FROM Grades;
GO

Grade_ID      Grade_Descricao
1      Camiseta
2      Blusa
3      Calça
*/

-- TABELA Grades_Tamanhos
INSERT INTO Grades_Tamanhos (Grade_ID, Tamanho_ID)
VALUES (1, 1), (1, 2), (1, 3),
       (2, 1), (2, 2), (2, 3),
       (3, 1), (3, 2), (3, 3);

/*
SELECT *
FROM Grades_Tamanhos;
GO

GraTam_ID     Grade_ID      Tamanho_ID
1      1      1
2      1      2
3      1      3
4      2      1
5      2      2
6      2      3
7      3      1
8      3      2
9      3      3
*/

-- TABELA Grupos
INSERT INTO Grupos (Grupo_Descricao)
VALUES ('Grupo 1'), ('Grupo 2'), ('Grupo 3');
GO

/*
SELECT *
FROM Grupos;
GO

Grupo_ID      Grupo_Descricao
1      Grupo 1
2      Grupo 2
3      Grupo 3
*/

-- TABELA SubGrupos
INSERT INTO SubGrupos (SubGrupo_Descricao)
VALUES ('Subgrupo 1'), ('Subgrupo 2'), ('Subgrupo 3');
GO

/*
SELECT *
FROM SubGrupos;
GO

SubGrupo_ID   SubGrupo_Descricao
1      Subgrupo 1
2      Subgrupo 2
3      Subgrupo 3
*/

-- TABELA Grupos_SubGrupos
INSERT INTO Grupos_SubGrupos (Grupo_ID, SubGrupo_ID)
VALUES (1, 1), (1, 2), (1, 3),
       (2, 1), (2, 2), (2, 3),
       (3, 1), (3, 2), (3, 3);

/*
SELECT *
FROM Grupos_SubGrupos;
GO

GruSub_ID     Grupo_ID      SubGrupo_ID
1      1      1
2      1      2
3      1      3
4      2      1
5      2      2
6      2      3
7      3      1
8      3      2
9      3      3
*/

-- TABELA Tabelas
INSERT INTO Tabelas (Tabela_Descricao)
VALUES ('Tabela 1'), ('Tabela 2'), ('Tabela 3');

/*
SELECT *
FROM Tabelas;
GO

Tabela_ID     Tabela_Descricao
1      Tabela 1
2      Tabela 2
3      Tabela 3
*/

-- TABELA Tabelas_Valores
INSERT INTO Tabelas_Valores (Produto_ID, Tabela_ID, Valor_Venda)
VALUES (1, 1, 10.50), (1, 2, 11.00), (1, 3, 12.00),
       (2, 1, 15.00), (2, 2, 16.00), (2, 3, 17.00),
       (3, 1, 20.00), (3, 2, 21.00), (3, 3, 22.00);

/*
SELECT *
FROM Tabelas_Valores;
GO

Valor_ID      Produto_ID    Tabela_ID     Valor_Venda
1      1      1      10.50
2      1      2      11.00
3      1      3      12.00
4      2      1      15.00
5      2      2      16.00
6      2      3      17.00
7      3      1      20.00
8      3      2      21.00
9      3      3      22.00
*/

-- TABELA Estoques_Grades
INSERT INTO Estoques_Grades (GraTam_ID, EstGra_Quantidade)
VALUES (1, 100), 
       (2, 200), 
       (3, 150),
       (4, 10),
       (5, 60),
       (6, 190),
       (7, 70),
       (8, 50),
       (9, 120);

/*
SELECT *
FROM Estoques_Grades;
GO

EstGra_ID     GraTam_ID     EstGra_Quantidade
1      1      100
2      2      200
3      3      150
4      4      10
5      5      60
6      6      190
7      7      70
8      8      50
9      9      120
*/

-- TABELA Produtos
INSERT INTO Produtos (Produto_Descricao, GruSub_ID, GraTam_ID, Valor_ID, EstGra_ID)
VALUES ('Produto 1', 1, 1, 1, 1),
       ('Produto 1', 2, 2, 2, 2),
       ('Produto 1', 3, 3, 3, 3),
       ('Produto 2', 4, 4, 4, 4),
       ('Produto 2', 5, 5, 5, 5),
       ('Produto 2', 6, 6, 6, 6),
       ('Produto 3', 7, 7, 7, 7),
       ('Produto 3', 8, 8, 8, 8),
       ('Produto 3', 9, 9, 9, 9);

/*
SELECT *
FROM Produtos;
GO

Produto_ID    Produto_Descricao    GruSub_ID     GraTam_ID     Valor_ID      EstGra_ID
1      Produto 1     1      1      1      1
2      Produto 1     2      2      2      2
3      Produto 1     3      3      3      3
4      Produto 2     4      4      4      4
5      Produto 2     5      5      5      5
6      Produto 2     6      6      6      6
7      Produto 1     7      7      7      7
8      Produto 1     8      8      8      8
9      Produto 1     9      9      9      9
*/