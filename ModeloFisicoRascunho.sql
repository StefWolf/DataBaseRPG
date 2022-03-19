-- Gera��o de Modelo f�sico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE ALIANCAS (
ID_Alianca NUMERIC(10) PRIMARY KEY,
Nome VARCHAR(10),
Sigla CHAR(2),
QTD_Reinos NUMERIC(10),
Descricao VARCHAR(10),
Fundacao DATETIME
)

CREATE TABLE RACA (
Nome VARCHAR(10),
ID_Raca NUMERIC(10) PRIMARY KEY,
Descricao VARCHAR(10),
ID_Mundo NUMERIC()
)

CREATE TABLE TIPOS_OLHOS (
ID_Tipos_Olhos NUMERIC(10) PRIMARY KEY,
Descricao VARCHAR(10),
Nome VARCHAR(10),
Tamanho DECIMAL(10)
)

CREATE TABLE DETALHES (
ID_Detalhes NUMERIC(10) PRIMARY KEY,
Nome VARCHAR(40)
)

CREATE TABLE APARENCIAS (
ID_Aparencia NUMERIC(10) PRIMARY KEY,
ID_Olho VARCHAR(10),
ID_Cabelo NUMERIC(10),
Altura VARCHAR(10),
Peso DECIMAL(10),
ID_Cor_Pele NUMERIC(10),
ID_Detalhe NUMERIC(),
ID_Vestimentas NUMERIC(),
FOREIGN KEY(ID_Detalhe) REFERENCES DETALHES (ID_Detalhes)
)

CREATE TABLE PESSOAS (
ID_Pessoa NUMERIC(10) PRIMARY KEY,
Nome VARCHAR(40),
Idade NUMERIC(10),
Sexo CHAR(2),
ID_Familia NUMERIC(10),
Dano DECIMAL(10),
ID_Raca NUMERIC(10),
Vida DECIMAL(10),
ID_Oficio NUMERIC(10),
ID_Moradia NUMERIC(10),
ID_Aparencia NUMERIC(10),
ID_Bolsa NUMERIC(10),
ID_Mundo NUMERIC(),
Nascimento DATETIME,
Moedas DECIMAL(100),
FOREIGN KEY(ID_Raca) REFERENCES RACA (ID_Raca),
FOREIGN KEY(ID_Aparencia) REFERENCES APARENCIAS (ID_Aparencia)
)

CREATE TABLE PATENTE (
Funcao VARCHAR(10),
ID_Patente NUMERIC(10) PRIMARY KEY,
Nome VARCHAR(40)
)

CREATE TABLE OFICIO (
Salario DECIMAL(10),
Funcao VARCHAR(10),
ID_Oficio NUMERIC(10) PRIMARY KEY,
ID_Local NUMERIC(),
Campo1 NUMERIC(),
FOREIGN KEY(Campo1) REFERENCES PATENTE (ID_Patente)
)

CREATE TABLE LOCAL (
ID_Local NUMERIC(10) PRIMARY KEY,
ID_Capital NUMERIC(),
Nome VARCHAR(40),
ID_Proprietario NUMERIC(),
Descricao VARCHAR(100),
Fundacao DATETIME,
ID_CategoriaLocal NUMERIC(),
Renda DECIMAL(9000),
FOREIGN KEY(ID_Proprietario) REFERENCES PESSOAS (ID_Pessoa)
)

CREATE TABLE ITENS (
ID_Itens NUMERIC(10) PRIMARY KEY,
ID_Categoria NUMERIC(10),
Nome VARCHAR(10),
Duracao DECIMAL(10),
Dano DECIMAL(10)
)

CREATE TABLE FAM�LIA (
ID_Familia NUMERIC(10) PRIMARY KEY,
Descricao VARCHAR(10),
Nome VARCHAR(10),
ID_Chefe NUMERIC(10),
QTD_Membros NUMERIC(10),
FOREIGN KEY(ID_Chefe) REFERENCES PESSOAS (ID_Pessoa)
)

CREATE TABLE CATEGORIA_LOCAL (
ID_CategoriaLocal NUMERIC(10) PRIMARY KEY,
Nome VARCHAR(10),
Funcao VARCHAR(100)
)

CREATE TABLE VENDA (
ID_Venda NUMERIC(10) PRIMARY KEY,
ID_Item NUMERIC(),
ID_Vendedor NUMERIC(),
Preco DECIMAL(100),
ID_Mercado NUMERIC(),
Data_Registro DATETIME,
FOREIGN KEY(ID_Item) REFERENCES ITENS (ID_Itens),
FOREIGN KEY(ID_Vendedor) REFERENCES PESSOAS (ID_Pessoa)
)

CREATE TABLE CABELOS (
ID_Cabelos NUMERIC(10) PRIMARY KEY,
Tamanho DECIMAL(10),
ID_Cor NUMERIC(10)
)

CREATE TABLE CATEGORIA_ITENS (
Descricao VARCHAR(500),
ID_Categoria NUMERIC(10) PRIMARY KEY,
Nome VARCHAR(30),
ID_TipoItem NUMERIC(10)
)

CREATE TABLE TIPO_ITEMPRIMARIO (
ID_TipoItem NUMERIC(10) PRIMARY KEY,
Nome NUMERIC(10),
Descricao VARCHAR(200)
)

CREATE TABLE CLASSE_OBJETOS (
ID_ClasseObjetos NUMERIC(10) PRIMARY KEY,
Nome VARCHAR(50)
)

CREATE TABLE CAPITAL (
Descricao VARCHAR(10),
m2 DECIMAL(10),
Nome VARCHAR(10),
ID_Reino VARCHAR(10),
Populacao NUMERIC(10),
ID_Capital NUMERIC(10) PRIMARY KEY,
ID_Mundo NUMERIC(10),
ID_Pessoa NUMERIC(10),
Fundacao DATETIME,
ID_Regiao NUMERIC(10),
FOREIGN KEY(ID_Pessoa) REFERENCES PESSOAS (ID_Pessoa)
)

CREATE TABLE CORES (
ID_Cor NUMERIC(10) PRIMARY KEY,
Codigo_Hexadecimal NUMERIC(10),
Nome VARCHAR(10)
)

CREATE TABLE VESTIMENTAS (
ID_Vestimentas NUMERIC(10) PRIMARY KEY,
Corpo NUMERIC(),
Calcado NUMERIC(),
Calca NUMERIC(),
Cabeca NUMERIC(),
Maos NUMERIC(),
FOREIGN KEY(Corpo) REFERENCES ITENS (ID_Itens),
FOREIGN KEY(Calcado) REFERENCES ITENS (ID_Itens),
FOREIGN KEY(Calca) REFERENCES ITENS (ID_Itens),
FOREIGN KEY(Cabeca) REFERENCES ITENS (ID_Itens),
FOREIGN KEY(Maos) REFERENCES ITENS (ID_Itens)
)

CREATE TABLE BOLSA (
ID_Bolsa NUMERIC(10) PRIMARY KEY,
ID_Itens NUMERIC(10),
ID_Itens2 NUMERIC(),
ID_Itens3 NUMERIC(),
ID_Itens4 NUMERIC(),
ID_Itens5 NUMERIC(),
ID_Itens6 NUMERIC(),
ID_Pessoa NUMERIC(),
FOREIGN KEY(ID_Itens) REFERENCES ITENS (ID_Itens),
FOREIGN KEY(ID_Itens2) REFERENCES ITENS (ID_Itens),
FOREIGN KEY(ID_Itens3) REFERENCES ITENS (ID_Itens),
FOREIGN KEY(ID_Itens4) REFERENCES ITENS (ID_Itens),
FOREIGN KEY(ID_Itens5) REFERENCES ITENS (ID_Itens),
FOREIGN KEY(ID_Itens6) REFERENCES ITENS (ID_Itens),
FOREIGN KEY(ID_Pessoa) REFERENCES PESSOAS (ID_Pessoa)
)

CREATE TABLE OLHOS (
ID_Olhos VARCHAR(10) PRIMARY KEY,
ID_Cor NUMERIC(10),
ID_Tipos_Olhos NUMERIC(10),
FOREIGN KEY(ID_Cor) REFERENCES CORES (ID_Cor),
FOREIGN KEY(ID_Tipos_Olhos) REFERENCES TIPOS_OLHOS (ID_Tipos_Olhos)
)

CREATE TABLE ANIMAIS (
Nome VARCHAR(50),
ID_Animal NUMERIC(10) PRIMARY KEY,
Status VARCHAR(50),
Vida DECIMAL(10),
ID_Mundo NUMERIC(),
ID_Especie NUMERIC(),
Sexo CHAR(1),
ID_Regiao NUMERIC(10),
Nascimento DATETIME
)

CREATE TABLE BIOMA (
Nome VARCHAR(30),
ID_Bioma NUMERIC(10) PRIMARY KEY,
Descricao VARCHAR(200)
)

CREATE TABLE REGIAO (
Nome VARCHAR(50),
ID_Regiao NUMERIC(10) PRIMARY KEY,
Descricao VARCHAR(200),
ID_Bioma N�mero(4)/*falha: chave estrangeira*/
)

CREATE TABLE LOG_ACOES_PESSOAS (
ID_LogPessoas NUMERIC(4) PRIMARY KEY,
Data DATETIME,
ID_Acao NUMERIC(),
ID_Pessoa NUMERIC(),
ID_Regiao NUMERIC(10),
ID_Local NUMERIC(),
FOREIGN KEY(ID_Pessoa) REFERENCES PESSOAS (ID_Pessoa),
FOREIGN KEY(ID_Regiao) REFERENCES REGIAO (ID_Regiao),
FOREIGN KEY(ID_Local) REFERENCES LOCAL (ID_Local)
)

CREATE TABLE OBJETOS (
ID_Objeto NUMERIC(10) PRIMARY KEY,
Nome VARCHAR(100),
Durabilidade DECIMAL(10),
Descricao VARCHAR(200),
ID_Regiao NUMERIC(10),
ID_ClasseObjetos NUMERIC(),
FOREIGN KEY(ID_Regiao) REFERENCES REGIAO (ID_Regiao),
FOREIGN KEY(ID_ClasseObjetos) REFERENCES CLASSE_OBJETOS (ID_ClasseObjetos)
)

CREATE TABLE MERCADO (
ID_Mercado NUMERIC(10) PRIMARY KEY,
ID_Proprietario NUMERIC(),
Descricao VARCHAR(200 ),
FOREIGN KEY(ID_Proprietario) REFERENCES PESSOAS (ID_Pessoa)
)

CREATE TABLE ESPECIE_ANIMAIS (
ID_EspecieAnimais NUMERIC(10) PRIMARY KEY,
Nome VARCHAR(50),
Descricao VARCHAR(200),
Categoria VARCHAR(30)
)

CREATE TABLE AUTENTICACAO (
ID_Login NUMERIC(3) PRIMARY KEY,
Usuario VARCHAR(50),
Senha VARCHAR(40)
)

CREATE TABLE DIALOGOS (
ID_Dialogo NUMERIC() PRIMARY KEY,
Dialogo VARCHAR(500),
ID_Pessoas NUMERIC(),
FOREIGN KEY(ID_Pessoas) REFERENCES PESSOAS (ID_Pessoa)
)

CREATE TABLE ACOES (
ID_Acoes NUMERIC(4) PRIMARY KEY,
Nome VARCHAR(100)
)

CREATE TABLE MAGIAS (
Nome VARCHAR(50),
ID_Magia N�mero(4) PRIMARY KEY,
ID_MagiasCategoria NUMERIC(),
Magia_Invocacao VARCHAR(100),
Descricao VARCHAR(200)
)

CREATE TABLE MAGIAS_CATEGORIA (
Nome VARCHAR(30),
ID_MagiaCategoria NUMERIC(4) PRIMARY KEY,
Descricao VARCHAR(200)
)

CREATE TABLE REINOS (
Nome VARCHAR(10),
Descricao VARCHAR(10),
ID_Reino VARCHAR(10) PRIMARY KEY,
ID_Alianca NUMERIC(10),
ID_Comandante NUMERIC(10),
Fundacao DATETIME,
ID_Regiao NUMERIC(10),
FOREIGN KEY(ID_Alianca) REFERENCES ALIANCAS (ID_Alianca),
FOREIGN KEY(ID_Comandante) REFERENCES PESSOAS (ID_Pessoa),
FOREIGN KEY(ID_Regiao) REFERENCES REGIAO (ID_Regiao)
)

CREATE TABLE MUNDO (
Nome VARCHAR(10),
ID_Mundo NUMERIC(10) PRIMARY KEY,
QTD_Reinos NUMERIC(10),
QTD_Capitais NUMERIC(10),
QTD_Populacao NUMERIC(10),
Descricao VARCHAR(500)
)

CREATE TABLE MATERIA_PRIMA (
ID_MateriaPrima NUMERIC(10) PRIMARY KEY,
Nome VARCHAR(40),
Durabilidade DECIMAL(10),
ID_Objeto NUMERIC(),
FOREIGN KEY(ID_Objeto) REFERENCES OBJETOS (ID_Objeto)
)

CREATE TABLE RELACAO_ITENS_MATERIAL (
ID_Item NUMERIC(),
ID_MateriaPrima NUMERIC(),
FOREIGN KEY(ID_Item) REFERENCES ITENS (ID_Itens),
FOREIGN KEY(ID_MateriaPrima) REFERENCES MATERIA_PRIMA (ID_MateriaPrima)
)

ALTER TABLE RACA ADD FOREIGN KEY(ID_Mundo) REFERENCES MUNDO (ID_Mundo)
ALTER TABLE APARENCIAS ADD FOREIGN KEY(ID_Olho) REFERENCES OLHOS (ID_Olhos)
ALTER TABLE APARENCIAS ADD FOREIGN KEY(ID_Cabelo) REFERENCES CABELOS (ID_Cabelos)
ALTER TABLE APARENCIAS ADD FOREIGN KEY(ID_Cor_Pele) REFERENCES CORES (ID_Cor)
ALTER TABLE APARENCIAS ADD FOREIGN KEY(ID_Vestimentas) REFERENCES VESTIMENTAS (ID_Vestimentas)
ALTER TABLE PESSOAS ADD FOREIGN KEY(ID_Familia) REFERENCES FAM�LIA (ID_Familia)
ALTER TABLE PESSOAS ADD FOREIGN KEY(ID_Oficio) REFERENCES OFICIO (ID_Oficio)
ALTER TABLE PESSOAS ADD FOREIGN KEY(ID_Moradia) REFERENCES CAPITAL (ID_Capital)
ALTER TABLE PESSOAS ADD FOREIGN KEY(ID_Bolsa) REFERENCES BOLSA (ID_Bolsa)
ALTER TABLE PESSOAS ADD FOREIGN KEY(ID_Mundo) REFERENCES MUNDO (ID_Mundo)
ALTER TABLE OFICIO ADD FOREIGN KEY(ID_Local) REFERENCES LOCAL (ID_Local)
ALTER TABLE LOCAL ADD FOREIGN KEY(ID_Capital) REFERENCES CAPITAL (ID_Capital)
ALTER TABLE LOCAL ADD FOREIGN KEY(ID_CategoriaLocal) REFERENCES CATEGORIA_LOCAL (ID_CategoriaLocal)
ALTER TABLE ITENS ADD FOREIGN KEY(ID_Categoria) REFERENCES CATEGORIA_ITENS (ID_Categoria)
ALTER TABLE VENDA ADD FOREIGN KEY(ID_Mercado) REFERENCES MERCADO (ID_Mercado)
ALTER TABLE CABELOS ADD FOREIGN KEY(ID_Cor) REFERENCES CORES (ID_Cor)
ALTER TABLE CATEGORIA_ITENS ADD FOREIGN KEY(ID_TipoItem) REFERENCES TIPO_ITEMPRIMARIO (ID_TipoItem)
ALTER TABLE CAPITAL ADD FOREIGN KEY(ID_Reino) REFERENCES REINOS (ID_Reino)
ALTER TABLE CAPITAL ADD FOREIGN KEY(ID_Mundo) REFERENCES MUNDO (ID_Mundo)
ALTER TABLE CAPITAL ADD FOREIGN KEY(ID_Regiao) REFERENCES REGIAO (ID_Regiao)
ALTER TABLE ANIMAIS ADD FOREIGN KEY(ID_Mundo) REFERENCES MUNDO (ID_Mundo)
ALTER TABLE ANIMAIS ADD FOREIGN KEY(ID_Especie) REFERENCES ESPECIE_ANIMAIS (ID_EspecieAnimais)
ALTER TABLE ANIMAIS ADD FOREIGN KEY(ID_Regiao) REFERENCES REGIAO (ID_Regiao)
ALTER TABLE LOG_ACOES_PESSOAS ADD FOREIGN KEY(ID_Acao) REFERENCES ACOES (ID_Acoes)
ALTER TABLE MAGIAS ADD FOREIGN KEY(ID_MagiasCategoria) REFERENCES MAGIAS_CATEGORIA (ID_MagiaCategoria)
