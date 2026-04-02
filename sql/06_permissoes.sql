--USUARIOS E PERMISSÕES
-- 1. Criação de um usuário administrador para o sistema
CREATE USER IF NOT EXISTS 'admin_ecommerce'@'localhost' IDENTIFIED BY 'senha_segura_123';

-- 2. Atribuição de permissões totais no banco do projeto
GRANT ALL PRIVILEGES ON ecommerce_db.* TO 'admin_ecommerce'@'localhost';

-- 3. Criação de um usuário apenas para consulta (Relatórios/Views)
CREATE USER IF NOT EXISTS 'analista_ecommerce'@'localhost' IDENTIFIED BY 'consulta_456';

-- 4. Atribuição de permissão apenas de leitura (SELECT) em todas as tabelas e views
GRANT SELECT ON ecommerce_db.* TO 'analista_ecommerce'@'localhost';

-- Atualizar privilégios
--FLUSH PRIVILEGES;
-- EXEMPLOS
-- EXEMPLO 1:
SELECT nome, quantidade_estoque 
FROM produtos 
WHERE quantidade_estoque < 10;

-- EXEMPLO 2:
SELECT u.nome AS cliente, p.nome AS produto, c.data_pedido
FROM compras c
JOIN usuarios u ON c.usuario_id = u.id
JOIN produtos p ON c.id_produto = p.id;
*/



