create database pruebas;

use pruebas;

create table usuarios(
	idUsuario int primary key auto_increment,
	nombre varchar(50) not null,
	telefono varchar(15) not null,
	email varchar(30) not null
);