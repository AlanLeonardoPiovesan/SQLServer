--CATEGORIAS
INSERT INTO CATEGORIAS VALUES('1.0', 'TESTE', 'ENTRADA')
INSERT INTO CATEGORIAS VALUES('1.2', 'TESTE2', 'ENTRADA')
INSERT INTO CATEGORIAS VALUES('1.1', 'PRATICA', 'SAIDA')
INSERT INTO CATEGORIAS VALUES('1.3', 'PRATICA2', 'SAIDA')
GO

--LANCAMENTOS
INSERT INTO LANCAMENTOS VALUES('ENTRADA', '18/01/2023', 'ALAN LEONARDO', 1, 2000.00)
INSERT INTO LANCAMENTOS VALUES('ENTRADA', '18/01/2023', 'ALAN LEONARDO', 4, 2000.00)
INSERT INTO LANCAMENTOS VALUES('SAIDA', '18/01/2023', 'ALAN LEONARDO', 3, 1000.00)
INSERT INTO LANCAMENTOS VALUES('SAIDA', '18/01/2023', 'ALAN LEONARDO', 3, 1000.00)
INSERT INTO LANCAMENTOS VALUES('SAIDA', '19/01/2023', 'CIDA DA ROCHA', 3, 1000.00)
INSERT INTO LANCAMENTOS VALUES('SAIDA', '19/01/2023', 'ALISSON ROCHA', 1, 1000.00)
INSERT INTO LANCAMENTOS VALUES('ENTRADA', '19/01/2023', 'ADILAN PIOVESAN', 4, 1500.00)
INSERT INTO LANCAMENTOS VALUES('ENTRADA', '19/01/2023', 'LUCAS ELIEL', 4, 1500.00)
INSERT INTO LANCAMENTOS VALUES('AMBOS', '19/01/2023', 'LUCAS ELIEL', 4, 1500.00)
INSERT INTO LANCAMENTOS VALUES('AMBOS', '20/01/2023', 'ADILAN', 4, 1500.00)

--TESTANDO VISUALIZAÇÃO DOS DADOS
SELECT *
FROM ENTRADAS
GO

SELECT *
FROM SAIDAS
GO

SELECT *
FROM LANCAMENTOS
GO

SELECT *
FROM CATEGORIAS
GO
