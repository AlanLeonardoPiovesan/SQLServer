/* TSQL - É UM BLOCO DE LINGUAGEM DE PROGRAMACAO 
PROGRAMAS SAO UNIDADES QUE PODEM SER CHAMADAS DE BLOCOS ANONIMOS.
BLOCOS ANONIMOS NAO RECEBEM NOME, POIS NAO SAO SALVOS NO BANCO.
CRIAMOS BLOCOS ANONIMOS QUANDO IREMOS EXECUTA-LOS UMA SO VEZ OU TESTAR ALGO */

USE EMPRESA
GO

/* BLOCO DE EXECUÇÃO */
BEGIN
	PRINT 'PRIMEIRO BLOCO'
END
GO

/* BLOCOS DE ATRIBUIÇÃO DE VARIAVEIS */
DECLARE
	@CONTADOR INT
BEGIN
	SET @CONTADOR = 5
	PRINT @CONTADOR
END
GO

/* NO SQL SERVER CADA COLUNA VARIAVEL LOCAL EXPRESSAO E PARAMETRO TEM UM TIPO. */

DECLARE @V_NUMERO NUMERIC(10,2) = 100.52,
		@V_DATA DATETIME = '20170207'
BEGIN
	PRINT 'VALOR NUMERICO: ' + CAST(@V_NUMERO AS VARCHAR)
	PRINT 'VALOR NUMERICO: ' + CONVERT(VARCHAR, @V_NUMERO)
	PRINT 'VALOR DE DATA: ' + CAST(@V_DATA AS VARCHAR)
	PRINT 'VALOR DE DATA: ' + CONVERT(VARCHAR, @V_DATA, 121)
	PRINT 'VALOR DE DATA: ' + CONVERT(VARCHAR, @V_DATA, 120)
	PRINT 'VALOR DE DATA: ' + CONVERT(VARCHAR, @V_DATA, 105)
END
GO