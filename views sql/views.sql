--VIEWS ANALITICAS
-- Analisa o faturamento total e quantidade vendida por item
USE ecommerce_db;
CREATE OR REPLACE VIEW vw_analise_faturamento_produtos AS
SELECT 
    p.nome AS produto,
    COUNT(c.id) AS quantidade_vendida,
    SUM(p.preco) AS faturamento_total
FROM produtos p
LEFT JOIN compras c ON p.id = c.id_produto
GROUP BY p.id, p.nome;

-- Identifica produtos que estão com estoque abaixo de 10 unidades
CREATE OR REPLACE VIEW vw_alerta_estoque AS
SELECT 
    id, 
    nome, 
    quantidade_estoque,
    CASE 
        WHEN quantidade_estoque = 0 THEN 'ESGOTADO'
        WHEN quantidade_estoque < 5 THEN 'CRÍTICO'
        ELSE 'REPOR EM BREVE'
    END AS status_estoque
FROM produtos
WHERE quantidade_estoque < 10;


-- VIEWS PARA RELATÓRIOS
-- Consolida dados de cliente, produto e data para logística
CREATE OR REPLACE VIEW vw_relatorio_pedidos_detalhado AS
SELECT 
    c.id AS codigo_pedido,
    u.nome AS cliente,
    u.email,
    p.nome AS produto_comprado,
    p.preco AS valor_pago,
    c.data_pedido
FROM compras c
JOIN usuarios u ON c.usuario_id = u.id
JOIN produtos p ON c.id_produto = p.id;

-- Mostra o resumo de quanto cada cliente já investiu na loja
CREATE OR REPLACE VIEW vw_resumo_gastos_clientes AS
SELECT 
    u.nome AS cliente,
    COUNT(c.id) AS total_pedidos,
    SUM(p.preco) AS total_gasto_acumulado
FROM usuarios u
LEFT JOIN compras c ON u.id = c.usuario_id
LEFT JOIN produtos p ON c.id_produto = p.id
GROUP BY u.id, u.nome;
