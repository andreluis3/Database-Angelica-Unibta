1 Listar nome do usuário e a data de criação do seu carrinho
SELECT u.nome, c.data_criacao 
FROM usuarios u
JOIN carrinhos c ON u.id = c.usuario_id;

-- 2 Listar todas as compras com o nome do produto vendido
SELECT com.id AS pedido_id, p.nome AS produto
FROM compras com
JOIN produtos p ON com.id_produto = p.id;

-- 3 Relatório de vendas: Nome do Cliente, Produto e Data da Compra
SELECT u.nome, p.nome, com.data_pedido
FROM compras com
JOIN usuarios u ON com.usuario_id = u.id
JOIN produtos p ON com.id_produto = p.id;

-- 4 Listar produtos que já foram vendidos (sem repetição)
SELECT DISTINCT p.nome
FROM produtos p
JOIN compras com ON p.id = com.id_produto;

-- 5 Ver o endereço de entrega para cada pedido realizado
SELECT com.id, u.nome, u.endereco
FROM compras com
JOIN usuarios u ON com.usuario_id = u.id;

-- 6 Listar carrinhos que resultaram em compras
SELECT c.id AS carrinho_id, com.id AS compra_id
FROM carrinhos c
JOIN compras com ON c.id = com.id_carrinho;

-- 7 Mostrar o preço dos produtos comprados por 'João Silva'
SELECT p.nome, p.preco
FROM compras com
JOIN usuarios u ON com.usuario_id = u.id
JOIN produtos p ON com.id_produto = p.id
WHERE u.nome = 'João Silva';

-- 8 Contar quantas compras cada usuário fez
SELECT u.nome, COUNT(com.id) AS total_compras
FROM usuarios u
LEFT JOIN compras com ON u.id = com.usuario_id
GROUP BY u.nome;

-- 9 Listar produtos e seus respectivos carrinhos
SELECT p.nome, c.id AS carrinho_no
FROM compras com
JOIN produtos p ON com.id_produto = p.id
JOIN carrinhos c ON com.id_carrinho = c.id;

-- 10 Mostrar o valor total de cada compra (Produto x 1, simplificado)
SELECT com.id, p.nome, p.preco
FROM compras com
JOIN produtos p ON com.id_produto = p.id;
