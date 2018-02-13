if object_id ('empleados') is not null
drop table empleados;

create table empleados(
nombre varchar(30) not null,
apellido varchar(20) not null,
documento char(8),
fechanacimiento datetime,
fechaingreso datetime,
sueldo decimal(6,2),
primary key(documento)
);

insert into empleados values('Ana','Acosta','22222222','1970/10/10','1995/05/05',228.50);
insert into empleados values('Carlos','Caseres','25555555','1978/02/06','1998/05/05',309);
insert into empleados values('Francisco','Garcia','26666666','1978/10/15','1998/10/02',250.68);
insert into empleados values('Gabriela','Garcia','30000000','1985/10/25','2000/12/22',300.25);
insert into empleados values('Luis','Lopez','31111111','1987/02/10','2000/08/21',350.98);

select nombre+space(1)+upper(apellido) as nombre,
stuff(documento,1,0,'DNI Nº ') as documento,
stuff(sueldo,1,0,'$ ') as sueldo from empleados;

select documento, stuff(ceiling(sueldo),1,0,'$ ') from empleados;

select nombre,apellido from empleados
where datename(month,fechanacimiento)='october';

select nombre,apellido from empleados
where datepart(year,fechaingreso)=2000;  


if object_id('visitas') is not null
drop table visitas;

create table visitas (
numero int identity,
nombre varchar(30) default 'Anonimo',
mail varchar(50),
pais varchar (20),
fecha datetime,
primary key(numero)
);

insert into visitas (nombre,mail,pais,fecha)
values ('Ana Maria Lopez','AnaMaria@hotmail.com','Argentina','2006-10-10 10:10');
insert into visitas (nombre,mail,pais,fecha)
values ('Gustavo Gonzalez','GustavoGGonzalez@hotmail.com','Chile','2006-10-10 21:30');
insert into visitas (nombre,mail,pais,fecha)
values ('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-10-11 15:45');
insert into visitas (nombre,mail,pais,fecha)
values ('Fabiola Martinez','MartinezFabiola@hotmail.com','Mexico','2006-10-12 08:15');
insert into visitas (nombre,mail,pais,fecha)
values ('Fabiola Martinez','MartinezFabiola@hotmail.com','Mexico','2006-09-12 20:45');
insert into visitas (nombre,mail,pais,fecha)
values ('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-09-12 16:20');
insert into visitas (nombre,mail,pais,fecha)
values ('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-09-15 16:25');

select *from visitas
order by fecha desc;

select nombre,pais,datename(month,fecha)
from visitas
order by pais,datename(month,fecha) desc;

select nombre,mail,
datename(month,fecha) mes,
datename(day,fecha) dia,
datename(hour,fecha) hora
from visitas
order by 3,4,5;

select mail, pais
from visitas
where datename(month,fecha)='October'
order by 2;



if object_id('medicamentos') is not null
drop table medicamentos;

create table medicamentos(
codigo int identity,
nombre varchar(20),
laboratorio varchar(20),
precio decimal(5,2),
cantidad tinyint,
primary key(codigo)
);

insert into medicamentos
values('Sertal','Roche',5.2,100);
insert into medicamentos
values('Buscapina','Roche',4.10,200);
insert into medicamentos
values('Amoxidal 500','Bayer',15.60,100);
insert into medicamentos
values('Paracetamol 500','Bago',1.90,200);
insert into medicamentos
values('Bayaspirina','Bayer',2.10,150); 
insert into medicamentos
values('Amoxidal jarabe','Bayer',5.10,250); 

select codigo,nombre
from medicamentos
where laboratorio='Roche' and
precio<5;

select * from medicamentos
where laboratorio='Roche' or
precio<5;

select * from medicamentos
where not laboratorio='Bayer' and
cantidad=100;

select * from medicamentos
where laboratorio='Bayer' and
not cantidad=100;

delete from medicamentos
where laboratorio='Bayer' and
precio>10;

update medicamentos set cantidad=200
where laboratorio='Roche' and
precio>5;

delete from medicamentos
where laboratorio='Bayer' or
precio<3;

  
if object_id('peliculas') is not null
drop table peliculas;

create table peliculas(
codigo int identity,
titulo varchar(40) not null,
actor varchar(20),
duracion tinyint,
primary key (codigo)
);

insert into peliculas
values('Mision imposible','Tom Cruise',120);
insert into peliculas
values('Harry Potter y la piedra filosofal','Daniel R.',null);
insert into peliculas
values('Harry Potter y la camara secreta','Daniel R.',190);
insert into peliculas
values('Mision imposible 2','Tom Cruise',120);
insert into peliculas
values('Mujer bonita',null,120);
insert into peliculas
values('Tootsie','D. Hoffman',90);
insert into peliculas (titulo)
values('Un oso rojo');

select *from peliculas
where actor is null;

update peliculas set duracion=0
where duracion is null;

delete from peliculas
where actor is null and
duracion=0;

select * from peliculas;

if object_id('visitas') is not null
drop table visitas;

create table visitas (
numero int identity,
nombre varchar(30) default 'Anonimo',
mail varchar(50),
pais varchar (20),
fechayhora datetime,
primary key(numero)
);

insert into visitas (nombre,mail,pais,fechayhora)
values ('Ana Maria Lopez','AnaMaria@hotmail.com','Argentina','2006-10-10 10:10');
insert into visitas (nombre,mail,pais,fechayhora)
values ('Gustavo Gonzalez','GustavoGGonzalez@gotmail.com','Chile','2006-10-10 21:30');
insert into visitas (nombre,mail,pais,fechayhora)
values ('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-10-11 15:45');
insert into visitas (nombre,mail,pais,fechayhora)
values ('Fabiola Martinez','MartinezFabiola@hotmail.com','Mexico','2006-10-12 08:15');
insert into visitas (nombre,mail,pais,fechayhora)
values ('Fabiola Martinez','MartinezFabiola@hotmail.com','Mexico','2006-09-12 20:45');
insert into visitas (nombre,mail,pais,fechayhora)
values ('Juancito','JuanJosePerez@gmail.com','Argentina','2006-09-12 16:20');
insert into visitas (nombre,mail,pais,fechayhora)
values ('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-09-15 16:25');
insert into visitas (nombre,mail,pais)
values ('Federico1','federicogarcia@xaxamail.com','Argentina');

select *from visitas
where fechayhora between '2006-09-12' and '2006-10-11';

select *from visitas
where numero between 2 and 5;


if object_id('medicamentos') is not null
drop table medicamentos;

create table medicamentos(
codigo int identity,
nombre varchar(20),
laboratorio varchar(20),
precio decimal(6,2),
cantidad tinyint,
fechavencimiento datetime not null,
primary key(codigo)
);

insert into medicamentos
values('Sertal','Roche',5.2,1,'2005-02-01');
insert into medicamentos 
values('Buscapina','Roche',4.10,3,'2006-03-01');
insert into medicamentos 
values('Amoxidal 500','Bayer',15.60,100,'2007-05-01');
insert into medicamentos
values('Paracetamol 500','Bago',1.90,20,'2008-02-01');
insert into medicamentos 
values('Bayaspirina','Bayer',2.10,150,'2009-12-01'); 
insert into medicamentos 
values('Amoxidal jarabe','Bayer',5.10,250,'2010-10-01'); 

select nombre,precio from medicamentos
where laboratorio in ('Bayer','Bago');

select *from medicamentos
where cantidad between 1 and 5;

select *from medicamentos
where cantidad in (1,2,3,4,5);

if object_id('empleados') is not null
drop table empleados;

create table empleados(
nombre varchar(30),
documento char(8),
domicilio varchar(30),
fechaingreso datetime,
seccion varchar(20),
sueldo decimal(6,2),
primary key(documento)
);

insert into empleados
values('Juan Perez','22333444','Colon 123','1990-10-08','Gerencia',900.50);
insert into empleados
values('Ana Acosta','23444555','Caseros 987','1995-12-18','Secretaria',590.30);
insert into empleados
values('Lucas Duarte','25666777','Sucre 235','2005-05-15','Sistemas',790);
insert into empleados
values('Pamela Gonzalez','26777888','Sarmiento 873','1999-02-12','Secretaria',550);
insert into empleados
values('Marcos Juarez','30000111','Rivadavia 801','2002-09-22','Contaduria',630.70);
insert into empleados
values('Yolanda Perez','35111222','Colon 180','1990-10-08','Administracion',400);
insert into empleados
values('Rodolfo Perez','35555888','Coronel Olmedo 588','1990-05-28','Sistemas',800);

select *from empleados
where nombre like '%Perez%';

select *from empleados
where domicilio like 'Co%8%';

select *from empleados
where documento like '%[02468]';

select *from empleados
where documento like '[^13]%' and
nombre like '%ez';

select nombre from empleados
where nombre like '%[yj]%';

select nombre,seccion from empleados
where seccion like '[SG]_______';

select nombre,seccion from empleados
where seccion not like '[SG]%';

select nombre,sueldo from empleados
where sueldo not like '%.00';

select *from empleados
where fechaingreso like '%1990%';


if object_id('medicamentos') is not null
drop table medicamentos;

create table medicamentos(
codigo int identity,
nombre varchar(20),
laboratorio varchar(20),
precio decimal(6,2),
cantidad tinyint,
fechavencimiento datetime not null,
numerolote int default null,
primary key(codigo)
);

insert into medicamentos
values('Sertal','Roche',5.2,1,'2005-02-01',null);
insert into medicamentos 
values('Buscapina','Roche',4.10,3,'2006-03-01',null);
insert into medicamentos 
values('Amoxidal 500','Bayer',15.60,100,'2007-05-01',null);
insert into medicamentos
values('Paracetamol 500','Bago',1.90,20,'2008-02-01',null);
insert into medicamentos 
values('Bayaspirina',null,2.10,null,'2009-12-01',null); 
insert into medicamentos 
values('Amoxidal jarabe','Bayer',null,250,'2009-12-15',null); 

select count(*)
from medicamentos;

select count(laboratorio)
from medicamentos;

select count(precio) as 'Con precio',
count(cantidad) as 'Con cantidad'
from medicamentos;

select count(precio)
from medicamentos
where laboratorio like 'B%';

select count(numerolote) from medicamentos;

if object_id('empleados') is not null
drop table empleados;

create table empleados(
nombre varchar(30),
documento char(8),
domicilio varchar(30),
seccion varchar(20),
sueldo decimal(6,2),
cantidadhijos tinyint,
primary key(documento)
);

insert into empleados
values('Juan Perez','22333444','Colon 123','Gerencia',5000,2);
insert into empleados
values('Ana Acosta','23444555','Caseros 987','Secretaria',2000,0);
insert into empleados
values('Lucas Duarte','25666777','Sucre 235','Sistemas',4000,1);
insert into empleados
values('Pamela Gonzalez','26777888','Sarmiento 873','Secretaria',2200,3);
insert into empleados
values('Marcos Juarez','30000111','Rivadavia 801','Contaduria',3000,0);
insert into empleados
values('Yolanda Perez','35111222','Colon 180','Administracion',3200,1);
insert into empleados
values('Rodolfo Perez','35555888','Coronel Olmedo 588','Sistemas',4000,3);
insert into empleados
values('Martina Rodriguez','30141414','Sarmiento 1234','Administracion',3800,4);
insert into empleados
values('Andres Costa','28444555',default,'Secretaria',null,null);

select count(*)
from empleados;

select count(sueldo)
from empleados
where seccion='Secretaria';

select max(sueldo) as 'Mayor sueldo',
min(sueldo) as 'Menor sueldo'
from empleados;

select max(cantidadhijos)
from empleados
where nombre like '%Perez%';

select avg(sueldo)
from empleados;

select avg(sueldo)
from empleados
where seccion='Secretaria';

select avg(cantidadhijos)
from empleados
where seccion='Sistemas';

if object_id('visitantes') is not null
drop table visitantes;

create table visitantes(
nombre varchar(30),
edad tinyint,
sexo char(1) default 'f',
domicilio varchar(30),
ciudad varchar(20) default 'Cordoba',
telefono varchar(11),
mail varchar(30) default 'no tiene',
montocompra decimal (6,2)
);

insert into visitantes
values ('Susana Molina',35,default,'Colon 123',default,null,null,59.80);
insert into visitantes
values ('Marcos Torres',29,'m',default,'Carlos Paz',default,'marcostorres@hotmail.com',150.50);
insert into visitantes
values ('Mariana Juarez',45,default,default,'Carlos Paz',null,default,23.90);
insert into visitantes (nombre, edad,sexo,telefono, mail)
values ('Fabian Perez',36,'m','4556677','fabianperez@xaxamail.com');
insert into visitantes (nombre, ciudad, montocompra)
values ('Alejandra Gonzalez','La Falda',280.50);
insert into visitantes (nombre, edad,sexo, ciudad, mail,montocompra)
values ('Gaston Perez',29,'m','Carlos Paz','gastonperez1@gmail.com',95.40);
insert into visitantes
values ('Liliana Torres',40,default,'Sarmiento 876',default,default,default,85);
insert into visitantes
values ('Gabriela Duarte',21,null,null,'Rio Tercero',default,'gabrielaltorres@hotmail.com',321.50);

select ciudad, count(*)
from visitantes
group by ciudad;

select ciudad, count(telefono)
from visitantes
group by ciudad;

select sexo, sum(montocompra)
from visitantes
group by sexo;

select sexo,ciudad,
max(montocompra) as mayor,
min(montocompra) as menor
from visitantes
group by sexo,ciudad;

select ciudad,
avg(montocompra) as 'promedio de compras'
from visitantes
group by ciudad;

select ciudad,
count(*) as 'cantidad con mail'
from visitantes
where mail is not null and
mail<>'no tiene'
group by ciudad;

select ciudad,
count(*) as 'cantidad con mail'
from visitantes
where mail is not null and
mail<>'no tiene'
group by all ciudad;


if object_id('empleados') is not null
drop table empleados;

create table empleados(
nombre varchar(30),
documento char(8),
domicilio varchar(30),
seccion varchar(20),
sueldo decimal(6,2),
cantidadhijos tinyint,
fechaingreso datetime,
primary key(documento)
);

insert into empleados
values('Juan Perez','22333444','Colon 123','Gerencia',5000,2,'1980-05-10');
insert into empleados
values('Ana Acosta','23444555','Caseros 987','Secretaria',2000,0,'1980-10-12');
insert into empleados
values('Lucas Duarte','25666777','Sucre 235','Sistemas',4000,1,'1985-05-25');
insert into empleados
values('Pamela Gonzalez','26777888','Sarmiento 873','Secretaria',2200,3,'1990-06-25');
insert into empleados
values('Marcos Juarez','30000111','Rivadavia 801','Contaduria',3000,0,'1996-05-01');
insert into empleados
values('Yolanda Perez','35111222','Colon 180','Administracion',3200,1,'1996-05-01');
insert into empleados
values('Rodolfo Perez','35555888','Coronel Olmedo 588','Sistemas',4000,3,'1996-05-01');
insert into empleados
values('Martina Rodriguez','30141414','Sarmiento 1234','Administracion',3800,4,'2000-09-01');
insert into empleados
values('Andres Costa','28444555',default,'Secretaria',null,null,null);

select seccion, count(*)
from empleados
group by seccion;

select seccion, avg(cantidadhijos) as 'promedio de hijos'
from empleados
group by seccion;

select datepart(year,fechaingreso), count(*)
from empleados
group by datepart(year,fechaingreso);

select seccion, avg(sueldo) as 'promedio de sueldo'
from empleados
where cantidadhijos>0 and
cantidadhijos is not null
group by seccion;

select seccion, avg(sueldo) as 'promedio de sueldo'
from empleados
where cantidadhijos>0 and
cantidadhijos is not null
group by all seccion;


if object_id('clientes') is not null
drop table clientes;

create table clientes (
codigo int identity,
nombre varchar(30) not null,
domicilio varchar(30),
ciudad varchar(20),
provincia varchar (20),
telefono varchar(11),
primary key(codigo)
);

insert into clientes
values ('Lopez Marcos','Colon 111','Cordoba','Cordoba','null');
insert into clientes
values ('Perez Ana','San Martin 222','Cruz del Eje','Cordoba','4578585');
insert into clientes
values ('Garcia Juan','Rivadavia 333','Villa del Rosario','Cordoba','4578445');
insert into clientes
values ('Perez Luis','Sarmiento 444','Rosario','Santa Fe',null);
insert into clientes
values ('Pereyra Lucas','San Martin 555','Cruz del Eje','Cordoba','4253685');
insert into clientes
values ('Gomez Ines','San Martin 666','Santa Fe','Santa Fe','0345252525');
insert into clientes
values ('Torres Fabiola','Alem 777','Villa del Rosario','Cordoba','4554455');
insert into clientes
values ('Lopez Carlos',null,'Cruz del Eje','Cordoba',null);
insert into clientes
values ('Ramos Betina','San Martin 999','Cordoba','Cordoba','4223366');
insert into clientes
values ('Lopez Lucas','San Martin 1010','Posadas','Misiones','0457858745');

select ciudad, provincia,
count(*) as cantidad
from clientes
group by ciudad,provincia;

select ciudad, provincia,
count(*) as cantidad
from clientes
group by ciudad,provincia
having count(*)>1;

select ciudad, count(*)
from clientes
where domicilio like '%San Martin%'
group by all ciudad
having count(*)<2 and
ciudad <> 'Cordoba';


if object_id('visitantes') is not null
drop table visitantes;

create table visitantes(
nombre varchar(30),
edad tinyint,
sexo char(1),
domicilio varchar(30),
ciudad varchar(20),
telefono varchar(11),
montocompra decimal(6,2) not null
);

insert into visitantes
values ('Susana Molina',28,'f',null,'Cordoba',null,45.50); 
insert into visitantes
values ('Marcela Mercado',36,'f','Avellaneda 345','Cordoba','4545454',22.40);
insert into visitantes
values ('Alberto Garcia',35,'m','Gral. Paz 123','Alta Gracia','03547123456',25); 
insert into visitantes
values ('Teresa Garcia',33,'f',default,'Alta Gracia','03547123456',120);
insert into visitantes
values ('Roberto Perez',45,'m','Urquiza 335','Cordoba','4123456',33.20);
insert into visitantes
values ('Marina Torres',22,'f','Colon 222','Villa Dolores','03544112233',95);
insert into visitantes
values ('Julieta Gomez',24,'f','San Martin 333','Alta Gracia',null,53.50);
insert into visitantes
values ('Roxana Lopez',20,'f','null','Alta Gracia',null,240);
insert into visitantes
values ('Liliana Garcia',50,'f','Paso 999','Cordoba','4588778',48);
insert into visitantes
values ('Juan Torres',43,'m','Sarmiento 876','Cordoba',null,15.30);

select ciudad,sexo,
sum(montocompra) as Total
from visitantes
group by ciudad,sexo
having sum(montocompra)>50;

select ciudad, sexo,
sum(montocompra) as 'total'
from visitantes
where montocompra>50 and
telefono is not null
group by all ciudad,sexo
having ciudad<>'Cordoba'
order by ciudad;

select ciudad,max(montocompra) as maximo
from visitantes
where domicilio is not null and
sexo='f'
group by all ciudad
having max(montocompra)>50;

select ciudad,sexo, count(*) as cantidad,
sum(montocompra) as total,
avg(montocompra) as promedio
from visitantes
group by ciudad,sexo
having avg(montocompra)>30
order by total;

if object_id('clientes') is not null
drop table clientes;

create table clientes (
codigo int identity,
nombre varchar(30) not null,
domicilio varchar(30),
ciudad varchar(20),
provincia varchar (20),
primary key(codigo)
);

insert into clientes
values ('Lopez Marcos','Colon 111','Cordoba','Cordoba');
insert into clientes
values ('Perez Ana','San Martin 222','Cruz del Eje','Cordoba');
insert into clientes
values ('Garcia Juan','Rivadavia 333','Villa del Rosario','Cordoba');
insert into clientes
values ('Perez Luis','Sarmiento 444','Rosario','Santa Fe');
insert into clientes
values ('Pereyra Lucas','San Martin 555','Cruz del Eje','Cordoba');
insert into clientes
values ('Gomez Ines','San Martin 666','Santa Fe','Santa Fe');
insert into clientes
values ('Torres Fabiola','Alem 777','Villa del Rosario','Cordoba');
insert into clientes
values ('Lopez Carlos',null,'Cruz del Eje','Cordoba');
insert into clientes
values ('Ramos Betina','San Martin 999','Cordoba','Cordoba');
insert into clientes
values ('Lopez Lucas','San Martin 1010','Posadas','Misiones');

select distinct provincia from clientes;

select count(distinct provincia) as cantidad
from clientes;

select distinct ciudad from clientes;

select count(distinct ciudad) from clientes;

select distinct ciudad from clientes
where provincia='Cordoba';

select provincia,count(distinct ciudad)
from clientes
group by provincia;

if object_id('inmuebles') is not null
drop table inmuebles;

create table inmuebles (
documento varchar(8) not null,
apellido varchar(30),
nombre varchar(30),
domicilio varchar(20),
barrio varchar(20),
ciudad varchar(20),
tipo char(1),--b=baldio, e: edificado
superficie decimal (8,2)
);

insert into inmuebles
values ('11000000','Perez','Alberto','San Martin 800','Centro','Cordoba','e',100);
insert into inmuebles
values ('11000000','Perez','Alberto','Sarmiento 245','Gral. Paz','Cordoba','e',200);
insert into inmuebles
values ('12222222','Lopez','Maria','San Martin 202','Centro','Cordoba','e',250);
insert into inmuebles
values ('13333333','Garcia','Carlos','Paso 1234','Alberdi','Cordoba','b',200);
insert into inmuebles
values ('13333333','Garcia','Carlos','Guemes 876','Alberdi','Cordoba','b',300);
insert into inmuebles
values ('14444444','Perez','Mariana','Caseros 456','Flores','Cordoba','b',200);
insert into inmuebles
values ('15555555','Lopez','Luis','San Martin 321','Centro','Carlos Paz','e',500);
insert into inmuebles
values ('15555555','Lopez','Luis','Lopez y Planes 853','Flores','Carlos Paz','e',350);
insert into inmuebles
values ('16666666','Perez','Alberto','Sucre 1877','Flores','Cordoba','e',150);

select distinct apellido from inmuebles;

select distinct documento from inmuebles;

select count(distinct documento)
from inmuebles
where ciudad='Cordoba';

select count(ciudad)
from inmuebles
where domicilio like 'San Martin %';

select distinct apellido,nombre 
from inmuebles;

select documento,count(distinct barrio) as 'cantidad'
from inmuebles
group by documento;

if object_id('empleados') is not null
drop table empleados;

create table empleados (
documento varchar(8) not null,
nombre varchar(30),
estadocivil char(1),--c=casado, s=soltero,v=viudo
seccion varchar(20)
);

insert into empleados
values ('22222222','Alberto Lopez','c','Sistemas');
insert into empleados
values ('23333333','Beatriz Garcia','c','Administracion');
insert into empleados
values ('24444444','Carlos Fuentes','s','Administracion');
insert into empleados
values ('25555555','Daniel Garcia','s','Sistemas');
insert into empleados
values ('26666666','Ester Juarez','c','Sistemas');
insert into empleados
values ('27777777','Fabian Torres','s','Sistemas');
insert into empleados
values ('28888888','Gabriela Lopez',null,'Sistemas');
insert into empleados
values ('29999999','Hector Garcia',null,'Administracion');

select top 5 *from empleados;

select top 4 nombre,seccion
from empleados
order by seccion;

select top 4 with ties nombre,seccion
from empleados
order by seccion;

select top 4 nombre,estadocivil,seccion
from empleados
order by estadocivil,seccion;

select top 4 with ties nombre,estadocivil,seccion
from empleados
order by estadocivil,seccion;

if object_id('vehiculos') is not null
drop table vehiculos;

create table vehiculos(
patente char(6) not null,
tipo char(1),--'a'=auto, 'm'=moto
horallegada datetime not null,
horasalida datetime
);

alter table vehiculos
add constraint CK_vehiculos_tipo
check (tipo in ('a','m'));

alter table vehiculos
add constraint DF_vehiculos_tipo
default 'a'
for tipo;

alter table vehiculos
add constraint CK_vehiculos_patente_patron
check (patente like '[A-Z][A-Z][A-Z][0-9][0-9][0-9]');

alter table vehiculos
add constraint PK_vehiculos_patentellegada
primary key(patente,horallegada);

insert into vehiculos values('SDR456','a','2005/10/10 10:10',null);

insert into vehiculos values('SDR456','m','2005/10/10 10:10',null);

insert into vehiculos values('SDR456','m','2005/10/10 12:10',null);

insert into vehiculos values('SDR111','m','2005/10/10 10:10',null);

sp_helpconstraint vehiculos;

alter table vehiculos
drop DF_vehiculos_tipo;

sp_helpconstraint vehiculos;

alter table vehiculos
drop PK_vehiculos_patentellegada, CK_vehiculos_tipo;

sp_helpconstraint vehiculos;

if object_id('alumnos') is not null
drop table alumnos;
create table alumnos(
legajo char(5) not null,
documento char(8) not null,
apellido varchar(30),
nombre varchar(30),
notafinal decimal(4,2)
);

create nonclustered index I_alumnos_apellido
on alumnos(apellido);

alter table alumnos
add constraint PK_alumnos_legajo
primary key clustered (legajo);

sp_helpindex alumnos;

drop index PK_alumnos_legajo;

drop index I_alumnos_apellido;

drop index alumnos.I_alumnos_apellido;

sp_helpindex alumnos;

if exists (select name from sysindexes
where name = 'I_alumnos_apellido')
drop index alumnos.I_alumnos_apellido;

alter table alumnos
drop PK_alumnos_legajo;

sp_helpindex alumnos;

if (object_id('clientes')) is not null
drop table clientes;
if (object_id('provincias')) is not null
drop table provincias;

create table clientes (
codigo int identity,
nombre varchar(30),
domicilio varchar(30),
ciudad varchar(20),
codigoprovincia tinyint not null,
primary key(codigo)
);

create table provincias(
codigo tinyint identity,
nombre varchar(20),
primary key (codigo)
);

insert into provincias (nombre) values('Cordoba');
insert into provincias (nombre) values('Santa Fe');
insert into provincias (nombre) values('Corrientes');

insert into clientes values ('Lopez Marcos','Colon 111','Córdoba',1);
insert into clientes values ('Perez Ana','San Martin 222','Cruz del Eje',1);
insert into clientes values ('Garcia Juan','Rivadavia 333','Villa Maria',1);
insert into clientes values ('Perez Luis','Sarmiento 444','Rosario',2);
insert into clientes values ('Pereyra Lucas','San Martin 555','Cruz del Eje',1);
insert into clientes values ('Gomez Ines','San Martin 666','Santa Fe',2);
insert into clientes values ('Torres Fabiola','Alem 777','Ibera',3);

select c.nombre,domicilio,ciudad,p.nombre
from clientes as c
join provincias as p
on c.codigoprovincia=p.codigo;

select c.nombre,domicilio,ciudad,p.nombre
from clientes as c
join provincias as p
on c.codigoprovincia=p.codigo
order by p.nombre;

select c.nombre,domicilio,ciudad
from clientes as c
join provincias as p
on c.codigoprovincia=p.codigo
where p.nombre='Santa Fe';

if (object_id('inscriptos')) is not null
drop table inscriptos;
if (object_id('inasistencias')) is not null
drop table inasistencias;

create table inscriptos(
nombre varchar(30),
documento char(8),
deporte varchar(15),
matricula char(1), --'s'=paga 'n'=impaga
primary key(documento,deporte)
);

create table inasistencias(
documento char(8),
deporte varchar(15),
fecha datetime
);

insert into inscriptos values('Juan Perez','22222222','tenis','s');
insert into inscriptos values('Maria Lopez','23333333','tenis','s');
insert into inscriptos values('Agustin Juarez','24444444','tenis','n');
insert into inscriptos values('Marta Garcia','25555555','natacion','s');
insert into inscriptos values('Juan Perez','22222222','natacion','s');
insert into inscriptos values('Maria Lopez','23333333','natacion','n');

insert into inasistencias values('22222222','tenis','2006-12-01');
insert into inasistencias values('22222222','tenis','2006-12-08');
insert into inasistencias values('23333333','tenis','2006-12-01');
insert into inasistencias values('24444444','tenis','2006-12-08');
insert into inasistencias values('22222222','natacion','2006-12-02');
insert into inasistencias values('23333333','natacion','2006-12-02');

select nombre,insc.deporte,ina.fecha
from inscriptos as insc
join inasistencias as ina
on insc.documento=ina.documento and
insc.deporte=ina.deporte
order by nombre, insc.deporte;

select nombre,insc.deporte, ina.fecha
from inscriptos as insc
join inasistencias as ina
on insc.documento=ina.documento and
insc.deporte=ina.deporte
where insc.documento='22222222';

select nombre,insc.deporte, ina.fecha
from inscriptos as insc
join inasistencias as ina
on insc.documento=ina.documento and
insc.deporte=ina.deporte
where insc.matricula='s';

if (object_id('clientes')) is not null
drop table clientes;
if (object_id('provincias')) is not null
drop table provincias;

create table clientes (
codigo int identity,
nombre varchar(30),
domicilio varchar(30),
ciudad varchar(20),
codigoprovincia tinyint not null,
primary key(codigo)
);

create table provincias(
codigo tinyint identity,
nombre varchar(20),
primary key (codigo)
);

insert into provincias (nombre) values('Cordoba');
insert into provincias (nombre) values('Santa Fe');
insert into provincias (nombre) values('Corrientes');

insert into clientes values ('Lopez Marcos','Colon 111','Córdoba',1);
insert into clientes values ('Perez Ana','San Martin 222','Cruz del Eje',1);
insert into clientes values ('Garcia Juan','Rivadavia 333','Villa Maria',1);
insert into clientes values ('Perez Luis','Sarmiento 444','Rosario',2);
insert into clientes values ('Gomez Ines','San Martin 666','Santa Fe',2);
insert into clientes values ('Torres Fabiola','Alem 777','La Plata',4);
insert into clientes values ('Garcia Luis','Sucre 475','Santa Rosa',5);

select c.nombre,domicilio,ciudad, p.nombre
from clientes as c
left join provincias as p
on codigoprovincia = p.codigo;

select c.nombre,domicilio,ciudad, p.nombre
from provincias as p
left join clientes as c
on codigoprovincia = p.codigo;

select c.nombre,domicilio,ciudad, p.nombre
from clientes as c
left join provincias as p
on codigoprovincia = p.codigo
where p.codigo is not null;

select c.nombre,domicilio,ciudad, p.nombre
from clientes as c
left join provincias as p
on codigoprovincia = p.codigo
where p.codigo is null
order by c.nombre;

select c.nombre,domicilio,ciudad, p.nombre
from clientes as c
left join provincias as p
on codigoprovincia = p.codigo
where p.nombre='Cordoba';

if (object_id('clientes')) is not null
drop table clientes;
if (object_id('provincias')) is not null
drop table provincias;

create table clientes (
codigo int identity,
nombre varchar(30),
domicilio varchar(30),
ciudad varchar(20),
codigoprovincia tinyint not null,
primary key(codigo)
);

create table provincias(
codigo tinyint identity,
nombre varchar(20),
primary key (codigo)
);

insert into provincias (nombre) values('Cordoba');
insert into provincias (nombre) values('Santa Fe');
insert into provincias (nombre) values('Corrientes');

insert into clientes values ('Lopez Marcos','Colon 111','Córdoba',1);
insert into clientes values ('Perez Ana','San Martin 222','Cruz del Eje',1);
insert into clientes values ('Garcia Juan','Rivadavia 333','Villa Maria',1);
insert into clientes values ('Perez Luis','Sarmiento 444','Rosario',2);
insert into clientes values ('Gomez Ines','San Martin 666','Santa Fe',2);
insert into clientes values ('Torres Fabiola','Alem 777','La Plata',4);
insert into clientes values ('Garcia Luis','Sucre 475','Santa Rosa',5);

select c.nombre,domicilio,ciudad, p.nombre
from provincias as p
right join clientes as c
on codigoprovincia = p.codigo;

select c.nombre,domicilio,ciudad, p.nombre
from clientes as c
left join provincias as p
on codigoprovincia = p.codigo;

select c.nombre,domicilio,ciudad, p.nombre
from provincias as p
right join clientes as c
on codigoprovincia = p.codigo
where p.codigo is not null;

select c.nombre,domicilio,ciudad, p.nombre
from provincias as p
right join clientes as c
on codigoprovincia = p.codigo
where p.codigo is null
order by ciudad;

if (object_id('deportes')) is not null
drop table deportes;
if (object_id('inscriptos')) is not null
drop table inscriptos;
create table deportes(
codigo tinyint identity,
nombre varchar(30),
profesor varchar(30),
primary key (codigo)
);
create table inscriptos(
documento char(8),
codigodeporte tinyint not null,
matricula char(1) --'s'=paga 'n'=impaga
);

insert into deportes values('tenis','Marcelo Roca');
insert into deportes values('natacion','Marta Torres');
insert into deportes values('basquet','Luis Garcia');
insert into deportes values('futbol','Marcelo Roca');
 
insert into inscriptos values('22222222',3,'s');
insert into inscriptos values('23333333',3,'s');
insert into inscriptos values('24444444',3,'n');
insert into inscriptos values('22222222',2,'s');
insert into inscriptos values('23333333',2,'s');
insert into inscriptos values('22222222',4,'n'); 
insert into inscriptos values('22222222',5,'n'); 

select documento,d.nombre,matricula
from inscriptos as i
join deportes as d
on codigodeporte=codigo;

select documento,d.nombre,matricula
from inscriptos as i
left join deportes as d
on codigodeporte=codigo;

select documento,d.nombre,matricula
from deportes as d
right join inscriptos as i
on codigodeporte=codigo;

select nombre
from deportes as d
left join inscriptos as i
on codigodeporte=codigo
where codigodeporte is null;

select documento
from inscriptos as i
left join deportes as d
on codigodeporte=codigo
where codigo is null;

select documento,nombre,profesor,matricula
from inscriptos as i
full join deportes as d
on codigodeporte=codigo; 

if object_id('socios') is not null
drop table socios;
if object_id('deportes') is not null
drop table deportes;
if object_id('inscriptos') is not null
drop table inscriptos;

create table socios(
documento char(8) not null, 
nombre varchar(30),
domicilio varchar(30),
primary key(documento)
);
create table deportes(
codigo tinyint identity,
nombre varchar(20),
profesor varchar(15),
primary key(codigo)
);
create table inscriptos(
documento char(8) not null, 
codigodeporte tinyint not null,
anio char(4),
matricula char(1),--'s'=paga, 'n'=impaga
primary key(documento,codigodeporte,anio)
);

insert into socios values('22222222','Ana Acosta','Avellaneda 111');
insert into socios values('23333333','Betina Bustos','Bulnes 222');
insert into socios values('24444444','Carlos Castro','Caseros 333');
insert into socios values('25555555','Daniel Duarte','Dinamarca 44');

insert into deportes values('basquet','Juan Juarez');
insert into deportes values('futbol','Pedro Perez');
insert into deportes values('natacion','Marina Morales');
insert into deportes values('tenis','Marina Morales');

insert into inscriptos values ('22222222',3,'2006','s');
insert into inscriptos values ('23333333',3,'2006','s');
insert into inscriptos values ('24444444',3,'2006','n');

insert into inscriptos values ('22222222',3,'2005','s');
insert into inscriptos values ('22222222',3,'2007','n');

insert into inscriptos values ('24444444',1,'2006','s');
insert into inscriptos values ('24444444',2,'2006','s');

insert into inscriptos values ('26666666',0,'2006','s');

select s.nombre,d.nombre,anio
from deportes as d
right join inscriptos as i
on codigodeporte=d.codigo
left join socios as s
on i.documento=s.documento;

select s.nombre,d.nombre,anio,matricula
from deportes as d
full join inscriptos as i
on codigodeporte=d.codigo
full join socios as s
on s.documento=i.documento;

select s.nombre,d.nombre,anio,matricula
from deportes as d
join inscriptos as i
on codigodeporte=d.codigo
join socios as s
on s.documento=i.documento
where s.documento='22222222';

if object_id('clientes') is not null
drop table clientes;
if object_id('proveedores') is not null
drop table proveedores;
if object_id('empleados') is not null
drop table empleados;

create table proveedores(
codigo int identity,
nombre varchar (30),
domicilio varchar(30),
primary key(codigo)
);
create table clientes(
codigo int identity,
nombre varchar (30),
domicilio varchar(30),
primary key(codigo)
);
create table empleados(
documento char(8) not null,
nombre varchar(20),
apellido varchar(20),
domicilio varchar(30),
primary key(documento)
);

insert into proveedores values('Bebida cola','Colon 123');
insert into proveedores values('Carnes Unica','Caseros 222');
insert into proveedores values('Lacteos Blanca','San Martin 987');
insert into clientes values('Supermercado Lopez','Avellaneda 34');
insert into clientes values('Almacen Anita','Colon 987');
insert into clientes values('Garcia Juan','Sucre 345');
insert into empleados values('23333333','Federico','Lopez','Colon 987');
insert into empleados values('28888888','Ana','Marquez','Sucre 333');
insert into empleados values('30111111','Luis','Perez','Caseros 956');

select nombre, domicilio from proveedores
union
select nombre, domicilio from clientes
union
select (apellido+' '+nombre), domicilio from empleados;

select nombre, domicilio, 'proveedor' as categoria from proveedores
union
select nombre, domicilio, 'cliente' from clientes
union
select (apellido+' '+nombre), domicilio , 'empleado' from empleados
order by categoria;

if object_id('empleados') is not null
drop table empleados;

create table empleados(
apellido varchar(20),
nombre varchar(20),
domicilio varchar(30),
fechaingreso datetime
);
insert into empleados(apellido,nombre) values ('Rodriguez','Pablo');

alter table empleados
add sueldo decimal(5,2);

sp_columns empleados;

alter table empleados
add codigo int identity;

alter table empleados
add documento char(8) not null;

alter table empleados
add documento char(8) not null default '00000000';

sp_columns empleados;

alter table empleados
drop column sueldo;

sp_columns empleados;

alter table empleados
drop column documento;

alter table empleados
drop column codigo,fechaingreso;

sp_columns empleados;

if object_id('empleados') is not null
drop table empleados;

create table empleados(
legajo int not null,
documento char(7) not null,
nombre varchar(10),
domicilio varchar(30),
ciudad varchar(20) default 'Buenos Aires',
sueldo decimal(6,2),
cantidadhijos tinyint default 0,
primary key(legajo)
);

alter table empleados
alter column nombre varchar(30);

sp_columns empleados;

alter table empleados
alter column sueldo decimal(6,2) not null;

alter table empleados
alter column documento char(8) not null;

alter table empleados
alter column legajo tinyint not null;

insert into empleados values(1,'22222222','Juan Perez','Colon 123','Cordoba',500,3);
insert into empleados values(2,'30000000',null,'Sucre 456','Cordoba',600,2);

alter table empleados
alter column nombre varchar(30) not null;

delete from empleados where nombre is null;
alter table empleados
alter column nombre varchar(30) not null;

alter table empleados
alter column ciudad varchar(10);

insert into empleados values(3,'33333333','Juan Perez','Sarmiento 856',default,500,4);

alter table empleados
alter column ciudad varchar(15);

insert into empleados values(3,'33333333','Juan Perez','Sarmiento 856',default,500,4);

alter table empleados
alter column legajo int identity;

if object_id('articulos') is not null
drop table articulos;

create table articulos(
codigo int identity,
descripcion varchar(30),
precio decimal(5,2) not null,
cantidad smallint not null default 0,
montototal as precio *cantidad
);

insert into articulos values('birome',1.5,100,150);

insert into articulos values('birome',1.5,100);
insert into articulos values('cuaderno 12 hojas',4.8,150);
insert into articulos values('lapices x 12',5,200);

select *from articulos;

update articulos set precio=2 where descripcion='birome';
select *from articulos;

update articulos set cantidad=200 where descripcion='birome';
select *from articulos;

update articulos set montototal=300 where descripcion='birome';


if object_id ('empleados') is not null
drop table empleados;

if exists (select *from systypes
where name = 'tipo_año')
exec sp_droptype tipo_año;

exec sp_addtype tipo_año, 'int','null';

if object_id ('RG_año') is not null
drop rule RG_año;

create rule RG_año
as @año between 1990 and datepart(year,getdate());

exec sp_bindrule RG_año, 'tipo_año';

create table empleados(
documento char(8),
nombre varchar(30),
añoingreso tipo_año
);

insert into empleados values('22222222','Juan Lopez',1980);

insert into empleados values('22222222','Juan Lopez',2000);

drop rule RG_año;

exec sp_unbindrule 'tipo_año';

sp_helpconstraint empleados;
exec sp_help tipo_año;

drop rule RG_año;

sp_help RG_año;

insert into empleados values('22222222','Juan Lopez',1980);

exec sp_droptype tipo_año;

drop table empleados;

sp_help tipo_año;

exec sp_droptype tipo_año;

sp_help tipo_año;

if object_id('alumnos') is not null
drop table alumnos;

create table alumnos(
documento char(8),
nombre varchar(30),
nota decimal(4,2),
primary key(documento),
constraint CK_alumnos_nota_valores check (nota>=0 and nota <=10),
);

insert into alumnos values('30111111','Ana Algarbe',5.1);
insert into alumnos values('30222222','Bernardo Bustamante',3.2);
insert into alumnos values('30333333','Carolina Conte',4.5);
insert into alumnos values('30444444','Diana Dominguez',9.7);
insert into alumnos values('30555555','Fabian Fuentes',8.5);
insert into alumnos values('30666666','Gaston Gonzalez',9.70);

select alumnos.*
from alumnos
where nota=
(select max(nota) from alumnos);

select titulo,autor, precio
from libros
where precio=
(select titulo, max(precio) from libros);

select alumnos.*,
(select avg(nota) from alumnos)-nota as diferencia
from alumnos
where nota<
(select avg(nota) from alumnos);

update alumnos set nota=4
where nota=
(select min(nota) from alumnos);

delete from alumnos
where nota<
(select avg(nota) from alumnos);

if (object_id('ciudades')) is not null
drop table ciudades;
if (object_id('clientes')) is not null
drop table clientes;

create table ciudades(
codigo tinyint identity,
nombre varchar(20),
primary key (codigo)
);

create table clientes (
codigo int identity,
nombre varchar(30),
domicilio varchar(30),
codigociudad tinyint not null,
primary key(codigo),
constraint FK_clientes_ciudad
foreign key (codigociudad)
references ciudades(codigo)
on update cascade,
);

insert into ciudades (nombre) values('Cordoba');
insert into ciudades (nombre) values('Cruz del Eje');
insert into ciudades (nombre) values('Carlos Paz');
insert into ciudades (nombre) values('La Falda');
insert into ciudades (nombre) values('Villa Maria');

insert into clientes values ('Lopez Marcos','Colon 111',1);
insert into clientes values ('Lopez Hector','San Martin 222',1);
insert into clientes values ('Perez Ana','San Martin 333',2);
insert into clientes values ('Garcia Juan','Rivadavia 444',3);
insert into clientes values ('Perez Luis','Sarmiento 555',3);
insert into clientes values ('Gomez Ines','San Martin 666',4);
insert into clientes values ('Torres Fabiola','Alem 777',5);
insert into clientes values ('Garcia Luis','Sucre 888',5);

select nombre
from ciudades
where codigo in
(select codigociudad
from clientes
where domicilio like 'San Martin %');

select distinct ci.nombre
from ciudades as ci
join clientes as cl
on codigociudad=ci.codigo
where domicilio like 'San Martin%';

select nombre
from ciudades
where codigo not in
(select codigociudad
from clientes
where nombre like 'G%');

select codigociudad
from clientes
where nombre like 'G%';

if object_id('inscriptos') is not null
drop table inscriptos;
if object_id('socios') is not null
drop table socios;

create table socios(
numero int identity,
documento char(8),
nombre varchar(30),
domicilio varchar(30),
primary key (numero)
);
 
create table inscriptos (
numerosocio int not null,
deporte varchar(20) not null,
cuotas tinyint
constraint CK_inscriptos_cuotas
check (cuotas>=0 and cuotas<=10)
constraint DF_inscriptos_cuotas default 0,
primary key(numerosocio,deporte),
constraint FK_inscriptos_socio
foreign key (numerosocio)
references socios(numero)
on update cascade
on delete cascade,
);

insert into socios values('23333333','Alberto Paredes','Colon 111');
insert into socios values('24444444','Carlos Conte','Sarmiento 755');
insert into socios values('25555555','Fabian Fuentes','Caseros 987');
insert into socios values('26666666','Hector Lopez','Sucre 344');

insert into inscriptos values(1,'tenis',1);
insert into inscriptos values(1,'basquet',2);
insert into inscriptos values(1,'natacion',1);
insert into inscriptos values(2,'tenis',9);
insert into inscriptos values(2,'natacion',1);
insert into inscriptos values(2,'basquet',default);
insert into inscriptos values(2,'futbol',2);
insert into inscriptos values(3,'tenis',8);
insert into inscriptos values(3,'basquet',9);
insert into inscriptos values(3,'natacion',0);
insert into inscriptos values(4,'basquet',10);

select numero,nombre,deporte
from socios as s
join inscriptos as i
on numerosocio=numero;

select nombre
from socios
join inscriptos as i
on numero=numerosocio
where deporte='natacion' and 
numero= any
(select numerosocio
from inscriptos as i
where deporte='tenis');

select deporte
from inscriptos as i
where numerosocio=1 and
deporte= any
(select deporte
from inscriptos as i
where numerosocio=2);

select i1.deporte
from inscriptos as i1
join inscriptos as i2
on i1.deporte=i2.deporte
where i1.numerosocio=1 and
i2.numerosocio=2;

select deporte
from inscriptos as i
where numerosocio=2 and
cuotas>any
(select cuotas
from inscriptos
where numerosocio=1);

select deporte
from inscriptos as i
where numerosocio=2 and
cuotas>all
(select cuotas
from inscriptos
where numerosocio=1);

delete from inscriptos
where numerosocio=any
(select numerosocio 
from inscriptos
where cuotas=0);

if object_id('inscriptos') is not null
drop table inscriptos;
if object_id('socios') is not null
drop table socios;

create table socios(
numero int identity,
documento char(8),
nombre varchar(30),
domicilio varchar(30),
primary key (numero)
);
 
create table inscriptos (
numerosocio int not null,
deporte varchar(20) not null,
cuotas tinyint
constraint CK_inscriptos_cuotas
check (cuotas>=0 and cuotas<=10)
constraint DF_inscriptos_cuotas default 0,
primary key(numerosocio,deporte),
constraint FK_inscriptos_socio
foreign key (numerosocio)
references socios(numero)
on update cascade
on delete cascade,
);

insert into socios values('23333333','Alberto Paredes','Colon 111');
insert into socios values('24444444','Carlos Conte','Sarmiento 755');
insert into socios values('25555555','Fabian Fuentes','Caseros 987');
insert into socios values('26666666','Hector Lopez','Sucre 344');

insert into inscriptos values(1,'tenis',1);
insert into inscriptos values(1,'basquet',2);
insert into inscriptos values(1,'natacion',1);
insert into inscriptos values(2,'tenis',9);
insert into inscriptos values(2,'natacion',1);
insert into inscriptos values(2,'basquet',default);
insert into inscriptos values(2,'futbol',2);
insert into inscriptos values(3,'tenis',8);
insert into inscriptos values(3,'basquet',9);
insert into inscriptos values(3,'natacion',0);
insert into inscriptos values(4,'basquet',10);

select nombre,domicilio,
(select count(*)
from inscriptos as i
where s.numero=i.numerosocio) as 'deportes'
from socios as s;

select nombre,
(select (count(*)*10)
from inscriptos as i
where s.numero=i.numerosocio) as total,
(select sum(i.cuotas)
from inscriptos as i
where s.numero=i.numerosocio) as pagas
from socios as s;

select nombre,
count(i.deporte)*10 as total,
sum(i.cuotas) as pagas
from socios as s
join inscriptos as i
on numero=numerosocio
group by nombre;

if object_id('inscriptos') is not null
drop table inscriptos;
if object_id('socios') is not null
drop table socios;

create table socios(
numero int identity,
documento char(8),
nombre varchar(30),
domicilio varchar(30),
primary key (numero)
);
 
create table inscriptos (
numerosocio int not null,
deporte varchar(20) not null,
cuotas tinyint
constraint CK_inscriptos_cuotas
check (cuotas>=0 and cuotas<=10)
constraint DF_inscriptos_cuotas default 0,
primary key(numerosocio,deporte),
constraint FK_inscriptos_socio
foreign key (numerosocio)
references socios(numero)
on update cascade
on delete cascade,
);

insert into socios values('23333333','Alberto Paredes','Colon 111');
insert into socios values('24444444','Carlos Conte','Sarmiento 755');
insert into socios values('25555555','Fabian Fuentes','Caseros 987');
insert into socios values('26666666','Hector Lopez','Sucre 344');

insert into inscriptos values(1,'tenis',1);
insert into inscriptos values(1,'basquet',2);
insert into inscriptos values(1,'natacion',1);
insert into inscriptos values(2,'tenis',9);
insert into inscriptos values(2,'natacion',1);
insert into inscriptos values(2,'basquet',default);
insert into inscriptos values(2,'futbol',2);
insert into inscriptos values(3,'tenis',8);
insert into inscriptos values(3,'basquet',9);
insert into inscriptos values(3,'natacion',0);
insert into inscriptos values(4,'basquet',10);

select nombre
from socios as s
where exists
(select *from inscriptos as i
where s.numero=i.numerosocio
and i.deporte='natacion');

select nombre
from socios as s
where not exists
(select *from inscriptos as i
where s.numero=i.numerosocio
and i.deporte='natacion');

select s.*
from socios as s
where exists
(select *from inscriptos as i
where s.numero=i.numerosocio
and i.cuotas=10);

if object_id('inscriptos') is not null
drop table inscriptos;
if object_id('socios') is not null
drop table socios;
if object_id('deportes') is not null
drop table deportes;

create table socios(
documento char(8) not null, 
nombre varchar(30),
domicilio varchar(30),
primary key(documento)
);
create table deportes(
codigo tinyint identity,
nombre varchar(20),
profesor varchar(15),
primary key(codigo)
);
create table inscriptos(
documento char(8) not null, 
codigodeporte tinyint not null,
año char(4),
matricula char(1),--'s'=paga, 'n'=impaga
primary key(documento,codigodeporte,año),
constraint FK_inscriptos_socio
foreign key (documento)
references socios(documento)
on update cascade
on delete cascade
);

insert into socios values('22222222','Ana Acosta','Avellaneda 111');
insert into socios values('23333333','Betina Bustos','Bulnes 222');
insert into socios values('24444444','Carlos Castro','Caseros 333');
insert into socios values('25555555','Daniel Duarte','Dinamarca 44');

insert into deportes values('basquet','Juan Juarez');
insert into deportes values('futbol','Pedro Perez');
insert into deportes values('natacion','Marina Morales');
insert into deportes values('tenis','Marina Morales');

insert into inscriptos values ('22222222',3,'2006','s');
insert into inscriptos values ('23333333',3,'2006','s');
insert into inscriptos values ('24444444',3,'2006','n');
insert into inscriptos values ('22222222',3,'2005','s');
insert into inscriptos values ('22222222',3,'2007','n');
insert into inscriptos values ('24444444',1,'2006','s');
insert into inscriptos values ('24444444',2,'2006','s');

select i.documento,i.codigodeporte,d.nombre as deporte, año, matricula, d.profesor
from deportes as d
join inscriptos as i
on d.codigo=i.codigodeporte;

select s.nombre,td.deporte,td.profesor,td.año,td.matricula
from socios as s
join (select i.documento,i.codigodeporte,d.nombre as deporte, año, matricula, d.profesor
from deportes as d
join inscriptos as i
on d.codigo=i.codigodeporte) as td
on td.documento=s.documento;

if object_id('inscriptos') is not null
drop table inscriptos;
if object_id('socios') is not null
drop table socios;

create table socios(
numero int identity,
documento char(8),
nombre varchar(30),
domicilio varchar(30),
primary key (numero)
);
 
create table inscriptos (
numerosocio int not null,
deporte varchar(20) not null,
matricula char(1),-- 'n' o 's'
primary key(numerosocio,deporte),
constraint FK_inscriptos_socio
foreign key (numerosocio)
references socios(numero)
);

insert into socios values('23333333','Alberto Paredes','Colon 111');
insert into socios values('24444444','Carlos Conte','Sarmiento 755');
insert into socios values('25555555','Fabian Fuentes','Caseros 987');
insert into socios values('26666666','Hector Lopez','Sucre 344');

insert into inscriptos values(1,'tenis','s');
insert into inscriptos values(1,'basquet','s');
insert into inscriptos values(1,'natacion','s');
insert into inscriptos values(2,'tenis','s');
insert into inscriptos values(2,'natacion','s');
insert into inscriptos values(2,'basquet','n');
insert into inscriptos values(2,'futbol','n');
insert into inscriptos values(3,'tenis','s');
insert into inscriptos values(3,'basquet','s');
insert into inscriptos values(3,'natacion','n');
insert into inscriptos values(4,'basquet','n');

update inscriptos set matricula='s'
where numerosocio=
(select numero
from socios
where documento='25555555');

delete from inscriptos
where numerosocio in
(select numero
from socios as s
join inscriptos
on numerosocio=numero
where matricula='n');

if object_id('facturas') is not null
drop table facturas;
if object_id('clientes') is not null
drop table clientes;

create table clientes(
codigo int identity,
nombre varchar(30),
domicilio varchar(30),
primary key(codigo)
);

create table facturas(
numero int not null,
fecha datetime,
codigocliente int not null,
total decimal(6,2),
primary key(numero),
constraint FK_facturas_cliente
foreign key (codigocliente)
references clientes(codigo)
on update cascade
);

insert into clientes values('Juan Lopez','Colon 123');
insert into clientes values('Luis Torres','Sucre 987');
insert into clientes values('Ana Garcia','Sarmiento 576');
insert into clientes values('Susana Molina','San Martin 555');

insert into facturas values(1200,'2007-01-15',1,300);
insert into facturas values(1201,'2007-01-15',2,550);
insert into facturas values(1202,'2007-01-15',3,150);
insert into facturas values(1300,'2007-01-20',1,350);
insert into facturas values(1310,'2007-01-22',3,100);

if object_id ('clientespref') is not null
drop table clientespref;
create table clientespref(
nombre varchar(30),
domicilio varchar(30)
);

insert into clientespref
select nombre,domicilio
from clientes 
where codigo in 
(select codigocliente
from clientes as c
join facturas as f
on codigocliente=codigo
group by codigocliente
having sum(total)>500);

select *from clientespref;

if object_id('empleados')is not null
drop table empleados;
if object_id('sucursales')is not null
drop table sucursales;

create table sucursales( 
codigo int identity,
ciudad varchar(30) not null,
primary key(codigo)
); 

create table empleados( 
documento char(8) not null,
nombre varchar(30) not null,
domicilio varchar(30),
seccion varchar(20),
sueldo decimal(6,2),
codigosucursal int,
primary key(documento),
constraint FK_empleados_sucursal
foreign key (codigosucursal)
references sucursales(codigo)
on update cascade
); 

insert into sucursales values('Cordoba');
insert into sucursales values('Villa Maria');
insert into sucursales values('Carlos Paz');
insert into sucursales values('Cruz del Eje');

insert into empleados values('22222222','Ana Acosta','Avellaneda 111','Secretaria',500,1);
insert into empleados values('23333333','Carlos Caseros','Colon 222','Sistemas',800,1);
insert into empleados values('24444444','Diana Dominguez','Dinamarca 333','Secretaria',550,2);
insert into empleados values('25555555','Fabiola Fuentes','Francia 444','Sistemas',750,2);
insert into empleados values('26666666','Gabriela Gonzalez','Guemes 555','Secretaria',580,3);
insert into empleados values('27777777','Juan Juarez','Jujuy 777','Secretaria',500,4);
insert into empleados values('28888888','Luis Lopez','Lules 888','Sistemas',780,4);
insert into empleados values('29999999','Maria Morales','Marina 999','Contaduria',670,4);

select documento,nombre,domicilio,seccion,sueldo,ciudad
from empleados
join sucursales on codigosucursal=codigo;

if object_id('secciones') is not null
drop table secciones;

select distinct seccion as nombre
into secciones
from empleados;

select *from secciones;

if object_id('sueldosxseccion') is not null
drop table sueldosxseccion;

select seccion, sum(sueldo) as total
into sueldosxseccion
from empleados
group by seccion;

select *from sueldosxseccion;

if object_id('maximossueldos') is not null
drop table maximossueldos;

select top 3 *
into maximossueldos
from empleados
order by sueldo;

select *from maximossueldos;

if object_id('sucursalCordoba') is not null
drop table sucursalCordoba;

select nombre,ciudad
into sucursalCordoba
from empleados
join sucursales
on codigosucursal=codigo
where ciudad='Cordoba';

select *from sucursalCordoba;

if object_id('inscriptos') is not null  
drop table inscriptos;
if object_id('socios') is not null  
drop table socios;
if object_id('profesores') is not null  
drop table profesores; 
if object_id('cursos') is not null  
drop table cursos;

create table socios(
documento char(8) not null,
nombre varchar(40),
domicilio varchar(30),
constraint PK_socios_documento
primary key (documento)
);

create table profesores(
documento char(8) not null,
nombre varchar(40),
domicilio varchar(30),
constraint PK_profesores_documento
primary key (documento)
);

create table cursos(
numero tinyint identity,
deporte varchar(20),
dia varchar(15),
constraint CK_inscriptos_dia check (dia in('lunes','martes','miercoles','jueves','viernes','sabado')),
documentoprofesor char(8),
constraint PK_cursos_numero
primary key (numero),
);

create table inscriptos(
documentosocio char(8) not null,
numero tinyint not null,
matricula char(1),
constraint CK_inscriptos_matricula check (matricula in('s','n')),
constraint PK_inscriptos_documento_numero
primary key (documentosocio,numero)
);

insert into socios values('30000000','Fabian Fuentes','Caseros 987');
insert into socios values('31111111','Gaston Garcia','Guemes 65');
insert into socios values('32222222','Hector Huerta','Sucre 534');
insert into socios values('33333333','Ines Irala','Bulnes 345');

insert into profesores values('22222222','Ana Acosta','Avellaneda 231');
insert into profesores values('23333333','Carlos Caseres','Colon 245');
insert into profesores values('24444444','Daniel Duarte','Sarmiento 987');
insert into profesores values('25555555','Esteban Lopez','Sucre 1204');

insert into cursos values('tenis','lunes','22222222');
insert into cursos values('tenis','martes','22222222');
insert into cursos values('natacion','miercoles','22222222');
insert into cursos values('natacion','jueves','23333333');
insert into cursos values('natacion','viernes','23333333');
insert into cursos values('futbol','sabado','24444444');
insert into cursos values('futbol','lunes','24444444');
insert into cursos values('basquet','martes','24444444');

insert into inscriptos values('30000000',1,'s');
insert into inscriptos values('30000000',3,'n');
insert into inscriptos values('30000000',6,null);
insert into inscriptos values('31111111',1,'s');
insert into inscriptos values('31111111',4,'s');
insert into inscriptos values('32222222',8,'s');

if object_id('vista_club') is not null drop view vista_club;

create view vista_club as
select s.nombre as socio,s.documento as docsocio,s.domicilio as domsocio,c.deporte,dia,
p.nombre as profesor, matricula
from socios as s
full join inscriptos as i
on s.documento=i.documentosocio
full join cursos as c
on i.numero=c.numero
full join profesores as p
on c.documentoprofesor=p.documento;

select *from vista_club;

select deporte,dia,count(socio) as cantidad
from vista_club
where deporte is not null
group by deporte,dia
order by cantidad;

select deporte,dia from vista_club
where socio is null and deporte is not null;

select socio from vista_club
where deporte is null and socio is not null;

select profesor from vista_club where deporte is null and profesor is not null;

select socio, docsocio from vista_club where deporte is not null and matricula <> 's';

select distinct profesor,dia
from vista_club where profesor is not null;

select distinct profesor,dia
from vista_club where profesor is not null
order by dia;

select socio from vista_club
where deporte='tenis' and dia='lunes';

if object_id('vista_inscriptos') is not null
drop view vista_inscriptos;

create view vista_inscriptos as
select deporte,dia,
(select count(*)
from inscriptos as i
where i.numero=c.numero) as cantidad
from cursos as c;

select *from vista_inscriptos;

if object_id('empleados') is not null
drop table empleados;

create table empleados(
documento char(8) not null,
nombre varchar(30) not null,
sexo char(1),
fechanacimiento datetime,
fechaingreso datetime,
cantidadhijos tinyint,
sueldo decimal(5,2),
primary key(documento)
);

insert into empleados values ('22333111','Juan Perez','m','1970-05-10','1987-04-05',2,550);
insert into empleados values ('25444444','Susana Morales','f','1975-11-06','1990-04-06',0,650);
insert into empleados values ('20111222','Hector Pereyra','m','1965-03-25','1997-04-12',3,510);
insert into empleados values ('30000222','Luis LUque','m','1980-03-29','1999-11-06',1,700);
insert into empleados values ('20555444','Laura Torres','f','1965-12-22','2003-11-06',3,400);
insert into empleados values ('30000234','Alberto Soto','m','1989-10-10','1999-11-06',2,420);
insert into empleados values ('20125478','Ana Gomez','f','1976-09-21','1998-11-06',3,350);
insert into empleados values ('24154269','Ofelia Garcia','f','1974-05-12','1990-11-06',0,390);
insert into empleados values ('30415426','Oscar Torres','m','1978-05-02','1997-11-06',1,400);

select sexo, count(*) as cantidad, obsequio=
case 
when sexo='f' then 'rosas'
else 'corbata'
end
from empleados
where datepart(month,fechanacimiento)=5
group by sexo;

select nombre,datepart(year,fechaingreso) as añoingreso,
datepart(year,getdate())-datepart(year,fechaingreso) as AñosdeServicio, placa=
case (datepart(year,getdate())-datepart(year,fechaingreso)) %10
when 0 then 'Si'  --si la cantidad de años es divisible por 10
else 'No'
end
from empleados
where datepart(month,fechaingreso)=4;

select nombre,sueldo,cantidadhijos,porhijo=
case 
when sueldo<=500 then 200
else 100
end,
salariofamilar=
case
when sueldo<=500 then 200*cantidadhijos
else 100*cantidadhijos
end,
sueldototal=
case
when sueldo<=500 then sueldo+(200*cantidadhijos)
else sueldo+(100*cantidadhijos)
end
from empleados
order by sueldototal;

if object_id('empleados') is not null
drop table empleados;

create table empleados(
documento char(8) not null,
nombre varchar(30) not null,
sexo char(1),
fechanacimiento datetime,
sueldo decimal(5,2),
primary key(documento)
);

insert into empleados values ('22333111','Juan Perez','m','1970-05-10',550);
insert into empleados values ('25444444','Susana Morales','f','1975-11-06',650);
insert into empleados values ('20111222','Hector Pereyra','m','1965-03-25',510);
insert into empleados values ('30000222','Luis LUque','m','1980-03-29',700);
insert into empleados values ('20555444','Laura Torres','f','1965-12-22',400);
insert into empleados values ('30000234','Alberto Soto','m','1989-10-10',420);
insert into empleados values ('20125478','Ana Gomez','f','1976-09-21',350);
insert into empleados values ('24154269','Ofelia Garcia','f','1974-05-12',390);
insert into empleados values ('30415426','Oscar Torres','m','1978-05-02',400);

if exists(select *from empleados
where datepart(month,fechanacimiento)=5)--si hay empleados que cumplan en mayo
(select sexo,count(*) as cantidad 
from empleados
where datepart(month,fechanacimiento)=5
group by sexo)
else select 'no hay empleados que cumplan en mayo';

if object_id('alumnos') is not null
drop table alumnos;

create table alumnos (
documento char(8),
nombre varchar(30),
nota decimal(4,2),
concepto text,
constraint PK_alumnos
primary key(documento)
);

insert into alumnos values ('22222222','Ana Acosta',3,'Participativo. Generoso');
insert into alumnos values ('23333333','Carlos Caseres',7,'Poco participativo');
insert into alumnos values ('24444444','Diego Duarte',8,'Buen compañero');
insert into alumnos values ('25555555','Fabiola Fuentes',2,null);

select *from alumnos;

declare @puntero binary(16)
select @puntero = textptr (concepto)
from alumnos
where documento='23333333'
if (textvalid('alumnos.concepto',@puntero)=1)
updatetext alumnos.concepto @puntero 5 null 'comunicativo'
else
select 'Puntero inválido';

declare @puntero binary(16)
select @puntero = textptr (concepto)
from alumnos
where documento='23333333'
 
readtext alumnos.concepto @puntero 0 0;

declare @puntero binary(16)
select @puntero = textptr (concepto)
from alumnos
where documento='25555555'
if (textvalid('alumnos.concepto',@puntero)=1)
updatetext alumnos.concepto @puntero 0 0 'Muy comunicativo'
else
select 'Puntero inválido';

declare @puntero binary(16)
select @puntero = textptr (concepto)
from alumnos
where documento='24444444'
updatetext alumnos.concepto @puntero 20 0 ' y estudioso';

declare @puntero binary(16)
select @puntero = textptr (concepto)
from alumnos
where documento='24444444'
if (textvalid('alumnos.concepto',@puntero)=1)
updatetext alumnos.concepto @puntero 5 0 'alumno y '
else  select 'Puntero inválido';

declare @puntero binary(16)
select @puntero = textptr (concepto)
from alumnos
where documento='24444444'
 
readtext alumnos.concepto @puntero 0 0;

if object_id('reprobados') is not null
drop table reprobados;

create table reprobados(
documento char(8) not null,
concepto text
);

insert into reprobados values('22222222','');
insert into reprobados values('25555555','');

declare @puntero1 binary(16)
select @puntero1 = textptr(concepto)
from alumnos
where documento='22222222'

declare @puntero2 binary(16)
select @puntero2 = textptr(concepto)
from reprobados
where documento='22222222'

if (textvalid('alumnos.concepto',@puntero1)=1) 
if (textvalid('reprobados.concepto',@puntero2)=1)
updatetext reprobados.concepto @puntero2 0 null alumnos.concepto @puntero1
else select 'Puntero a la tabla reprobados inválido'
else select 'Puntero a la tabla alumnos inválido';

declare @puntero binary(16)
select @puntero = textptr(concepto)
from reprobados
where documento='22222222'
readtext reprobados.concepto @puntero 0 0;

declare @puntero1 binary(16)
select @puntero1 = textptr(concepto)
from alumnos
where documento='25555555'

declare @puntero2 binary(16)
select @puntero2 = textptr(concepto)
from reprobados
where documento='25555555'

if (textvalid('alumnos.concepto',@puntero1)=1) 
if (textvalid('reprobados.concepto',@puntero2)=1)
updatetext reprobados.concepto @puntero2 0 null alumnos.concepto @puntero1
else select 'Puntero de "reprobados" inválido'
else select 'Puntero de "alumnos" inválido';

declare @puntero1 binary(16)
select @puntero1 = textptr(concepto)
from alumnos
where documento='23333333'

declare @puntero2 binary(16)
select @puntero2 = textptr(concepto)
from reprobados
where documento='23333333'

if (textvalid('alumnos.concepto',@puntero1)=1) 
if (textvalid('reprobados.concepto',@puntero2)=1)
updatetext reprobados.concepto @puntero2 0 null
alumnos.concepto @puntero1
else select 'Puntero de "reprobados" inválido'
else select 'Puntero de "alumnos" inválido';

if object_id('empleados') is not null
drop table empleados;

create table empleados(
documento char(8),
nombre varchar(20),
apellido varchar(20),
sueldo decimal(6,2),
cantidadhijos tinyint,
seccion varchar(20),
primary key(documento)
);

insert into empleados values('22222222','Juan','Perez',300,2,'Contaduria');
insert into empleados values('22333333','Luis','Lopez',300,0,'Contaduria');
insert into empleados values ('22444444','Marta','Perez',500,1,'Sistemas');
insert into empleados values('22555555','Susana','Garcia',400,2,'Secretaria');
insert into empleados values('22666666','Jose Maria','Morales',400,3,'Secretaria');

if object_id('pa_empleados_sueldo') is not null
drop procedure pa_empleados_sueldo;

create procedure pa_empleados_sueldo
as
select nombre,apellido,sueldo
from empleados;

exec pa_empleados_sueldo;

if object_id('pa_empleados_hijos') is not null
drop procedure pa_empleados_hijos;

create procedure pa_empleados_hijos
as
select nombre,apellido,cantidadhijos
from empleados
where cantidadhijos>0;

exec pa_empleados_hijos;

update empleados set cantidadhijos=1 where documento='22333333';
exec pa_empleados_hijos;

if (object_id('libros')) is not null
drop table libros;
if (object_id('ventas')) is not null
drop table ventas;

create table libros(
codigo int identity,
titulo varchar(40),
autor varchar(30),
editorial varchar(20),
precio decimal(6,2),
cantidad int,
primary key (codigo)
);

create table ventas(
numero int identity,
codigo int not null,
preciounitario decimal(6,2),
cantidad int, 
constraint PK_ventas primary key (numero),
constraint FK_ventas_codigolibro
foreign key (codigo)
references libros(codigo)
on update cascade
);

insert into libros values('Uno','Richard Bach','Planeta',15,100);
insert into libros values('Ilusiones','Richard Bach','Planeta',18,150);
insert into libros values('El aleph','Borges','Emece',25,200);
insert into libros values('Matematica estas ahi','Paenza','Nuevo siglo',20,300);
insert into libros values('Aprenda PHP','Mario Molina','Nuevo siglo',45,200);
 
insert into ventas values(1,15,1);
insert into ventas values(2,18,1);
insert into ventas values(3,25,100);
insert into ventas values(1,15,50);

if (object_id('pa_ventas')) is not null
drop proc pa_ventas;

create procedure pa_ventas
as
select v.numero,
(l.titulo+'-'+l.autor+'-'+l.editorial) as libro,
v.preciounitario,
v.cantidad,
(v.preciounitario*v.cantidad) as total
from ventas as v
join libros as l
on v.codigo=l.codigo;

exec pa_ventas;

if (object_id('pa_vender')) is not null
drop proc pa_vender;

create procedure pa_vender
@codigo int=null,
@cantidad int=1
as
--verificamos que el código exista
if not exists (select *from libros where codigo=@codigo) or (@codigo is null)
select 'Ingrese un codigo de libro válido'
else
begin --verificamos que haya stock
declare @disponibles int
select @disponibles= cantidad from libros where codigo=@codigo
if (@disponibles<@cantidad)
select 'Solo hay '+cast(@disponibles as varchar(10))+' disponibles'
else
begin
declare @precio decimal(6,2) 
select @precio= precio from libros where codigo=@codigo
insert into ventas values(@codigo,@precio,@cantidad)
update libros set cantidad=cantidad-@cantidad where @codigo=codigo
end
end;

exec pa_vender 1,20;

select *from ventas;
select *from libros;

exec pa_vender 9;

exec pa_vender 5,250;


if object_id('consultas') is not null
drop table consultas;
if object_id('medicos') is not null
drop table medicos;

create table medicos (
documento char(8) not null,
nombre varchar(30),
constraint PK_medicos 
primary key clustered (documento)
);

create table consultas(
fecha datetime,
medico char(8) not null,
paciente varchar(30),
constraint PK_consultas
primary key (fecha,medico),
constraint FK_consultas_medico
foreign key (medico)
references medicos(documento)
on update cascade
on delete cascade
);

insert into medicos values('22222222','Alfredo Acosta');
insert into medicos values('23333333','Pedro Perez');
insert into medicos values('24444444','Marcela Morales');

insert into consultas values('2007/03/26 8:00','22222222','Juan Juarez');
insert into consultas values('2007/03/26 8:00','23333333','Gaston Gomez');
insert into consultas values('2007/03/26 8:30','22222222','Nora Norte');
insert into consultas values('2007/03/28 9:00','22222222','Juan Juarez');
insert into consultas values('2007/03/29 8:00','24444444','Nora Norte');
insert into consultas values('2007/03/24 8:30','22222222','Hector Huerta'); 
insert into consultas values('2007/03/24 9:30','23333333','Hector Huerta');

if object_id('f_nombreDia') is not null
drop function f_nombreDia;

create function f_nombreDia
(@fecha varchar(30))
returns varchar(10)
as
begin
declare @nombre varchar(10)
set @nombre='Fecha inválida'   
if (isdate(@fecha)=1)
begin
set @fecha=cast(@fecha as datetime)
set @nombre=
case datename(weekday,@fecha)
when 'Monday' then 'lunes'
when 'Tuesday' then 'martes'
when 'Wednesday' then 'miércoles'
when 'Thursday' then 'jueves'
when 'Friday' then 'viernes'
when 'Saturday' then 'sábado'
when 'Sunday' then 'domingo'
end--case
end--si es una fecha válida
return @nombre
end;
 
if object_id('f_horario') is not null
drop function f_horario;

create function f_horario
(@fecha varchar(30))
returns varchar(5)
as
begin
declare @nombre varchar(5)
set @nombre='Fecha inválida'   
if (isdate(@fecha)=1)
begin
set @fecha=cast(@fecha as datetime)
set @nombre=rtrim(cast(datepart(hour,@fecha) as char(2)))+':'
set @nombre=@nombre+rtrim(cast(datepart(minute,@fecha) as char(2)))
end--si es una fecha válida
return @nombre
end;

if object_id('f_fecha') is not null
drop function f_fecha;

create function f_fecha
(@fecha varchar(30))
returns varchar(12)
as
begin
declare @nombre varchar(12)
set @nombre='Fecha inválida'   
if (isdate(@fecha)=1)
begin
set @fecha=cast(@fecha as datetime)
set @nombre=rtrim(cast(datepart(day,@fecha) as char(2)))+'/'
set @nombre=@nombre+rtrim(cast(datepart(month,@fecha) as char(2)))+'/'
set @nombre=@nombre+rtrim(cast(datepart(year,@fecha) as char(4)))
end--si es una fecha válida
return @nombre
end;

select dbo.f_nombredia(fecha) as dia,
dbo.f_fecha(fecha) as fecha,
dbo.f_horario(fecha) as horario,
paciente
from consultas as c
join medicos as m
on m.documento=c.medico
where m.nombre='Alfredo Acosta';

select fecha, m.nombre
from consultas as c
join medicos as m
on m.documento=c.medico
where dbo.f_nombredia(fecha)='sábado';

declare @valor char(30)
set @valor='2007/04/09'
select dbo.f_nombreDia(@valor);

if object_id('empleados') is not null
drop table empleados;
create table empleados(
documento char(8) not null,
nombre varchar(30),
fechanacimiento datetime,
fechaingreso datetime,
telefono char(12),
mail varchar(50)
);

insert into empleados values('22222222', 'Ana Acosta', '1970/10/02', '1995/10/10', '4556677', 'anitaacosta@hotmail.com');
insert into empleados values('25555555', 'Bernardo Bustos', '1973/01/15', '1999/02/15', '4789012', null);
insert into empleados values('30000000', 'Carlos Caseros', '1980/5/25', '2001/05/05', null, null);
insert into empleados values('32222222', 'Estela Esper', '1985/02/20', '2006/12/12', null, 'estelaesper@gmail.com');

if object_id('f_edad') is not null
drop function f_edad;

create function f_edad
(@fechaactual datetime,
@fecha datetime='2007/01/01'
)
returns tinyint
as
begin
declare @edad tinyint
set @edad=null
if (@fechaactual>=@fecha)
begin
set @edad=datepart(year,@fechaactual)-datepart(year,@fecha)
if (datepart(month,@fecha)>datepart(month,@fechaactual))
set @edad=@edad-1
else 
if (datepart(month,@fecha)=datepart(month,@fechaactual)) and 
(datepart(day,@fecha)>datepart(day,@fechaactual))
set @edad=@edad-1
end--es mayor la actual
return @edad
end;

select nombre, dbo.f_edad(getdate(),fechanacimiento) as edad
from empleados;

select nombre, dbo.f_edad(fechaingreso,fechanacimiento) as 'edad al ingresar',
dbo.f_edad(getdate(),fechaingreso) as 'años de servicio'
from empleados;

select dbo.f_edad(getdate(),'1971/05/25');

select dbo.f_edad();

select dbo.f_edad(getdate(),default);

if object_id('f_valorNulo') is not null
drop function f_valorNulo;

create function f_valorNulo
(@valor varchar(50))
returns varchar(50)
begin
if @valor is null
set @valor='No tiene'
return @valor
end;

select documento,nombre,fechanacimiento,
dbo.f_valorNulo(telefono) as telefono,
dbo.f_valorNulo(mail) as mail
from empleados;


if object_id('empleados') is not null
drop table empleados;

create table empleados(
documento char(8) not null,
apellido varchar(30) not null,
nombre varchar(30) not null,
domicilio varchar(30),
ciudad varchar(30),
fechanacimiento datetime,
constraint PK_empleados
primary key(documento)
);

insert into empleados values('22222222','Acosta','Ana','Avellaneda 123','Cordoba','1970/10/10');
insert into empleados values('23333333','Bustos','Bernardo','Bulnes 234','Cordoba','1972/05/15');
insert into empleados values('24444444','Caseros','Carlos','Colon 356','Carlos Paz','1980/02/25');
insert into empleados values('25555555','Fuentes','Fabiola','Fragueiro 987','Jesus Maria','1984/06/12');

if object_id('f_empleados') is not null
drop function f_empleados;

create function f_empleados
(@opcion varchar(10)
)
returns @listado table
(documento char(8),
nombre varchar(60),
domicilio varchar(60),
nacimiento varchar(12))
as 
begin
if @opcion not in ('total','parcial')
set @opcion='parcial'
if @opcion='total'
insert @listado 
select documento,
(apellido+' '+nombre),
(domicilio+' ('+ciudad+')'), 
cast(fechanacimiento as varchar(12))
from empleados
else
insert @listado
select documento,apellido,ciudad,cast(datepart(year,fechanacimiento) as char(4))
from empleados
return
end;

select *from dbo.f_empleados('total');

select *from dbo.f_empleados();

select *from dbo.f_empleados('');

select *from dbo.f_empleados('parcial')
where domicilio='Cordoba';
if object_id('empleados') is not null
drop table empleados;
if object_id('secciones') is not null
drop table secciones;

create table secciones(
codigo int identity,
nombre varchar(30),
constraint pk_secciones primary key (codigo)
); 

create table empleados(
documento char(8) not null,
nombre varchar(30),
domicilio varchar(30),
seccion int not null,
constraint pk_empleados primary key (documento),
constraint fk_empleados_seccion foreign key(seccion)
references secciones (codigo)
); 

insert into secciones values('Secretaria');
insert into secciones values('Sistemas');
insert into secciones values('Contaduría');
insert into secciones values('Gerencia');

insert into empleados values('22222222','Alejandro Acosta','Avellaneda 90',1);
insert into empleados values('22333333','Betina Bustos','Bulnes 345',2);
insert into empleados values('23444444','Camila Costa','Colon 234',1);
insert into empleados values('23555555','Daniel Duarte','Duarte Quiros 345',3);
insert into empleados values('23666666','Estela Esperanza','España 211',4);

create trigger dis_empleados_borrar
on empleados
after delete
as 
declare @seccion int
select @seccion=codigo from secciones where nombre='Gerencia'
declare @borrados int
select @borrados= count(*)from deleted
declare @insertados int
select @insertados=count(*)from inserted
if exists (select *from deleted where seccion=@seccion)
begin
insert into empleados select documento,nombre,domicilio,seccion from deleted
where deleted.seccion=@seccion
select @insertados=count(*)from inserted
end;

delete empleados where documento like '23%';

select *from empleados;



 

