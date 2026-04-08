# 🛒 Banco de Dados - Sistema de E-commerce

Este projeto apresenta a modelagem e implementação de um **banco de dados relacional para um sistema de e-commerce**, utilizando **MySQL**.

O banco permite gerenciar:

- usuários
- produtos
- carrinhos de compra
- pedidos
- relatórios analíticos

Além disso, o projeto inclui:

- consultas SQL
- procedures
- triggers
- views analíticas
- dados de teste

---

# 📊 Diagrama ER (Modelo Entidade Relacionamento)

O diagrama abaixo representa a estrutura lógica do banco de dados.

![Diagrama ER](modelagem1.jpeg)

![Diagrama ER](modelagem2.jpeg)

### Relacionamentos

| Entidade | Relacionamento | Entidade |
|--------|--------|--------|
| usuarios | 1 : 1 | carrinhos |
| carrinhos | 1 : N | compras |
| produtos | 1 : N | compras |

---

# 🗄 Estrutura das Tabelas

## Tabela: usuarios

| Campo | Tipo | Restrições | Descrição |
|------|------|-----------|-----------|
| id | INT | PK, Auto Increment | Identificador único do usuário |
| nome | VARCHAR(255) | NOT NULL | Nome completo do cliente |
| endereco | VARCHAR(255) | NOT NULL | Endereço de entrega |
| email | VARCHAR(255) | UNIQUE, NOT NULL | Email de acesso |
| senha | VARCHAR(255) | NOT NULL | Senha criptografada |

---

## Tabela: produtos

| Campo | Tipo | Restrições | Descrição |
|------|------|-----------|-----------|
| id | INT | PK, Auto Increment | Identificador do produto |
| nome | VARCHAR(255) | NOT NULL | Nome do produto |
| descricao | TEXT | NOT NULL | Descrição do produto |
| preco | DECIMAL(10,2) | NOT NULL | Preço unitário |
| quantidade_estoque | INT | NOT NULL | Quantidade em estoque |

---

## Tabela: carrinhos

| Campo | Tipo | Restrições | Descrição |
|------|------|-----------|-----------|
| id | INT | PK, Auto Increment | Identificador do carrinho |
| usuario_id | INT | FK (usuarios) | Usuário dono do carrinho |
| data_criacao | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP | Data de criação |

---

## Tabela: compras

| Campo | Tipo | Restrições | Descrição |
|------|------|-----------|-----------|
| id | INT | PK, Auto Increment | Identificador da compra |
| id_produto | INT | FK (produtos) | Produto comprado |
| usuario_id | INT | FK (usuarios) | Cliente que comprou |
| id_carrinho | INT | FK (carrinhos) | Carrinho associado |
| data_pedido | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP | Data da compra |

---

# 📥 Dados de Teste (INSERT)

## Usuários

```sql
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

## Produtos 
```sql
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

##🔄 Updates e Deletes

🔎 Consultas SQL
Consultas Simples
Nº	Consulta
1	Listar todos usuários
2	Listar nome e preço de produtos
3	Produtos com preço acima de 2000
4	Usuários de São Paulo
5	Produtos com estoque baixo
6	Ordenar produtos por preço
7	3 produtos mais baratos
8	Contar usuários
9	Listar carrinhos
10	Buscar usuário por email
🔗 Consultas com JOIN

Exemplo:

SELECT u.nome, p.nome, com.data_pedido
FROM compras com
JOIN usuarios u ON com.usuario_id = u.id
JOIN produtos p ON com.id_produto = p.id;
⚙ Stored Procedures
Procedure	Função
sp_cadastrar_usuario	Cadastrar novo usuário
sp_adicionar_estoque	Adicionar estoque ao produto
sp_total_gasto_usuario	Calcular total gasto por usuário
⚡ Triggers
Trigger	Evento	Função
trg_atualiza_estoque_venda	AFTER INSERT	Atualiza estoque após compra
trg_impedir_exclusao_produto	BEFORE DELETE	Impede excluir produto com estoque
trg_log_alteracao_preco	AFTER UPDATE	Registra alteração de preço


## 📊 Views Analíticas
View	Função
vw_analise_faturamento_produtos	Faturamento por produto
vw_alerta_estoque	Alertas de estoque baixo

## 📈 Views de Relatórios
View	Descrição
vw_relatorio_pedidos_detalhado	Relatório completo de pedidos
vw_resumo_gastos_clientes	Resumo de gastos por cliente
⚙ Instalação
Criar banco
CREATE DATABASE ecommerce_db;
USE ecommerce_db;
Usuários e permissões
CREATE USER 'admin_ecommerce'@'localhost' IDENTIFIED BY 'senha_segura_123';
GRANT ALL PRIVILEGES ON ecommerce_db.* TO 'admin_ecommerce'@'localhost';

CREATE USER 'analista_ecommerce'@'localhost' IDENTIFIED BY 'consulta_456';
GRANT SELECT ON ecommerce_db.* TO 'analista_ecommerce'@'localhost';

FLUSH PRIVILEGES;
#👨‍💻 Autores

- André Luis de Sousa Santos 
- Debora Nogueira Marques Teixeira
- Kayky Almeida de Souza 
- Rafael Reis Alves 
- Thainá Almeida Lopes 


-> Projeto desenvolvido para a disciplina de Banco de Dados.