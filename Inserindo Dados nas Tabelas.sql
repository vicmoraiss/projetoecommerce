use ecommerce;

insert into Clients (Fname, Minit, Lname, CPF, Address) values
	('Maria','M','Silva',12345678910,'Rua Silva de Prata, 29, Carangola, Cidade das Flores'),
	('Matheus','O','Pimentel',98765432110,'Rua Alameda, 289, Centro - Cidade das Flores'),
    ('Ricardo','F','Silva',45678912310,'Avenida Alameda Vinha, 1009, Centro - Cidade das Flores'),
    ('Julia','S','França',78912345610,'Rua Laranjeiras, 861, Centro - Cidade das Flores'),
    ('Roberta','G','Assis',98745632110,'Avenida Koller 19, Centro - Cidade das Flores'),
    ('Isabela','M','Cruz',65498732110,'Rua Alameda das Flores, 28 - Centro - Cidade das Flores');

    
insert into product (pname, classification_kids, category, avaliação, size) values
	('Fone de Ouvido',false,'Eletrônico','4',null),
    ('Barbie Elsa',true,'Brinquedos','3',null),
    ('Body Carters',true,'Vestuário','5',null),
    ('Microfone Vedo - Youtuber',False,'Eletrônico','4',null),
    ('Sofá retrátil',false,'Móveis','3','3x57x80'),
    ('Fire Stick Amazon',false,'Eletrônico','3',null);
    
insert into orders (idorderclient, orderstatus, orderdescription, sendvalue, paymentcash) values
	(1,default,'Compra via Aplicativo',null,1),
    (2,default,'Compra via Aplicativo',50,0),
    (3,'Confirmado',null,null,1),
    (4,default,'compra via web site',150,0),
    (2, default, 'Compra via Aplicativo',null,1);

insert into productorder (idpoproduct, idpoorder, poquantity, postatus) values
	(36,13,2,null),
    (41,15,1,null),
    (39,14,1,null);

-- Colocar o endereço inteiro   
insert into productstorage (storagelocation, quantity) values
	('Rio de Janeiro', 1000),
    ('Rio de Janeiro', 500),
    ('São Paulo', 10),
    ('São Paulo', 100),
    ('Belo Horizonte', 1000),
    ('Brasília',60);
    
insert into storagelocation (idlproduct, idlstorage, location) values
	(39,20,'RJ'),
    (41,24,'GO');
    
insert into supplier (socialname, cnpj, contact) values
	('Almeida e Filhos', 12345678901234, '21985474'),
    ('Eletrônicos Silva', 85451964914345, '21985484'),
    ('Eletrônicos Valma', 93456789393469, '21975474');

insert into productsupplier (idpssupplier, idpsproduct, quantity) values
	(1,37,500),
    (1,36,400),
    (2,39,633),
    (3,40,5),
    (2,41,10);
    
insert into seller (socialname, abstname, cnpj, cpf, location, contact) values
	('Tech Eletronics', null, 12345678945632, null, 'Rjo de Janeiro', 219946287),
    ('Botique Durgas', null, null, 12345678310, 'Rio de Janeiro', 219567895),
    ('Kids World', null, 45678912365448, null, 'São Paulo', 1198657484);

insert into productseller (idpseller, idpproduct, prodquantity) values
	(1,39,80),
    (2,40,10);
    
