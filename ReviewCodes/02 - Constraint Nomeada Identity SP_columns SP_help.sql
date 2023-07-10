/* CONECTANDO A UM BANCO */

USE EMPRESA
GO

/* CRIANDO TABELAS */
CREATE TABLE ALUNO(
	IDALUNO INT PRIMARY KEY IDENTITY,
	NOME VARCHAR(30) NOT NULL,
	SEXO CHAR(1) NOT NULL,
	NASCIMENTO DATE NOT NULL,
	EMAIL VARCHAR(30) UNIQUE
)
GO

/* CRIANDO CONSTRAINT POR FORA DA TABELA */
ALTER TABLE ALUNO
ADD CONSTRAINT CK_SEXO CHECK (SEXO IN('M', 'F'))
GO

/* RELACIONAMENTO 1 X 1 */
CREATE TABLE ENDERECO(
	IDENDERECO INT PRIMARY KEY IDENTITY(100,10),
	BAIRRO VARCHAR(30),
	UF CHAR(2) NOT NULL,
	CHECK (UF IN('RJ', 'SP', 'MG')),
	ID_ALUNO INT UNIQUE
)
GO

/* CRIANDO A FOREIGN KEY */
ALTER TABLE ENDERECO
ADD CONSTRAINT FK_ENDERECO_ALUNO
FOREIGN KEY(ID_ALUNO) REFERENCES ALUNO(IDALUNO)
GO

/* COMANDOS DE DESCRICAO */

/* PROCEDURES - JA CRIADAS E ARMAZENADAS NO SISTEMA */

SP_COLUMNS ALUNO
GO

SP_HELP ALUNO
GO

/* INSERINDO DADOS NAS TABELAS */

INSERT INTO ALUNO VALUES('ANDRE', 'M', '1999/12/30', 'ANDRE@GMAIL.COM')
INSERT INTO ALUNO VALUES('CARLOS', 'M', '2002/04/15', 'CARLOS@GMAIL.COM')
INSERT INTO ALUNO VALUES('MARIA', 'F', '1989/09/22', 'MARIA@GMAIL.COM')
INSERT INTO ALUNO VALUES('JULIA', 'F', '1995/01/15', 'JULIA@GMAIL.COM')
GO

SELECT *
FROM ALUNO