CREATE DATABASE FLUXODECAIXA
GO

USE FLUXODECAIXA
GO

CREATE TABLE CATEGORIAS(
	IDCATEGORIA INT PRIMARY KEY IDENTITY,
	ESTRUTURA VARCHAR(50) NOT NULL,
	PLANODECONTAS VARCHAR(50) NOT NULL,
	TIPO VARCHAR(20) NOT NULL
		CHECK(TIPO IN('ENTRADA', 'SAIDA', 'AMBOS'))
)
GO

CREATE TABLE LANCAMENTOS(
	IDREGISTRO INT PRIMARY KEY IDENTITY,
	TIPO VARCHAR(20) NOT NULL
		CHECK(TIPO IN('ENTRADA', 'SAIDA')),
	DATA DATE NOT NULL,
	PESSOA_EMPRESA VARCHAR(50) NOT NULL,
	PLANODECONTAS INT NOT NULL,
	VALOR NUMERIC(10,2) NOT NULL
)
GO

--ADICIONAR FOREIGN KEY NO CAMPO PLANO DE CONTAS DA TABELA CATEGORIAS
ALTER TABLE LANCAMENTOS
ADD FOREIGN KEY (PLANODECONTAS) REFERENCES CATEGORIAS(IDCATEGORIA)
GO

-- CRIAÇÃO DA TABELAS ENTRADAS QUE RECEBERA OS VALORES DA TABELA LANCAMENTOS
CREATE TABLE ENTRADAS(
	ID_ENTRADA INT PRIMARY KEY IDENTITY,
	ID_REGISTRO INT NOT NULL,
	DATA DATE NOT NULL,
	TIPO VARCHAR(20) NOT NULL
		CHECK(TIPO IN('ENTRADA')),
	PESSOA_EMPRESA VARCHAR(50) NOT NULL,
	PLANODECONTAS INT NOT NULL,
	VALOR NUMERIC(10,2) NOT NULL
)
GO

--ADICIONAR FOREIGN KEY NO CAMPO ID_REGISTRO PARA TABELA LANÇAMENTOS
ALTER TABLE ENTRADAS
ADD FOREIGN KEY (ID_REGISTRO) REFERENCES LANCAMENTOS(IDREGISTRO)
GO

--ADICIONAR FOREIGN KEY NO CAMPO PLANODECONTAS PARA TABELA CATEGORIAS
ALTER TABLE ENTRADAS
ADD FOREIGN KEY (PLANODECONTAS) REFERENCES CATEGORIAS(IDCATEGORIA)
GO


CREATE TABLE SAIDAS(
	ID_SAIDA INT PRIMARY KEY IDENTITY,
	ID_REGISTRO INT NOT NULL,
	DATA DATE NOT NULL,
	TIPO VARCHAR(20) NOT NULL
		CHECK(TIPO IN('SAIDA')),
	PESSOA_EMPRESA VARCHAR(50) NOT NULL,
	PLANODECONTAS INT NOT NULL,
	VALOR NUMERIC(10,2) NOT NULL
)
GO

--ADICIONAR FOREIGN KEY NO CAMPO ID_REGISTRO PARA TABELA LANÇAMENTOS
ALTER TABLE SAIDAS
ADD FOREIGN KEY (ID_REGISTRO) REFERENCES LANCAMENTOS(IDREGISTRO)
GO

--ADICIONAR FOREIGN KEY NO CAMPO PLANODECONTAS PARA TABELA CATEGORIAS
ALTER TABLE SAIDAS
ADD FOREIGN KEY (PLANODECONTAS) REFERENCES CATEGORIAS(IDCATEGORIA)
GO