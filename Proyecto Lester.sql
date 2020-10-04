create database Proyecto Lester

create table Persona
	(
	Id_Persona numeric (18,0) not null PRIMARY KEY,
	Nombre nvarchar (50) not null, 
	Apellido nvarchar (50) not null, 
	DPI nvarchar (50) not null, 
	Fecha_nacimiento nvarchar (50) not null, 
	Tipo nvarchar (25) not null, 
	)

create table Visita
(
	Id_Visita numeric (18,0) not null PRIMARY KEY, 
	Fecha_visita_ingreso nvarchar (50) not null, 
	fecha_ingreso nvarchar (25) not null, 
	Hora_ingreso nvarchar (25) not null, 
	Hora_egreso nvarchar (25) not null, 
	Id_Persona numeric (18,0) not null CONSTRAINT FK_Id_Persona2 FOREIGN KEY (Id_Persona) REFERENCES Persona (Id_Persona),
)


create table Cat_Vecino
(
	Id_Vecino numeric (18,0) not null PRIMARY KEY, 
	Lote nvarchar (25) not null, 
	Seccion nvarchar (25) not null, 
	No_Casa numeric (18) not null, 
	Id_Persona numeric (18,0) not null CONSTRAINT FK_Id_Persona3 FOREIGN KEY (Id_Persona) REFERENCES Persona (Id_Persona),  
)

create table Aut_visita
(
	Id_autorizacion numeric (18,0) not null PRIMARY KEY, 
	Id_Vecino numeric (18,0) not null CONSTRAINT FK_Id_Vecino2 FOREIGN KEY (Id_Vecino) REFERENCES Cat_Vecino (Id_Vecino), 
	Motivo_visita nvarchar (50) not null, 
)

create table Blacklist
(
	Id_bloqueo numeric (18,0) not null PRIMARY KEY, 
	Id_Persona numeric (18,0) not null CONSTRAINT FK_Id_Persona4 FOREIGN KEY (Id_Persona) REFERENCES Persona (Id_Persona), 
	Motivo nvarchar (50), 
)

create table Usuario 
(
	Id_Usuario numeric (18,0) not null PRIMARY KEY, 
	Contraseña nvarchar (50) not null, 
	Id_Rol numeric (18,0) not null,
	Id_Persona numeric (18,0) not null CONSTRAINT FK_Id_Persona5 FOREIGN KEY (Id_Persona) REFERENCES Persona (Id_Persona), 
)


create table Token
(
	Id_Token numeric (18,0) not null PRIMARY KEY, 
	Fecha_Token nvarchar (25) not null, 
	Hora_Token nvarchar (10) not null,
	Id_Visita numeric (18,0) not null CONSTRAINT FK_Id_Visita2 FOREIGN KEY (Id_Visita) REFERENCES Visita (Id_Visita),
	Id_Usuario numeric (18,0) not null CONSTRAINT FK_Id_Usuario2 FOREIGN KEY (Id_Usuario) REFERENCES Usuario (Id_Usuario),
)

create table Reporte_Diario 
(
	Id_Reporte numeric (18,0) not null PRIMARY KEY, 
	Fecha_Registro nvarchar (25) not null, 
	Visitas_Autorizadas numeric (10) not null, 
	Visitas_Rechazadas numeric (10) not null, 
	Id_Token numeric (18,0) not null CONSTRAINT FK_Id_Token2 FOREIGN KEY (Id_Token) REFERENCES Token (Id_Token), 
)

create table Rol
(
	Id_Rol numeric (18,0) not null PRIMARY KEY, 
	Nombre_Rol nvarchar (50) not null,
	Superusser_Usser nvarchar (50) not null, 
)

ALTER TABLE Usuario ADD Id_Rol numeric (18,0) not null CONSTRAINT FK_Id_Rol2 FOREIGN KEY (Id_Rol) REFERENCES Rol(Id_Rol) 
ALTER TABLE Visita DROP COLUMN fecha_ingreso
ALTER TABLE Visita ADD Fecha_Egreso nvarchar (25) not null