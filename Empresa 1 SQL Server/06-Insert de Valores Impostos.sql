USE EMPRESA1
GO

-- INSERT DE VALORES

-- TABELA IPI
INSERT INTO Ipi_Impostos (Produto_ID, Ipi_Alíquota)
SELECT Produto_ID, 8 FROM Produtos;

/*
SELECT *
FROM Ipi_Impostos;
GO

Ipi_ID	Produto_ID	Ipi_Alíquota
1	1	8.00
2	2	8.00
3	3	8.00
4	4	8.00
5	5	8.00
6	6	8.00
7	7	8.00
8	8	8.00
9	9	8.00
*/

-- TABELA ICMS ST
INSERT INTO IcmsSt_Impostos (IcmsST_ID, Produto_ID, Mva, Alíquota_ICMS)
SELECT Produto_ID, Produto_ID, 80.00, 18 FROM Produtos;

/*
SELECT *
FROM IcmsSt_Impostos;
GO

IcmsST_ID	Produto_ID	Mva	Alíquota_ICMS
1	1	80.00	18.00
2	2	80.00	18.00
3	3	80.00	18.00
4	4	80.00	18.00
5	5	80.00	18.00
6	6	80.00	18.00
7	7	80.00	18.00
8	8	80.00	18.00
9	9	80.00	18.00
*/