
USE ecommerce_db;
-- Atualizar o preço do iPhone 14
UPDATE produtos SET preco = 5799.00 WHERE id = 1;

-- Repor estoque após nova entrada
UPDATE produtos SET quantidade_estoque = quantidade_estoque + 10 WHERE id = 3;

