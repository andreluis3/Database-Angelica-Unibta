USE FROM ecommerce.db 

USE ecommerce_db;
-- 1. 
SELECT * FROM usuarios;

-- 2
SELECT nome, preco FROM produtos;

-- 3 
SELECT * FROM produtos WHERE preco > 2000;

-- 4 
SELECT nome, email FROM usuarios WHERE endereco LIKE '%São Paulo%';

-- 5 
SELECT nome, quantidade_estoque FROM produtos WHERE quantidade_estoque < 10;

-- 6 
SELECT * FROM produtos ORDER BY preco DESC;

-- 7 
SELECT * FROM produtos ORDER BY preco ASC LIMIT 3;

-- 8 
SELECT COUNT(*) AS total_usuarios FROM usuarios;

-- 9 
SELECT id, usuario_id FROM carrinhos;

-- 10
SELECT * FROM usuarios WHERE email = 'maria@email.com';

