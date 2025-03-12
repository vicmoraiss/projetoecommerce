-- criação do banco de dados para o cenário E-commerce
-- drop database ecommerce;
create database ecommerce;
use ecommerce;

-- criar tabela Cliente

create table clients(
	idClient int auto_increment primary key,
    Fname varchar(10),
    Minit char(3),
	Lname varchar(30),
    CPF char(11) not null,
		constraint unique_cpf_client unique (CPF),
	Address varchar(255)
);

-- criar tabela Produto
-- size = dimensão do produto
create table product(
	idProduct int auto_increment primary key,
    Pname varchar(50) not null,
    classification_kids bool default false,
    category enum('Eletrônico','Vestuário','Brinquedos','Cosméticos', 'Móveis') not null,
	avaliação float default 0,
    size varchar(10)
);

alter table product modify pname varchar(50);

-- criar tabela Pagamento
create table payments(
	idclient int,
    idPayment int,
    typePayment enum('Boleto','Cartão','Dois Cartões'),
    limitAvaliable float,
    primary key(idClient, idPayment)
);

-- criar tabela Pedido
create table orders(
	idOrder int auto_increment primary key,
    idOrderClient int,
    orderStatus enum('Cancelado','Confirmado','Processando') default 'Processando',
    orderDescription varchar(255),
    sendValue float default 10,
    paymentCash boolean default false,
    constraint fk_orders_client foreign key (idOrderClient) references Clients(idClient)
);


-- criar tabela estoque
create table productStorage(
	idProdStorage int auto_increment primary key,
    storageLocation varchar(255),
    quantity int default 0
);

-- criar tabela fornecedor
create table supplier(
	idSupplier int auto_increment primary key,
    SocialName varchar(255),
    CNPJ char(14) unique,
    contact varchar(11) not null,
    constraint unique_supplier unique (CNPJ)
); 

-- criar tabela vendedor
create table seller(
	idSeller int auto_increment primary key,
    SocialName varchar(255) not null,
    AbstName varchar(255),
    Location varchar(255),
    CNPJ char(14),
    CPF char(11),
    contact char(11) not null,
    constraint unique_cpf_seller unique (CNPJ),
    constraint unique_CNPJ_seller unique (CPF)
);

-- criar tabela Produtos_Vendedor Terceiro
create table productSeller(
	idPseller int,
    idPproduct int,
    prodQuantity int default 1,
    primary key (idPseller, idPproduct),
    constraint fk_product_seller foreign key (idPseller) references seller(idSeller),
    constraint fk_product_product_seller foreign key (idPproduct) references product(idProduct)
);

-- Criar Product Order
create table productOrder(
	idPOproduct int,
    idPOorder int,
    poQuantity int default 1,
    poStatus enum('Disponível', 'Sem Estoque') default 'Disponível',
    primary key (idPOproduct, idPOorder),
    constraint fk_Product_Order foreign key (idPOorder) references orders(idOrder),
    constraint fk_Product_Product foreign key (IdPOproduct) references product(idProduct)
);

-- Criar tabela Storage Location
create table storageLocation(
	idLproduct int, 
    idLstorage int,
    location varchar(255) not null,
    primary key (idLproduct, idLstorage),
    constraint fk_storage_product_seller foreign key (idLproduct) references product(idProduct),
    constraint fk_storage_product_product foreign key (idLstorage) references productStorage(idProdStorage)
);

-- Criar Tabela Product Supplier
create table productSupplier(
	idPsSupplier int,
    idPsProduct int,
    quantity int not null,
    primary key (idPsSupplier, idPsProduct),
    constraint fk_product_supplier_supplier foreign key (idPsSupplier) references supplier(idSupplier),
    constraint fk_product_supplier_product foreign key (idPsProduct) references product(idProduct)
);

use information_schema;
show tables;
desc referential_constraints;
select * from referential_constraints where constraint_schema = 'ecommerce';