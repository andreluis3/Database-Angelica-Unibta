-- USUÁRIO
INSERT INTO usuarios (nome, endereco, email, senha) VALUES
('João Silva', 'São Paulo - SP', 'joao@email.com', '123456'),
('Maria Souza', 'Rio de Janeiro - RJ', 'maria@email.com', '123456'),
('Carlos Lima', 'Belo Horizonte - MG', 'carlos@email.com', '123456'),
('Camila Barros', 'Manaus - AM', 'camila@email.com', '123456');

-- PRODUTOS
INSERT INTO produtos (nome, descricao, preco, quantidade_estoque) VALUES
('iPhone 14', 'Smartphone Apple 128GB', 5999.90, 10),
('Samsung Galaxy S23', 'Smartphone Samsung 256GB', 4999.90, 15),
('Notebook Dell Inspiron', 'Intel i7, 16GB RAM, SSD 512GB', 4599.90, 8),
('Monitor LG 24"', 'Full HD IPS', 899.90, 14);

-- CARRINHOS
INSERT INTO carrinhos (usuario_id) VALUES
(1),
(2),
(3),
(10);

-- COMPRAS
INSERT INTO compras (id_produto, usuario_id, id_carrinho) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(10, 10, 10);
