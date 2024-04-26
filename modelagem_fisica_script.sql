
CREATE TABLE Tb_PRODUTO (
                id_produto VARCHAR(20) NOT NULL,
                nome VARCHAR(50) NOT NULL,
                descricao VARCHAR(150) NOT NULL,
                preco REAL NOT NULL,
                ativo BOOLEAN DEFAULT TRUE NOT NULL,
                CONSTRAINT tb_produto_pk PRIMARY KEY (id_produto)
);


CREATE TABLE Tb_PROMOCAO (
                id_promocao VARCHAR(20) NOT NULL,
                nome VARCHAR(50) NOT NULL,
                descricao VARCHAR(100),
                desconto REAL NOT NULL,
                id_produto VARCHAR(20) NOT NULL,
                CONSTRAINT tb_promocao_pk PRIMARY KEY (id_promocao)
);


CREATE TABLE Tb_CATEGORIA (
                id_categoria VARCHAR(20) NOT NULL,
                nome VARCHAR(50) NOT NULL,
                descricao VARCHAR(150) NOT NULL,
                ativo BOOLEAN DEFAULT TRUE NOT NULL,
                id_produto VARCHAR(20) NOT NULL,
                CONSTRAINT tb_categoria_pk PRIMARY KEY (id_categoria)
);


CREATE TABLE Tb_FORNECEDOR (
                id_fornecedor VARCHAR(20) NOT NULL,
                nome VARCHAR(50) NOT NULL,
                email VARCHAR(50) NOT NULL,
                ativo BOOLEAN DEFAULT TRUE NOT NULL,
                id_produto VARCHAR(20) NOT NULL,
                CONSTRAINT tb_fornecedor_pk PRIMARY KEY (id_fornecedor)
);


CREATE TABLE Tb_ESTOQUE (
                id_produto VARCHAR(20) NOT NULL,
                qtd_estoque INTEGER NOT NULL,
                localizacao VARCHAR(50) NOT NULL,
                CONSTRAINT tb_estoque_pk PRIMARY KEY (id_produto)
);


CREATE TABLE Tb_DEPARTAMENTO (
                id_departemento VARCHAR(20) NOT NULL,
                nome VARCHAR(50) NOT NULL,
                ativo BOOLEAN DEFAULT TRUE NOT NULL,
                CONSTRAINT tb_departamento_pk PRIMARY KEY (id_departemento)
);


CREATE TABLE Tb_FUNCIONARIO (
                id_funcionario VARCHAR(20) NOT NULL,
                nome VARCHAR(100) NOT NULL,
                cargo VARCHAR(30) NOT NULL,
                id_departemento VARCHAR(20) NOT NULL,
                CONSTRAINT tb_funcionario_pk PRIMARY KEY (id_funcionario)
);


CREATE TABLE Tb_CLIENTE (
                id_cliente VARCHAR(20) NOT NULL,
                nome VARCHAR(100) NOT NULL,
                endereco VARCHAR(150) NOT NULL,
                telefone VARCHAR(14) NOT NULL,
                email VARCHAR(50) NOT NULL,
                CONSTRAINT tb_cliente_pk PRIMARY KEY (id_cliente)
);


CREATE TABLE Tb_PEDIDO (
                id_pedido VARCHAR(20) NOT NULL,
                data DATE NOT NULL,
                status VARCHAR(50) NOT NULL,
                id_cliente VARCHAR(20) NOT NULL,
                id_funcionario VARCHAR(20) NOT NULL,
                CONSTRAINT tb_pedido_pk PRIMARY KEY (id_pedido)
);


CREATE TABLE Tb_ITEM_PEDIDO (
                id_pedido VARCHAR(20) NOT NULL,
                id_produto VARCHAR(20) NOT NULL,
                quantidade INTEGER NOT NULL,
                total_item REAL NOT NULL,
                CONSTRAINT tb_item_pedido_pk PRIMARY KEY (id_pedido, id_produto)
);


CREATE TABLE Tb_TRANSACAO (
                id_transacao VARCHAR(20) NOT NULL,
                metodo_pagamento VARCHAR(20) NOT NULL,
                total_pedido REAL NOT NULL,
                data DATE NOT NULL,
                hora TIME NOT NULL,
                id_pedido VARCHAR(20) NOT NULL,
                CONSTRAINT tb_transacao_pk PRIMARY KEY (id_transacao)
);


CREATE TABLE Tb_PONTUACAO (
                id_cliente VARCHAR(20) NOT NULL,
                pontuacao_acumulada INTEGER DEFAULT 0 NOT NULL,
                CONSTRAINT tb_pontuacao_pk PRIMARY KEY (id_cliente)
);


CREATE TABLE Tb_HISTORICO (
                id_historico VARCHAR(20) NOT NULL,
                data_hora DATE NOT NULL,
                pontos_recebidos_gasto INTEGER NOT NULL,
                descricao VARCHAR,
                id_cliente VARCHAR(20) NOT NULL,
                CONSTRAINT tb_historico_pk PRIMARY KEY (id_historico)
);


ALTER TABLE Tb_ITEM_PEDIDO ADD CONSTRAINT tb_produto_tb_item_pedido_fk
FOREIGN KEY (id_produto)
REFERENCES Tb_PRODUTO (id_produto)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Tb_ESTOQUE ADD CONSTRAINT tb_produto_tb_estoque_fk
FOREIGN KEY (id_produto)
REFERENCES Tb_PRODUTO (id_produto)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Tb_FORNECEDOR ADD CONSTRAINT tb_produto_tb_fornecedor_fk
FOREIGN KEY (id_produto)
REFERENCES Tb_PRODUTO (id_produto)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Tb_CATEGORIA ADD CONSTRAINT tb_produto_tb_categoria_fk
FOREIGN KEY (id_produto)
REFERENCES Tb_PRODUTO (id_produto)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Tb_PROMOCAO ADD CONSTRAINT tb_produto_tb_promocao_fk
FOREIGN KEY (id_produto)
REFERENCES Tb_PRODUTO (id_produto)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Tb_FUNCIONARIO ADD CONSTRAINT tb_departamento_tb_funcionario_fk
FOREIGN KEY (id_departemento)
REFERENCES Tb_DEPARTAMENTO (id_departemento)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Tb_PEDIDO ADD CONSTRAINT tb_funcionario_tb_pedido_fk
FOREIGN KEY (id_funcionario)
REFERENCES Tb_FUNCIONARIO (id_funcionario)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Tb_PONTUACAO ADD CONSTRAINT tb_cliente_tb_pontuacao_fk
FOREIGN KEY (id_cliente)
REFERENCES Tb_CLIENTE (id_cliente)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Tb_PEDIDO ADD CONSTRAINT tb_cliente_tb_pedido_fk
FOREIGN KEY (id_cliente)
REFERENCES Tb_CLIENTE (id_cliente)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Tb_TRANSACAO ADD CONSTRAINT tb_pedido_tb_transacao_fk
FOREIGN KEY (id_pedido)
REFERENCES Tb_PEDIDO (id_pedido)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Tb_ITEM_PEDIDO ADD CONSTRAINT tb_pedido_tb_item_pedido_fk
FOREIGN KEY (id_pedido)
REFERENCES Tb_PEDIDO (id_pedido)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Tb_HISTORICO ADD CONSTRAINT tb_pontuacao_tb_historico_fk
FOREIGN KEY (id_cliente)
REFERENCES Tb_PONTUACAO (id_cliente)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;