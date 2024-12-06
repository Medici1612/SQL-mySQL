create database projeto;
use projeto;

-- Tabela de Categorias
CREATE TABLE Categorias (
    categoria_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    descricao TEXT
);

-- Tabela de Fornecedores
CREATE TABLE Fornecedores (
    fornecedor_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    contato VARCHAR(50),
    endereco VARCHAR(150),
    cidade VARCHAR(50)
);

-- Tabela de Produtos
CREATE TABLE Produtos (
    produto_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10, 2) NOT NULL,
    estoque INT NOT NULL,
    categoria_id INT,
    fornecedor_id INT,
    FOREIGN KEY (categoria_id) REFERENCES Categorias(categoria_id),
    FOREIGN KEY (fornecedor_id) REFERENCES Fornecedores(fornecedor_id)
);

-- Tabela de Clientes
CREATE TABLE Clientes (
    cliente_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    telefone VARCHAR(20),
    cpf VARCHAR(14) NOT NULL,
    endereco VARCHAR(150),
    cidade VARCHAR(50)
);

-- Tabela de Funcionários
CREATE TABLE Funcionarios (
    funcionario_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(50) NOT NULL,
    salario DECIMAL(10, 2) NOT NULL,
    data_contratacao DATE,
    email VARCHAR(100),
    telefone VARCHAR(20)
);

-- Tabela de Pedidos
CREATE TABLE Pedidos (
    pedido_id INT AUTO_INCREMENT PRIMARY KEY,
    data_pedido DATE NOT NULL,
    cliente_id INT,
    funcionario_id INT,
    status VARCHAR(20),
    FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id),
    FOREIGN KEY (funcionario_id) REFERENCES Funcionarios(funcionario_id)
);

-- Tabela de Itens_Pedido
CREATE TABLE Itens_Pedido (
    item_pedido_id INT AUTO_INCREMENT PRIMARY KEY,
    pedido_id INT,
    produto_id INT,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (pedido_id) REFERENCES Pedidos(pedido_id),
    FOREIGN KEY (produto_id) REFERENCES Produtos(produto_id)
);

-- Tabela de Pagamentos
CREATE TABLE Pagamentos (
    pagamento_id INT AUTO_INCREMENT PRIMARY KEY,
    pedido_id INT,
    valor DECIMAL(10, 2) NOT NULL,
    metodo_pagamento VARCHAR(50),
    data_pagamento DATE NOT NULL,
    FOREIGN KEY (pedido_id) REFERENCES Pedidos(pedido_id)
);

-- Inserção de Dados na Tabela de Categorias
INSERT INTO Categorias (nome, descricao) VALUES
('Eletrônicos', 'Aparelhos eletrônicos e acessórios'),
('Eletrodomésticos', 'Eletrodomésticos para uso doméstico'),
('Móveis', 'Móveis para casa e escritório'),
('Roupas', 'Vestuário para todas as idades'),
('Livros', 'Livros de diversos gêneros');

-- Inserção de Dados na Tabela de Fornecedores
INSERT INTO Fornecedores (nome, contato, endereco, cidade) VALUES
('TechSupplies', '(41) 91234-5678', 'Rua das Flores, 1010', 'Curitiba'),
('HomeAppliances', '(41) 92345-6789', 'Avenida Sete de Setembro, 1500', 'Curitiba'),
('OfficeMax', '(41) 93456-7890', 'Rua Marechal Deodoro, 2500', 'Curitiba'),
('FashionHub', '(41) 94567-8901', 'Rua XV de Novembro, 3500', 'Curitiba'),
('BookWorld', '(41) 95678-9012', 'Rua Alferes Poli, 4500', 'Curitiba');

-- Inserção de Dados na Tabela de Produtos
INSERT INTO Produtos (nome, descricao, preco, estoque, categoria_id, fornecedor_id) VALUES
('Smartphone', 'Smartphone moderno com tela grande', 1500.00, 10, 1, 1),
('Notebook', 'Notebook para uso pessoal e profissional', 3500.00, 25, 1, 1),
('Geladeira', 'Geladeira de duas portas', 2200.00, 5, 2, 2),
('Micro-ondas', 'Micro-ondas de alta potência', 600.00, 3, 2, 2),
('Mesa de Escritório', 'Mesa compacta para escritório', 800.00, 20, 3, 3),
('Cadeira de Escritório', 'Cadeira ergonômica para escritório', 250.00, 15, 3, 3),
('Camiseta', 'Camiseta de algodão', 50.00, 30, 4, 4),
('Calça Jeans', 'Calça jeans unissex', 120.00, 10, 4, 4),
('Livro de Ficção', 'Livro de ficção bestseller', 40.00, 8, 5, 5),
('Enciclopédia', 'Enciclopédia completa em volumes', 300.00, 4, 5, 5),
('Fone de Ouvido', 'Fone de ouvido estéreo', 80.00, 18, 1, 1),
('TV 4K', 'TV de alta definição 4K', 4000.00, 7, 1, 2),
('Sofá', 'Sofá confortável para sala', 2000.00, 2, 3, 3),
('Vestido', 'Vestido de verão', 200.00, 25, 4, 4),
('Livro Infantil', 'Livro educativo para crianças', 30.00, 12, 5, 5);

-- Inserção de Dados na Tabela de Clientes
INSERT INTO Clientes (nome, email, telefone, cpf, endereco, cidade) VALUES
('João Batista', 'joao@gmail.com', '(41) 99999-1111', '123.456.789-00', 'Rua Padre Anchieta, 123', 'Curitiba'),
('Maria Cecília', 'maria@gmail.com', '(41) 98888-2222', '987.654.321-00', 'Rua Visconde de Guarapuava, 456', 'Curitiba'),
('Carlos Eduardo', 'carlos@gmail.com', '(41) 97777-3333', '111.222.333-44', 'Rua Mateus Leme, 789', 'Curitiba'),
('Ana Luiza', 'ana@gmail.com', '(41) 96666-4444', '222.333.444-55', 'Avenida Batel, 1010', 'Curitiba'),
('Paula Martins', 'paula@gmail.com', '(41) 95555-5555', '333.444.555-66', 'Rua Almirante Tamandaré, 2020', 'Curitiba'),
('Roberto Machado', 'roberto@gmail.com', '(41) 94444-6666', '444.555.666-77', 'Rua Engenheiros Rebouças, 3030', 'Curitiba'),
('Fernanda Rocha', 'fernanda@gmail.com', '(41) 93333-7777', '555.666.777-88', 'Rua Chile, 4040', 'Curitiba'),
('Bruno Andrade', 'bruno@gmail.com', '(41) 92222-8888', '666.777.888-99', 'Rua México, 5050', 'Curitiba'),
('Larissa Moreira', 'larissa@gmail.com', '(41) 91111-9999', '777.888.999-00', 'Rua Holanda, 6060', 'Curitiba'),
('Pedro Tavares', 'pedro@gmail.com', '(41) 90000-0000', '888.999.000-11', 'Rua Estados Unidos, 7070', 'Curitiba');

-- Inserção de Dados na Tabela de Funcionários
INSERT INTO Funcionarios (nome, cargo, salario, data_contratacao, email, telefone) VALUES
('Lucas Albuquerque', 'Vendedor', 2500.00, '2023-01-15', 'lucas@empresa.com', '(41) 92345-6789'),
('Carla Fonseca', 'Gerente', 5000.00, '2022-03-10', 'carla@empresa.com', '(41) 93456-7890'),
('Bruna Lima', 'Caixa', 1800.00, '2024-02-05', 'bruna@empresa.com', '(41) 94567-8901'),
('Rafael Souza', 'Auxiliar de Estoque', 1500.00, '2023-07-20', 'rafael@empresa.com', '(41) 95678-9012'),
('Tatiane Gomes', 'Atendente', 2000.00, '2023-09-18', 'tatiane@empresa.com', '(41) 96789-0123');

-- Inserção de Dados na Tabela de Pedidos
INSERT INTO Pedidos (data_pedido, cliente_id, funcionario_id, status) VALUES
('2024-09-01', 1, 1, 'Concluído'),
('2024-09-05', 2, 2, 'Em andamento'),
('2024-09-10', 3, 3, 'Concluído'),
('2024-09-15', 4, 1, 'Concluído'),
('2024-09-20', 5, 2, 'Em andamento'),
('2024-09-25', 6, 3, 'Concluído'),
('2024-09-30', 7, 4, 'Em andamento'),
('2024-10-05', 8, 5, 'Concluído'),
('2024-10-10', 9, 1, 'Em andamento'),
('2024-10-15', 10, 2, 'Concluído');

-- Inserção de Dados na Tabela de Itens_Pedido
INSERT INTO Itens_Pedido (pedido_id, produto_id, quantidade, preco_unitario) VALUES
(1, 1, 1, 1500.00),
(1, 3, 1, 2200.00),
(2, 2, 1, 3500.00),
(2, 4, 2, 600.00),
(3, 5, 1, 800.00),
(3, 6, 2, 250.00),
(4, 7, 3, 50.00),
(4, 9, 1, 40.00),
(5, 8, 2, 120.00),
(5, 10, 1, 300.00),
(6, 11, 1, 80.00),
(6, 12, 1, 4000.00),
(7, 13, 1, 2000.00),
(7, 14, 1, 200.00),
(8, 15, 1, 30.00),
(8, 5, 1, 800.00),
(9, 1, 2, 1500.00),
(9, 7, 1, 50.00),
(10, 3, 1, 2200.00),
(10, 9, 3, 40.00);

-- Inserção de Dados na Tabela de Pagamentos
INSERT INTO Pagamentos (pedido_id, valor, metodo_pagamento, data_pagamento) VALUES
(1, 3700.00, 'Cartão de Crédito', '2024-09-02'),
(2, 4700.00, 'Boleto', '2024-09-06'),
(3, 1300.00, 'Transferência Bancária', '2024-09-11'),
(4, 150.00, 'Cartão de Crédito', '2024-09-16'),
(5, 540.00, 'Boleto', '2024-09-21'),
(6, 4080.00, 'Transferência Bancária', '2024-09-26'),
(7, 2200.00, 'Cartão de Crédito', '2024-10-01'),
(8, 830.00, 'Cartão de Crédito', '2024-10-06'),
(9, 3050.00, 'Transferência Bancária', '2024-10-11'),
(10, 2320.00, 'Boleto', '2024-10-16');


