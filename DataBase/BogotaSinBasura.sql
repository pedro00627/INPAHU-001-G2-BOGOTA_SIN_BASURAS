create table Localidad(
	Id_localidad int not null identity (1,1) primary key,
	Localidad char(30) not null
);

create table Barrio(
	Id_barrio int not null identity (1,1) primary key,
	Nombre_barrio varchar(80) not null,
	Id_localidad int not null,
	constraint Fk_Localidad_Barrio foreign key (Id_localidad) references dbo.Localidad (Id_localidad)
);

create table Empresa(
	Id_empresa int not null identity (1,1) primary key,
	Nit_empresa varchar (13) null,
	RazonSocial varchar (150)  not null,
	Id_tipoempresa int not null,
	Direccion varchar (100) not null,
	Telefono varchar (13) not null,
	Correo varchar (40) not null,
	constraint Fk_Empresa_TipoEmpresa foreign key (Id_tipoempresa) references dbo.Tipo_Empresa  (Id_tipoempresa)
);

create table Tipo_Empresa(
	Id_tipoempresa int not null identity (1,1) primary key,
	Nombre_empresa char(30)  not null
);

create table Normatividad(
	Id_norma int not null identity (1,1) primary key,
	Nombre_norma text  not null,
	Descripcion_norma text null,
	Contenido_norma text not null
);

create table Publicacion(
	Id_publicacion int not null identity (1,1) primary key,
	Nombre_publicacion text  not null,
	Descripcion_publicacion text null,
	Contenido_publicacion text not null
);

create table Redes_Sociales(
	Id_redSocial int not null identity (1,1) primary key,
	Nombre_redSocial char(60)  not null,
	token_redSocial  varbinary (max)  null
);


create table Hora(
	Id_hora int not null identity (1,1) primary key,
	Hora time not null
);

create table Dia_Semana(
	Id_dia int not null identity (1,1) primary key,
	Dias_semana time not null
);

create table Tipo_servicio(
	Id_tipoServicio int not null identity (1,1) primary key,
	Nombre_servicio varchar (100) not null,
	Descripcion_servicio text not null
);

create table Tipo_documento(
	Id_tipoDocumento int not null identity (1,1) primary key,
	documento varchar (80) not null
);

create table Usuario(
	Id_usuario int not null identity (1,1) primary key,
	Id_tipoDocumento int not null,
	Numero_documento varchar (20) not null,
	Nombres varchar (60) not null,
	Apellidos varchar (60) not null,
	Nick_name varchar (20) not null,
	Contrasena varbinary (max) not null,
	Telefono varchar (10) not null,
	Direccion varchar (40) not null,
	email varchar (50) not null,
	Id_barrio int not null,
	Id_redSocial int not null,
	constraint Fk_Usuario_Tipo_documento foreign key (Id_tipoDocumento) references dbo.Tipo_documento (Id_tipoDocumento),
	constraint Fk_Usuario_Barrio foreign key (Id_barrio) references dbo.Barrio (Id_barrio),
	constraint Fk_Usuario_RedSocial foreign key (Id_redSocial) references dbo.Redes_Sociales (Id_redSocial)
);

create table Lineas_Atencion (
	Id_lineaAtencion int not null identity (1,1) primary key,
	email varchar (50) not null,
	pass varchar not null,
	Telefono varchar (10) not null,
	Id_empresa int not null,
	Id_tipoServicio int not null,
	constraint Fk_LineasAtencion_Empresa foreign key (Id_empresa) references dbo.Empresa (Id_empresa),
	constraint Fk_LineasAtencion_TipoServicio foreign key (Id_tipoServicio) references dbo.Tipo_servicio (Id_tipoServicio)
);

create table Ruta_Recoleccion (
	Id_recoleccion int not null identity (1,1) primary key,
	Id_hora int not null,
	Id_barrio int not null,
	Id_dia int not null,
	Id_empresa int not null,
	constraint Fk_RutaRecoleccio_Hora foreign key (Id_hora) references dbo.Hora (Id_hora),
	constraint Fk_RutaRecoleccio_Barrio foreign key (Id_barrio) references dbo.Barrio (Id_barrio),
	constraint Fk_RutaRecoleccion_DiaSemana foreign key (Id_dia ) references dbo.Dia_Semana (Id_dia ),
	constraint Fk_RutaRecoleccion_Empresa foreign key (Id_empresa) references dbo.Empresa (Id_empresa)
);