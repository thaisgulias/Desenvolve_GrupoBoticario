-- Normalização: A construção da lógica focou em um processo otimizado já sendo pensada no modelo terceira Forma Normal (3NF) 

CREATE DATABASE GBStore_DB;
USE GBStore_DB;

CREATE TABLE Produto ( 
    id INT PRIMARY KEY,
    nome VARCHAR(45),
    descricao VARCHAR(45),
    preco DECIMAL(10, 2),
    categoria VARCHAR(45)
); -- Criação tabela produto como atributos e índices 

CREATE TABLE Cliente (
    id INT PRIMARY KEY,
    nome VARCHAR(45),
    endereco VARCHAR(100),
    email VARCHAR(45),
    telefone VARCHAR(20),
    cpf INT
); -- Criação tabela Cliente como atributos e índices 

CREATE TABLE Venda (
    id INT PRIMARY KEY,
    data_venda DATE,
    valor_total DECIMAL(10, 2),
    cliente_id INT,
    FOREIGN KEY (cliente_id) REFERENCES Cliente(id)
); -- Criação tabela Venda como atributos e índices 

CREATE TABLE ItemVenda (
    id INT PRIMARY KEY,
    venda_id INT,
    produto_id INT,
    quantidade INT,
    preco_unitario DECIMAL(10, 2),
    FOREIGN KEY (venda_id) REFERENCES Venda(id),
    FOREIGN KEY (produto_id) REFERENCES Produto(id)
); -- Criação tabela Itens Venda como atributos e índices 

CREATE TABLE Pontuacao (
    cliente_id INT,
	itens_id INT,
    pontos_acumulados INT,
    data_validade DATE,
	data_criada DATE,
	PRIMARY KEY (cliente_id, itens_id)
    FOREIGN KEY (cliente_id) REFERENCES Cliente(id),
	FOREIGN KEY (itens_id) REFERENCES ItemVenda(id)
); -- Criação tabela Pontuação como atributos e índices 

CREATE TABLE Estoque (
    produto_id INT,
    quantidade_disponivel INT,
    localizacao VARCHAR(50),
    data_reposicao DATE,
    data_validade DATE,
	PRIMARY KEY (produto_id),
	FOREIGN KEY (produto_id) REFERENCES Produto(id)
);-- Criação tabela Estoque como atributos e índices 

