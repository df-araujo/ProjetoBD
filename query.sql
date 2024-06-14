CREATE TABLE Cartas (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(255) NOT NULL,
    Tipo VARCHAR(50),
    Raridade VARCHAR(50),
    Expansao VARCHAR(100),
    Condicao VARCHAR(50),
    PrecoCompra DECIMAL(10, 2),
    PrecoVenda DECIMAL(10, 2),
    QuantidadeEstoque INT
);

CREATE TABLE Clientes (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(255) NOT NULL,
    Endereco VARCHAR(255),
    Telefone VARCHAR(20),
    Email VARCHAR(100)
);

CREATE TABLE Vendas (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    ClienteID INT,
    DataVenda DATE,
    TotalVenda DECIMAL(10, 2),
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ID)
);

CREATE TABLE ItensVenda (
    VendaID INT,
    CartaID INT,
    Quantidade INT,
    PrecoUnitario DECIMAL(10, 2),
    FOREIGN KEY (VendaID) REFERENCES Vendas(ID),
    FOREIGN KEY (CartaID) REFERENCES Cartas(ID)
);

-- Inserção de Cartas
INSERT INTO Cartas (Nome, Tipo, Raridade, Expansao, Condicao, PrecoCompra, PrecoVenda, QuantidadeEstoque)
VALUES
('Charizard', 'Fogo', 'Rara', 'Base Set', 'Novo', 150.00, 200.00, 10),
('Blastoise', 'Água', 'Rara', 'Base Set', 'Usado', 100.00, 150.00, 5),
('Pikachu', 'Elétrico', 'Comum', 'Jungle', 'Novo', 5.00, 10.00, 50),
('Mewtwo', 'Psíquico', 'Ultra Rara', 'Base Set', 'Novo', 200.00, 300.00, 2),
('Gengar', 'Fantasma', 'Rara', 'Fossil', 'Usado', 50.00, 80.00, 8);

-- Inserção de Clientes
INSERT INTO Clientes (Nome, Endereco, Telefone, Email)
VALUES
('João Silva', 'Rua A, 123', '1111-1111', 'joao@example.com'),
('Maria Oliveira', 'Rua B, 456', '2222-2222', 'maria@example.com'),
('Carlos Santos', 'Rua C, 789', '3333-3333', 'carlos@example.com'),
('Ana Costa', 'Rua D, 101', '4444-4444', 'ana@example.com'),
('Pedro Lima', 'Rua E, 202', '5555-5555', 'pedro@example.com');

-- Exemplo de Venda
INSERT INTO Vendas (ClienteID, DataVenda, TotalVenda)
VALUES
(1, '2024-06-01', 410.00);

INSERT INTO ItensVenda (VendaID, CartaID, Quantidade, PrecoUnitario)
VALUES
(1, 1, 1, 200.00),
(1, 2, 1, 150.00),
(1, 3, 3, 10.00);

-- Exemplo de Compra
INSERT INTO Compras (ClienteID, DataCompra, TotalCompra)
VALUES
(2, '2024-06-02', 100.00);

INSERT INTO ItensCompra (CompraID, CartaID, Quantidade, PrecoUnitario)
VALUES
(1, 5, 2, 50.00);

-- Exemplo de Troca
INSERT INTO Trocas (ClienteID, DataTroca)
VALUES
(3, '2024-06-03');

INSERT INTO ItensTroca (TrocaID, CartaOferecidaID, CartaRecebidaID)
VALUES
(1, 4, 1);


CREATE TABLE Compras (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    ClienteID INT,
    DataCompra DATE,
    TotalCompra DECIMAL(10, 2),
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ID)
);

CREATE TABLE ItensCompra (
    CompraID INT,
    CartaID INT,
    Quantidade INT,
    PrecoUnitario DECIMAL(10, 2),
    FOREIGN KEY (CompraID) REFERENCES Compras(ID),
    FOREIGN KEY (CartaID) REFERENCES Cartas(ID)
);

CREATE TABLE Trocas (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    ClienteID INT,
    DataTroca DATE,
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ID)
);

CREATE TABLE ItensTroca (
    TrocaID INT,
    CartaOferecidaID INT,
    CartaRecebidaID INT,
    FOREIGN KEY (TrocaID) REFERENCES Trocas(ID),
    FOREIGN KEY (CartaOferecidaID) REFERENCES Cartas(ID),
    FOREIGN KEY (CartaRecebidaID) REFERENCES Cartas(ID)
);