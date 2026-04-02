USE ecommerce_db;
-- USUÁRIO
INSERT INTO usuarios (nome, endereco, email, senha) VALUES
('João Silva', 'São Paulo - SP', 'joao@email.com', '123456'),
('Maria Souza', 'Rio de Janeiro - RJ', 'maria@email.com', '123456'),
('Carlos Lima', 'Belo Horizonte - MG', 'carlos@email.com', '123456'),
('Ana Costa', 'Curitiba - PR', 'ana@email.com', '123456'),
('Pedro Rocha', 'Porto Alegre - RS', 'pedro@email.com', '123456'),
('Juliana Alves', 'Salvador - BA', 'juliana@email.com', '123456'),
('Lucas Martins', 'Fortaleza - CE', 'lucas@email.com', '123456'),
('Fernanda Gomes', 'Recife - PE', 'fernanda@email.com', '123456'),
('Rafael Pinto', 'Brasília - DF', 'rafael@email.com', '123456'),
('Camila Barros', 'Manaus - AM', 'camila@email.com', '123456');

-- PRODUTOS
INSERT INTO produtos (nome, descricao, preco, quantidade_estoque) VALUES
('iPhone 14', 'Smartphone Apple 128GB', 5999.90, 10),
('Samsung Galaxy S23', 'Smartphone Samsung 256GB', 4999.90, 15),
('Notebook Dell Inspiron', 'Intel i7, 16GB RAM, SSD 512GB', 4599.90, 8),
('MacBook Air M1', 'Apple M1, 8GB RAM, SSD 256GB', 7999.90, 5),
('Xiaomi Redmi Note 12', 'Smartphone 128GB', 1999.90, 20),
('Notebook Lenovo IdeaPad', 'Intel i5, 8GB RAM, SSD 256GB', 3499.90, 12),
('iPad 10ª geração', 'Tablet Apple 64GB', 3299.90, 7),
('Smartwatch Galaxy Watch', 'Relógio inteligente Samsung', 1299.90, 18),
('Fone Bluetooth JBL', 'Fone sem fio', 399.90, 30),
('Monitor LG 24"', 'Full HD IPS', 899.90, 14);

-- CARRINHOS
INSERT INTO carrinhos (usuario_id) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10);

-- COMPRAS
INSERT INTO compras (id_produto, usuario_id, id_carrinho) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10);
