DROP DATABASE IF EXISTS shop;

CREATE DATABASE shop;

USE shop;

create table clients (
	clientid int not null auto_increment primary key,
	username varchar(30) not null,
	password varchar(30) not null,
	address varchar(30),
	pcode varchar(30),
	city varchar(30),
	phone varchar(30),
	email varchar(30)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table products (
	productid int not null auto_increment primary key,
	productname varchar(30) not null,
	productimageurl varchar(30) not null,
	availablequantity int not null,
	price float(6,2) not null,
	productdescription varchar(64) not null,
	productcat1 varchar(30) not null,
	productcat2 varchar(30) not null,
	supplierid int not null
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table cart (
	cartid int not null auto_increment primary key,
	clientid int not null,
	productid int not null,
	productname varchar(30) not null,
	quantity int not null,
	totalprice float(6,2) not null
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table orders (
	orderid int not null auto_increment primary key,
	clientid int not null,
	contents varchar(200) not null,
	orderdate varchar(64) not null,
	totalprice float(6,2) not null
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into clients(username,password) values ("mitsos","kitsos");
insert into products values (1,"Apples, Red","applered.jpg",250,4.52,"Juicy red apples from Lakonia","Oporokipeutika","fruits",1);
insert into products values (2,"Apples, Golden","applegolden.jpg",150,3.85,"Delicious golden apples from Crete","Oporokipeutika","fruits",1);
insert into products values (3,"Lettuce","lettuce.jpg",200,2.90,"Fresh lettuce from our farm in Arkadia","Oporokipeutika","vegetables",1);
insert into products values (4,"Fakes","fakes.jpg",200,1.90,"Nostimes fakoules","Oporokipeutika","ospria",1);
insert into products values (5,"Cheese","cheese.jpg",200,12.90,"Headcheese Amfiloxias","Galaktokomika","cheese",2);
insert into products values (6,"Skim Milk","milk.jpg",200,3.90,"Gala Light 1,5%","Galaktokomika","milk",2);
insert into products values (7,"Yoghurt","yoghurt.jpg",200,7.90,"Greek Yoghurt","Galaktokomika","yoghurt",2);
insert into products values (8,"Mosxari","cow.jpg",200,11.90,"Mpoukia kai syxwrio","Kreata","cow",3);
insert into products values (9,"Xoirino","pig.jpg",200,10.90,"Gourounisia Brizola","Kreata","pig",3);
insert into products values (10,"Kotopoulo","chicken.jpg",200,8.90,"Arnaki aspro kai paxy","Kreata","chicken",3);
insert into products values (11,"Eggs","eggs.jpg",200,1.90,"Viologika auga","other","eggs",4);
insert into products values (12,"Olive Oil","oil.jpg",200,5.90,"Agno partheno elaiolado","other","oliveoil",4);
insert into products values (13,"Honey","honey.jpg",200,5.90,"Meli Thymarisio","other","honey",4);
	