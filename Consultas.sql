select * from clients;
select * from orders;
select * from product;
select * from productorder;
select * from productseller;
select * from productstorage;
select * from productsupplier;
select * from seller;
select * from storagelocation;
select * from supplier;


select count(*) from clients;

select * from clients as c, orders as o where c.idclient = o.idorderclient;

select concat(Fname,' ',Lname) as Cliente, idorder as 'Pedido', orderstatus as 'Status do Pedido' from clients c, orders o where c.idClient = o.idorderclient;

select * from clients as c, orders as o where c.idclient = o.idorderclient;

select * from clients as c, orders as o where c.idclient = o.idorderclient
	group by idorder;
	
select * from clients left outer join orders on idclient = idorderclient;

select * from clients c inner join orders o on c.idclient = o.idorderclient inner join productorder p on p.idpoorder = idorder;

-- recuperar quantos pedidos foram realizados pelos clientes?
select c.idclient, fname, count(*) as Number_Of_Orders from clients c
	inner join orders o On c.idclient = o.idorderclient
    inner join productorder p on p.idpoorder = o.idorder
    group by idclient;