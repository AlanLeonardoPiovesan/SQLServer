-- TRIGGER PARA ATUALIZAR TABELA ENTRADAS APÓS INSERT NA TABELA LANÇAMENTOS
CREATE TRIGGER TRG_INSERT_ENTRADAS
ON LANCAMENTOS
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO ENTRADAS (ID_REGISTRO, DATA, TIPO, PESSOA_EMPRESA, PLANODECONTAS, VALOR)
    SELECT IDREGISTRO, DATA, TIPO, PESSOA_EMPRESA, PLANODECONTAS, VALOR
    FROM inserted
    WHERE TIPO = 'ENTRADA'
END
GO

-- TRIGGER PARA ATUALIZAR TABELA SAIDAS APÓS INSERT NA TABELA LANÇAMENTOS
CREATE TRIGGER TRG_INSERT_SAIDAS
ON LANCAMENTOS
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO SAIDAS (ID_REGISTRO, DATA, TIPO, PESSOA_EMPRESA, PLANODECONTAS, VALOR)
    SELECT IDREGISTRO, DATA, TIPO, PESSOA_EMPRESA, PLANODECONTAS, VALOR
    FROM inserted
    WHERE TIPO = 'SAIDA'
END
GO

-- TRIGGER PARA NÃO ACEITAR INCLUSÃO DE LANCAMENTOS EM PLANODECONTAS COMO AMBOS
CREATE TRIGGER TRG_NAO_ACEITA_AMBOS
ON LANCAMENTOS
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @Tipo NVARCHAR(50);
    SELECT @Tipo = Tipo FROM inserted;

    IF (@Tipo = 'Ambos')
    BEGIN
        RAISERROR ('Valor inválido para o campo Tipo. "Ambos" não é permitido.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END

-- TRIGGER PARA DELETAR O LANCAMENTO NA TABELA ENTRADAS APÓS O DELETE NA TABELA LANCAMENTOS
CREATE TRIGGER TRG_DELETE_ENTRADAS
ON ENTRADAS
AFTER DELETE
AS
BEGIN
    SET NOCOUNT ON;
    DELETE FROM LANCAMENTOS
    WHERE IDREGISTRO IN (SELECT ID_REGISTRO FROM deleted)
END

-- TRIGGER PARA DELETAR O LANCAMENTO NA TABELA SAIDAS APÓS O DELETE NA TABELA LANCAMENTOS
CREATE TRIGGER TRG_DELETE_SAIDAS
ON SAIDAS
AFTER DELETE
AS
BEGIN
    SET NOCOUNT ON;
    DELETE FROM LANCAMENTOS
    WHERE IDREGISTRO IN (SELECT ID_REGISTRO FROM deleted)
END