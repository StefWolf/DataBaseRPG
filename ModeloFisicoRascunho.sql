-- Gera��o de Modelo f�sico
-- Sql ANSI 2003 - brModelo.
CREATE TABLE ALIANCAS (
ID_Alianca INT(10) PRIMARY KEY AUTO_INCREMENT,
Nome VARCHAR(10) NOT NULL,
Sigla CHAR(2) NOT NULL,
QTD_Reinos INT(10),
Descricao VARCHAR(10) NOT NULL,
Fundacao DATETIME
);

CREATE TABLE RACA (
ID_Raca INT(10) PRIMARY KEY AUTO_INCREMENT,
Nome VARCHAR(10) NOT NULL,
Descricao VARCHAR(10) NOT NULL,
ID_Mundo INT()
);

CREATE TABLE TIPOS_OLHOS (
ID_Tipos_Olhos INT(10) PRIMARY KEY AUTO_INCREMENT,
Descricao VARCHAR(10) NOT NULL,
Nome VARCHAR(10) NOT NULL,
Tamanho DECIMAL(10) NOT NULL
);

CREATE TABLE DETALHES (
ID_Detalhes INT(10) PRIMARY KEY AUTO_INCREMENT,
Nome VARCHAR(40) NOT NULL
);

CREATE TABLE APARENCIAS (
ID_Aparencia INT(10) PRIMARY KEY AUTO_INCREMENT,
ID_Olho INT(10),
ID_Cabelo INT(10),
Altura VARCHAR(10),
Peso DECIMAL(10) NOT NULL,
ID_Cor_Pele INT(10),
ID_Detalhe INT(10),
ID_Vestimentas INT(10),
FOREIGN KEY(ID_Detalhe) REFERENCES DETALHES (ID_Detalhes)
);

CREATE TABLE PESSOAS (
ID_Pessoa INT(10) PRIMARY KEY AUTO_INCREMENT,
Nome VARCHAR(40) NOT NULL,
Idade INT(10) NOT NULL,
Sexo CHAR(2) NOT NULL,
ID_Familia INT(10),
Dano DECIMAL(10) NOT NULL,
ID_Raca INT(10),
Vida DECIMAL(10),
ID_Oficio INT(10),
ID_Moradia INT(10),
ID_Aparencia INT(10),
ID_Bolsa INT(10),
ID_Mundo INT(10),
Nascimento DATETIME NOT NULL,
Moedas DECIMAL(100) NULL,
FOREIGN KEY(ID_Raca) REFERENCES RACA (ID_Raca),
FOREIGN KEY(ID_Aparencia) REFERENCES APARENCIAS (ID_Aparencia)
);

CREATE TABLE PATENTE (
ID_Patente INT(10) PRIMARY KEY AUTO_INCREMENT,
Funcao VARCHAR(100), /*---MUD*/
Nome VARCHAR(40)
);

CREATE TABLE OFICIO (
ID_Oficio INT(10) PRIMARY KEY AUTO_INCREMENT,
Salario DECIMAL(10),
Funcao VARCHAR(100),
ID_Local INT(10),
ID_Patente INT(10),
FOREIGN KEY(ID_Patente) REFERENCES PATENTE (ID_Patente)
);

CREATE TABLE LOCAL (
ID_Local INT(10) PRIMARY KEY AUTO_INCREMENT,
ID_Capital INT(10),
Nome VARCHAR(40),
ID_Proprietario INT(10),
Descricao VARCHAR(100),
Fundacao DATETIME,
ID_CategoriaLocal INT(10),
Renda DECIMAL(50),
FOREIGN KEY(ID_Proprietario) REFERENCES PESSOAS (ID_Pessoa)
);

CREATE TABLE ITENS (
ID_Itens INT(10) PRIMARY KEY AUTO_INCREMENT,
ID_Categoria INT(10),
Nome VARCHAR(10),
Duracao DECIMAL(10),
Dano DECIMAL(10)
);

CREATE TABLE FAMILIA (
ID_Familia INT(10) PRIMARY KEY AUTO_INCREMENT,
Descricao VARCHAR(100),
Nome VARCHAR(10),
ID_Chefe INT(10),
QTD_Membros INT(10),
FOREIGN KEY(ID_Chefe) REFERENCES PESSOAS (ID_Pessoa)
);

CREATE TABLE CATEGORIA_LOCAL (
ID_CategoriaLocal INT(10) PRIMARY KEY AUTO_INCREMENT,
Nome VARCHAR(10),
Funcao VARCHAR(100)
);

CREATE TABLE VENDA (
ID_Venda INT(10) PRIMARY KEY AUTO_INCREMENT,
ID_Item INT(10),
ID_Vendedor INT(10),
Preco DECIMAL(50),
ID_Mercado INT(10),
Data_Registro DATETIME,
FOREIGN KEY(ID_Item) REFERENCES ITENS (ID_Itens),
FOREIGN KEY(ID_Vendedor) REFERENCES PESSOAS (ID_Pessoa)
);

CREATE TABLE CABELOS (
ID_Cabelos INT(10) PRIMARY KEY AUTO_INCREMENT,
Tamanho DECIMAL(10),
ID_Cor INT(10)
);

CREATE TABLE CATEGORIA_ITENS (
ID_Categoria INT(10) PRIMARY KEY AUTO_INCREMENT,
Descricao VARCHAR(500),
Nome VARCHAR(30),
ID_TipoItem INT(10)
);

CREATE TABLE TIPO_ITEMPRIMARIO (
ID_TipoItem INT(10) PRIMARY KEY AUTO_INCREMENT,
Nome VARCHAR(40), /*---*/
Descricao VARCHAR(200)
);

CREATE TABLE CLASSE_OBJETOS (
ID_ClasseObjetos INT(10) PRIMARY KEY AUTO_INCREMENT,
Nome VARCHAR(50)
);

CREATE TABLE CAPITAL (
ID_Capital INT(10) PRIMARY KEY AUTO_INCREMENT,
Descricao VARCHAR(10),
m2 DECIMAL(10),
Nome VARCHAR(10),
ID_Reino INT(10),
Populacao INT(10),
ID_Mundo INT(10),
ID_Pessoa INT(10),
Fundacao DATETIME,
ID_Regiao INT(10),
FOREIGN KEY(ID_Pessoa) REFERENCES PESSOAS (ID_Pessoa)
);

CREATE TABLE CORES (
ID_Cor INT(10) PRIMARY KEY AUTO_INCREMENT,
Codigo_Hexadecimal INT(10),
Nome VARCHAR(10)
);

CREATE TABLE VESTIMENTAS (
ID_Vestimentas INT(10) PRIMARY KEY AUTO_INCREMENT,
Corpo INT(10),
Calcado INT(10),
Calca INT(10),
Cabeca INT(10),
Maos INT(10),
FOREIGN KEY(Corpo) REFERENCES ITENS (ID_Itens),
FOREIGN KEY(Calcado) REFERENCES ITENS (ID_Itens),
FOREIGN KEY(Calca) REFERENCES ITENS (ID_Itens),
FOREIGN KEY(Cabeca) REFERENCES ITENS (ID_Itens),
FOREIGN KEY(Maos) REFERENCES ITENS (ID_Itens)
);

CREATE TABLE BOLSA (
ID_Bolsa INT(10) PRIMARY KEY AUTO_INCREMENT,
ID_Itens INT(10),
ID_Itens2 INT(10),
ID_Itens3 INT(10),
ID_Itens4 INT(10),
ID_Itens5 INT(10),
ID_Itens6 INT(10),
ID_Pessoa INT(10),
FOREIGN KEY(ID_Itens) REFERENCES ITENS (ID_Itens),
FOREIGN KEY(ID_Itens2) REFERENCES ITENS (ID_Itens),
FOREIGN KEY(ID_Itens3) REFERENCES ITENS (ID_Itens),
FOREIGN KEY(ID_Itens4) REFERENCES ITENS (ID_Itens),
FOREIGN KEY(ID_Itens5) REFERENCES ITENS (ID_Itens),
FOREIGN KEY(ID_Itens6) REFERENCES ITENS (ID_Itens),
FOREIGN KEY(ID_Pessoa) REFERENCES PESSOAS (ID_Pessoa)
);

CREATE TABLE OLHOS (
ID_Olhos INT(10) PRIMARY KEY AUTO_INCREMENT,
ID_Cor INT(10),
ID_Tipos_Olhos INT(10),
FOREIGN KEY(ID_Cor) REFERENCES CORES (ID_Cor),
FOREIGN KEY(ID_Tipos_Olhos) REFERENCES TIPOS_OLHOS (ID_Tipos_Olhos)
);

CREATE TABLE ANIMAIS (
ID_Animal INT(10) PRIMARY KEY AUTO_INCREMENT,
Nome VARCHAR(50),
Status VARCHAR(50),
Vida DECIMAL(10),
ID_Mundo INT(10),
ID_Especie INT(10),
Sexo CHAR(1),
ID_Regiao INT(10),
Nascimento DATETIME
);

CREATE TABLE BIOMA (
ID_Bioma INT(10) PRIMARY KEY AUTO_INCREMENT,
Nome VARCHAR(30),
Descricao VARCHAR(200)
);

CREATE TABLE REGIAO (
ID_Regiao INT(10) PRIMARY KEY AUTO_INCREMENT,
Nome VARCHAR(50),
Descricao VARCHAR(200),
ID_Bioma INT(10)/*falha: chave estrangeira*/
);

CREATE TABLE LOG_ACOES_PESSOAS (
ID_LogPessoas INT(10) PRIMARY KEY AUTO_INCREMENT,
Data DATETIME,
ID_Acao INT(10),
ID_Pessoa INT(10),
ID_Regiao INT(10),
ID_Local INT(10),
FOREIGN KEY(ID_Pessoa) REFERENCES PESSOAS (ID_Pessoa),
FOREIGN KEY(ID_Regiao) REFERENCES REGIAO (ID_Regiao),
FOREIGN KEY(ID_Local) REFERENCES LOCAL (ID_Local)
);

CREATE TABLE OBJETOS (
ID_Objeto INT(10) PRIMARY KEY AUTO_INCREMENT,
Nome VARCHAR(100),
Durabilidade DECIMAL(10),
Descricao VARCHAR(200),
ID_Regiao INT(10),
ID_ClasseObjetos INT(10),
FOREIGN KEY(ID_Regiao) REFERENCES REGIAO (ID_Regiao),
FOREIGN KEY(ID_ClasseObjetos) REFERENCES CLASSE_OBJETOS (ID_ClasseObjetos)
);

CREATE TABLE MERCADO (
ID_Mercado INT(10) PRIMARY KEY AUTO_INCREMENT,
ID_Proprietario INT(10),
Descricao VARCHAR(200 ),
FOREIGN KEY(ID_Proprietario) REFERENCES PESSOAS (ID_Pessoa)
);

CREATE TABLE ESPECIE_ANIMAIS (
ID_EspecieAnimais INT(10) PRIMARY KEY AUTO_INCREMENT,
Nome VARCHAR(50),
Descricao VARCHAR(200),
Categoria VARCHAR(30)
);

CREATE TABLE AUTENTICACAO (
ID_Login INT(3) PRIMARY KEY AUTO_INCREMENT,
Usuario VARCHAR(50),
Senha VARCHAR(40)
);

CREATE TABLE DIALOGOS (
ID_Dialogo INT(10) PRIMARY KEY AUTO_INCREMENT,
Dialogo VARCHAR(500),
ID_Pessoas INT(10),
FOREIGN KEY(ID_Pessoas) REFERENCES PESSOAS (ID_Pessoa)
);

CREATE TABLE ACOES (
ID_Acoes INT(10) PRIMARY KEY AUTO_INCREMENT,
Nome VARCHAR(100)
);
CREATE TABLE MAGIAS (
ID_Magia INT(10) PRIMARY KEY AUTO_INCREMENT,
Nome VARCHAR(50),
ID_MagiasCategoria INT(10),
Magia_Invocacao VARCHAR(100),
Descricao VARCHAR(200)
);

CREATE TABLE MAGIAS_CATEGORIA (
ID_MagiaCategoria INT(10) PRIMARY KEY AUTO_INCREMENT,
Nome VARCHAR(30),
Descricao VARCHAR(200)
);

CREATE TABLE REINOS (
ID_Reino INT(10) PRIMARY KEY AUTO_INCREMENT, /*---*/
Nome VARCHAR(10),
Descricao VARCHAR(10),
ID_Alianca INT(10),
ID_Comandante INT(10),
Fundacao DATETIME,
ID_Regiao INT(10),
FOREIGN KEY(ID_Alianca) REFERENCES ALIANCAS (ID_Alianca),
FOREIGN KEY(ID_Comandante) REFERENCES PESSOAS (ID_Pessoa),
FOREIGN KEY(ID_Regiao) REFERENCES REGIAO (ID_Regiao)
);

CREATE TABLE MUNDO (
ID_Mundo INT(10) PRIMARY KEY AUTO_INCREMENT,
Nome VARCHAR(10),
QTD_Reinos INT(10),
QTD_Capitais INT(10),
QTD_Populacao INT(10),
Descricao VARCHAR(500)
);

CREATE TABLE MATERIA_PRIMA (
ID_MateriaPrima INT(10) PRIMARY KEY AUTO_INCREMENT,
Nome VARCHAR(40),
Durabilidade DECIMAL(10),
ID_Objeto INT(10),
FOREIGN KEY(ID_Objeto) REFERENCES OBJETOS (ID_Objeto)
);

CREATE TABLE RELACAO_ITENS_MATERIAL (
ID_Item INT(10),
ID_MateriaPrima INT(10),
FOREIGN KEY(ID_Item) REFERENCES ITENS (ID_Itens),
FOREIGN KEY(ID_MateriaPrima) REFERENCES MATERIA_PRIMA (ID_MateriaPrima)
);

ALTER TABLE RACA ADD FOREIGN KEY(ID_Mundo) REFERENCES MUNDO (ID_Mundo);
ALTER TABLE APARENCIAS ADD FOREIGN KEY(ID_Olho) REFERENCES OLHOS (ID_Olhos);
ALTER TABLE APARENCIAS ADD FOREIGN KEY(ID_Cabelo) REFERENCES CABELOS (ID_Cabelos);
ALTER TABLE APARENCIAS ADD FOREIGN KEY(ID_Cor_Pele) REFERENCES CORES (ID_Cor);
ALTER TABLE APARENCIAS ADD FOREIGN KEY(ID_Vestimentas) REFERENCES VESTIMENTAS (ID_Vestimentas);
ALTER TABLE PESSOAS ADD FOREIGN KEY(ID_Familia) REFERENCES FAMILIA (ID_Familia);
ALTER TABLE PESSOAS ADD FOREIGN KEY(ID_Oficio) REFERENCES OFICIO (ID_Oficio);
ALTER TABLE PESSOAS ADD FOREIGN KEY(ID_Moradia) REFERENCES CAPITAL (ID_Capital);
ALTER TABLE PESSOAS ADD FOREIGN KEY(ID_Bolsa) REFERENCES BOLSA (ID_Bolsa);
ALTER TABLE PESSOAS ADD FOREIGN KEY(ID_Mundo) REFERENCES MUNDO (ID_Mundo);
ALTER TABLE OFICIO ADD FOREIGN KEY(ID_Local) REFERENCES LOCAL (ID_Local);
ALTER TABLE LOCAL ADD FOREIGN KEY(ID_Capital) REFERENCES CAPITAL (ID_Capital);
ALTER TABLE LOCAL ADD FOREIGN KEY(ID_CategoriaLocal) REFERENCES CATEGORIA_LOCAL (ID_CategoriaLocal);
ALTER TABLE ITENS ADD FOREIGN KEY(ID_Categoria) REFERENCES CATEGORIA_ITENS (ID_Categoria);
ALTER TABLE VENDA ADD FOREIGN KEY(ID_Mercado) REFERENCES MERCADO (ID_Mercado);
ALTER TABLE CABELOS ADD FOREIGN KEY(ID_Cor) REFERENCES CORES (ID_Cor);
ALTER TABLE CATEGORIA_ITENS ADD FOREIGN KEY(ID_TipoItem) REFERENCES TIPO_ITEMPRIMARIO (ID_TipoItem);
ALTER TABLE CAPITAL ADD FOREIGN KEY(ID_Reino) REFERENCES REINOS (ID_Reino);
ALTER TABLE CAPITAL ADD FOREIGN KEY(ID_Mundo) REFERENCES MUNDO (ID_Mundo);
ALTER TABLE CAPITAL ADD FOREIGN KEY(ID_Regiao) REFERENCES REGIAO (ID_Regiao);
ALTER TABLE ANIMAIS ADD FOREIGN KEY(ID_Mundo) REFERENCES MUNDO (ID_Mundo);
ALTER TABLE ANIMAIS ADD FOREIGN KEY(ID_Especie) REFERENCES ESPECIE_ANIMAIS (ID_EspecieAnimais);
ALTER TABLE ANIMAIS ADD FOREIGN KEY(ID_Regiao) REFERENCES REGIAO (ID_Regiao);
ALTER TABLE LOG_ACOES_PESSOAS ADD FOREIGN KEY(ID_Acao) REFERENCES ACOES (ID_Acoes);
ALTER TABLE MAGIAS ADD FOREIGN KEY(ID_MagiasCategoria) REFERENCES MAGIAS_CATEGORIA (ID_MagiaCategoria);

/* MODIFICAÇÕES PARA AJUSTE DE ERROS */
ALTER TABLE cores MODIFY Codigo_Hexadecimal VARCHAR(30) NOT NULL;

ALTER TABLE animais ADD ID_Cor INT(10) NOT NULL;
ALTER TABLE animais ADD FOREIGN KEY(ID_Cor) REFERENCES cores (ID_Cor);
ALTER TABLE cabelos ADD textura varchar(30) NOT NULL
