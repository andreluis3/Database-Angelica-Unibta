USE ecommerce_db
CREATE TABLE "usuarios" (
    "id" SERIAL PRIMARY KEY,
    "nome" VARCHAR(255) NOT NULL,
    "endereco" VARCHAR(255) NOT NULL,
    "email" VARCHAR(255) NOT NULL UNIQUE,
    "senha" VARCHAR(255) NOT NULL,
);

CREATE TABLE "produtos" (
    "id" SERIAL PRIMARY KEY,
    "nome" VARCHAR(255) NOT NULL,
    "descricao" TEXT NOT NULL,
    "preco" DECIMAL(10, 2) NOT NULL,
    "quantidade_estoque" INT NOT NULL
);

CREATE TABLE "compras" (
    "id" SERIAL PRIMARY KEY,
    "id_produto" INT NOT NULL FOREIGN KEY REFERENCES "produtos" ("id"),
    "usuario_id" INT NOT NULL FOREIGN KEY REFERENCES "usuarios" ("id"),
    "data_pedido" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "id_carrinho" INT NOT NULL FOREIGN KEY REFERENCES "carrinhos" ("id") 

);

CREATE TABLE "carrinhos" (
    "id" SERIAL PRIMARY KEY,
    "usuario_id" INT NOT NULL FOREIGN KEY REFERENCES "usuarios" ("id"),
    "data_criacao" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

