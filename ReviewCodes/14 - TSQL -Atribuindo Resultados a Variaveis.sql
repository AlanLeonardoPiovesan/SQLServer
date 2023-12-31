/* ATRIBUINDO RESULTADOS EM VARIAVEIS */

USE EMPRESA
GO

CREATE TABLE CARROS(
	CARRO VARCHAR(30)
	FABRICANTE VARCHAR(30)
)
GO

INSERT INTO CARROS VALUES('KA', 'FORD')
INSERT INTO CARROS VALUES('FIESTA', 'FORD')
INSERT INTO CARROS VALUES('PRISMA', 'FORD')
INSERT INTO CARROS VALUES('CLIO', 'RENAULT')
INSERT INTO CARROS VALUES('SANDERO', 'RENAULT')
INSERT INTO CARROS VALUES('CHEVETE', 'CHEVROLET')
INSERT INTO CARROS VALUES('OMEGA', 'CHEVROLET')
INSERT INTO CARROS VALUES('PALIO', 'FIAT')
INSERT INTO CARROS VALUES('DOBLO', 'FIAT')
INSERT INTO CARROS VALUES('UNO', 'FIAT')
INSERT INTO CARROS VALUES('GOL', 'VOLKSWAGEN')
GO

DECLARE	@V_CONT_FORD INT,
		@V_CONT_FIAT INT
BEGIN
	-- METODO 1 - O SELECT PRECISA RETORNAR UMA SIMPLES COLUNA E UM SO RESULTADO
	SET @V_CONT_FORD = (SELECT COUNT(*)
							FROM CARROS 
							WHERE FABRICANTE = 'FORD')
	PRINT 'QUANTIDADE FORD: ' + CAST(@V_CONT_FORD AS VARCHAR)

	--METODO 2
	SELECT @V_CONT_FIAT = COUNT(*)
		FROM CARROS
		WHERE FABRICANTE = 'FIAT'
	PRINT 'QUANTIDADE FIAT: ' + CONVERT(VARCHAR, @V_CONT_FIAT)
END
GO