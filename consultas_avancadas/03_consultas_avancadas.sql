 -- CONSULTAS AVANÇADASS 
-- 1 GROUP BY: Valor total investido em estoque por produto
SELECT nome, (preco * quantidade_estoque) AS valor_estoque_total
FROM produtos
GROUP BY id;

-- 2 SUBQUERY: Encontrar o usuário que comprou o produto mais caro do catálogo
SELECT nome FROM usuarios 
WHERE id = (
    SELECT usuario_id FROM compras 
    WHERE id_produto = (SELECT id FROM produtos ORDER BY preco DESC LIMIT 1)
);

-- 3 GROUP BY + HAVING: Listar usuários que gastaram mais de 5000 no total (considerando 1 item por compra)
SELECT u.nome, SUM(p.preco) AS total_gasto
FROM usuarios u
JOIN compras com ON u.id = com.usuario_id
JOIN produtos p ON com.id_produto = p.id
GROUP BY u.nome
HAVING total_gasto > 5000;

-- 4 SUBQUERY: Listar produtos que têm preço acima da média de todos os produtos
SELECT nome, preco 
FROM produtos 
WHERE preco > (SELECT AVG(preco) FROM produtos);

-- 5 JOIN COMPLEXO: Ranking de estados (extraído do endereço) que mais geraram valor em vendas
SELECT SUBSTRING_INDEX(endereco, '- ', -1) AS estado, SUM(p.preco) AS faturamento
FROM usuarios u
JOIN compras com ON u.id = com.usuario_id
JOIN produtos p ON com.id_produto = p.id
GROUP BY estado
ORDER BY faturamento DESC;

-- PROCEDURES
USE ecommerce_db;
DELIMITER //
-- Procedure 1: Cadastrar novo usuário de forma segura
CREATE PROCEDURE sp_cadastrar_usuario(
    IN p_nome VARCHAR(255),
    IN p_endereco VARCHAR(255),
    IN p_email VARCHAR(255),
    IN p_senha VARCHAR(255)
)
BEGIN
    INSERT INTO usuarios (nome, endereco, email, senha) 
    VALUES (p_nome, p_endereco, p_email, p_senha);
END //

-- Procedure 2: Atualizar estoque de um produto (Entrada de mercadoria)
CREATE PROCEDURE sp_adicionar_estoque(
    IN p_produto_id INT,
    IN p_quantidade INT
)
BEGIN
    UPDATE produtos 
    SET quantidade_estoque = quantidade_estoque + p_quantidade 
    WHERE id = p_produto_id;
END //

-- Procedure 3: Gerar total de gastos de um usuário específico
CREATE PROCEDURE sp_total_gasto_usuario(
    IN p_usuario_id INT,
    OUT p_total DECIMAL(10,2)
)
BEGIN
    SELECT SUM(p.preco) INTO p_total
    FROM compras c
    JOIN produtos p ON c.id_produto = p.id
    WHERE c.usuario_id = p_usuario_id;
END // DELIMITER ;
