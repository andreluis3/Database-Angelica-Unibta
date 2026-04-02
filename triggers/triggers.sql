USE ecommerce_db;
CREATE TABLE IF NOT EXISTS log_precos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    produto_id INT,
    preco_antigo DECIMAL(10,2),
    preco_novo DECIMAL(10,2),
    data_alteracao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
); DELIMITER //

-- Trigger 1: Atualizar estoque automaticamente após uma compra 
CREATE TRIGGER trg_atualiza_estoque_venda
AFTER INSERT ON compras
FOR EACH ROW
BEGIN
    UPDATE produtos 
    SET quantidade_estoque = quantidade_estoque - 1
    WHERE id = NEW.id_produto;
END //

-- Trigger 2: Impedir a exclusão de produtos que ainda possuem estoque 
CREATE TRIGGER trg_impedir_exclusao_produto
BEFORE DELETE ON produtos
FOR EACH ROW
BEGIN
    IF OLD.quantidade_estoque > 0 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Erro: Não é permitido excluir produtos com estoque disponível.';
    END IF;
END //

-- Trigger 3: Registrar log de alterações de preço
CREATE TRIGGER trg_log_alteracao_preco
AFTER UPDATE ON produtos
FOR EACH ROW
BEGIN
    IF OLD.preco <> NEW.preco THEN
        INSERT INTO log_precos (produto_id, preco_antigo, preco_novo)
        VALUES (OLD.id, OLD.preco, NEW.preco);
    END IF;
END // DELIMITER ;
