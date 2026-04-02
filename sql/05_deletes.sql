USE FROM ecommerce.db 
--Remover um usuário que nunca fez compras 
DELETE FROM usuarios WHERE id NOT IN (SELECT usuario_id FROM compras) AND id = 99;
