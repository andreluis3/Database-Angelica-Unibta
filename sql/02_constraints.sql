USE ecommerce_db;
-- Garante que  preço nunca seja negativo
ALTER TABLE produtos ADD CONSTRAINT chk_preco_positivo CHECK (preco > 0);

-- garante que a quantidade de estoque não seja negativa 
ALTER TABLE produtos ADD CONSTRAINT chk_estoque_minimo CHECK (quantidade_estoque >= 0);
