create database bd_Multsoldas;

/*============|========================|============*\
| Por: Müller | Controle de Patrimônio | 14/out/2025 |
| By:  Müller |    Property Control    | 14/out/2025 |
\*============|========================|============*/

use bd_Multsoldas;

create table tbl_clientes(
	id_cliente int primary key,
    nome varchar(50) not null,
    cpf_cnpj varchar(14) not null unique,
    cep varchar(8) not null,
    rua varchar(50) not null,
    num varchar(6) not null,
    complemento varchar(10),
    bairro varchar(20) not null,
    cidade varchar(20) not null,
    uf varchar(2) not null
);
create table tbl_cilindros(
	id_cilindro int primary key,
    cilindro varchar(20) not null,
    tamanho float(6, 2) not null,
    marca varchar(15) not null
);
create table tbl_gases(
	id_gas int primary key,
    gas varchar(20) not null,
    volume varchar(5),
    foreign key (id_cilindro) references tbl_cilindros(id_cilindro)
);
create table tbl_documentos(
	id_pedido int primary key,
    foreign key (id_cliente) references tbl_clientes(id_cliente)
);
