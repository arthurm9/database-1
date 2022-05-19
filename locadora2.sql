create database vendas;
use vendas;

CREATE TABLE cliente (
    id_cliente INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    cliente VARCHAR(200)
);

CREATE TABLE vendedor (
    id_vendedor INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    vendedor VARCHAR(200)
);

CREATE TABLE pedido (
    id_cliente INT NOT NULL,
    id_vendedor INT NOT NULL,
    data_venda VARCHAR(100),
    valor INT,
    produto VARCHAR(100)
);

-- alter table pedido add constraint fk_pedido_vendedor foreign key (id_vendedor) references vendedor (id_vendedor);
-- alter table pedido add constraint fk_pedido_cliente foreign key (id_cliente) references cliente (id_cliente);

insert into cliente (id_cliente, cliente) values (1, "ETEC LTDA");
insert into vendedor (id_vendedor, vendedor) values (1, "SUPPORT");
insert into pedido (id_cliente, id_vendedor, data_venda, valor, produto) values ('1', '1', "20/03/2022", 1500, "Televisor");

insert into cliente (id_cliente, cliente) values (2, "MARCO INDUSTRIAS");
insert into vendedor (id_vendedor, vendedor) values (1, "LP-NET");
insert into pedido (id_cliente, id_vendedor, data_venda, valor, produto) values ('2', '1', "10/08/2022", 150, "Fibra Óptica");

-- Outro erro possível:
-- insert into cliente (id_cliente, cliente) values (1, "MARCO INDUSTRIAS");
-- insert into vendedor (id_vendedor, vendedor) values (3, "LP-NET");
-- insert into pedido (id_cliente, id_vendedor, data_venda, valor, produto) values ('1', '3', "10/08/2022", 150, "Fibra Óptica");

-- insert into cliente (cliente) values ("ETEC LTDA", "MARCO INDUSTRIAS");
-- insert into vendedor (vendedor) values ("SUPPORT", "LP-NET");
-- insert into pedido (id_cliente, id_vendedor, data_venda, valor, produto) values ('1', '1', "20/03/2022", 1500, "Televisor");

-- Erro:
-- insert into cliente (cliente) values ("MARCO INDUSTRIAS");
-- insert into vendedor (vendedor) values ("LP-NET");
-- insert into pedido (id_cliente, id_vendedor, data_venda, valor, produto) values ('2', '3', "10/07/2022", 150, "Fibra Óptica");

-- SELECT 
--    *
-- FROM
--    cliente;
-- SELECT 
--    *
-- FROM
--    vendedor;
-- SELECT 
--    *
-- FROM
--    pedido;

-- Pesquisa em múltiplas tabelas: 
select cliente.cliente, vendedor.vendedor, data_venda, produto, valor 
from pedido, cliente, vendedor 
where pedido.id_cliente = cliente.id_cliente 
and pedido.id_vendedor = vendedor.id_vendedor;

-- select * from cliente where cliente like "%ETEC LTDA%";

-- O ponto (.) relaciona uma tabela com seu campo. Cliente (tabela) . id_cliente (campo da tabela)

select * from pedido;

drop table cliente, vendedor;
drop schema vendas; 