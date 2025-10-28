create database bd_Multsoldas; --Criar o Banco de Dados bd_Multsoldas;

/*============|========================|============*\
| Por: Müller | Controle de Patrimônio | 14/out/2025 |
| By:  Müller |    Property Control    | 14/out/2025 |
\*============|========================|============*/

use bd_Multsoldas; --use o bd_Multsoldas;

create table tbl_clientes( --criar a tabela tbl_clientes;
	id_cliente int primary key,
    nome varchar(50) not null,
    cpf_cnpj varchar(14) not null unique,
    cep char(8) not null,
    rua varchar(50) not null,
    num varchar(6) not null,
    complemento varchar(10),
    bairro varchar(20) not null,
    cidade varchar(20) not null,
    uf char(2) not null
);
create table tbl_pEntrega(
	id_pEntrega int primary key,
    id_cliente int,
    foreign key (id_cliente) references tbl_clientes(id_cliente),
    ponto varchar(10) not null,
    cep char(8) not null,
    rua varchar(50) not null,
    num varchar(6) not null,
    complemento varchar(10),
    bairro varchar(20) not null,
    cidade varchar(20) not null,
    uf char(2) not null
);
create table tbl_cilindros(
	id_cilindro int primary key,
    cilindro varchar(20) not null,
    tamanho float(6, 2) not null,
    marca varchar(15) not null,
    empresa enum('Atms', 'AirP', 'Mult') not null,
    num_serial int(6) not null
);
create table tbl_gases(
	id_gas int primary key,
    gas varchar(20) not null,
    volume varchar(5),
	id_cilindro int,
    foreign key (id_cilindro) references tbl_cilindros(id_cilindro)
);
create table tbl_pedidos(
	id_pedido int primary key,
    dt_pedido datetime default (now()) not null,
	id_cliente int,
    foreign key (id_cliente) references tbl_clientes(id_cliente),
    id_cilindro int,
    foreign key (id_cilindro) references tbl_cilindros(id_cilindro)
);
