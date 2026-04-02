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
