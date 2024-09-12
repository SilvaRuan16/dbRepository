create table tamanho(
	id serial not null primary key,
	nome varchar(20),
	desconto int
);

create table ingrediente(
	id serial not null primary key,
	nome varchar(100),
	preco float
);

create table fornada(
	id serial not null primary key,
	qtdPizza int,
	numFornada int
);

create table cliente(
	id serial not null primary key,
	nome varchar(100),
	telefone varchar(11),
	endereco varchar(160),
	login varchar(30),
	senha varchar(30)
);

create table pedido(
	id serial not null primary key,
	dtPedido date,
	hora time
);
alter table pedido add column idFornada int;
alter table pedido add column idCliente int;
alter table pedido add column idBebidaPedida int;

alter table pedido add foreign key (idFornada) references fornada(id);
alter table pedido add foreign key (idCliente) references cliente(id);
alter table pedido add foreign key (idBebidaPedida) references bebidaPedida(id);

create table pizza(
	id serial not null primary key,
	saborNome varchar(100),
	precoBase float
);

create table pizzaPedida(
	id serial not null primary key,
	quantidade int,
	idTamanho int,
	idIngrediente int,
	idPedido int,
	idPizza int,
	foreign key (idTamanho) references tamanho(id),
	foreign key (idIngrediente) references ingrediente(id),
	foreign key (idPedido) references pedido(id),
	foreign key (idPizza) references pizza(id)
);

create table bebida(
	id serial not null primary key,
	tipo varchar(30),
	preco float
);

create table bebidaPedida(
	id serial not null primary key,
	quantidade int,
	idBebida int,
	foreign key (idBebida) references bebida(id)
);