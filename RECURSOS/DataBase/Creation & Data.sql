-- CREACIÓN DE BASE DE DATOS DE ECOLONIA — MySQL
-- OSCAR EDUARDO CISNEROS LARIOS -  MIERCOLES 2 DE OCTUBRE 2013

DROP SCHEMA IF EXISTS eColonia2;
CREATE DATABASE IF NOT EXISTS eColonia2;
USE eColonia2;

DROP TABLE IF EXISTS CatalogoCalle;
CREATE TABLE CatalogoCalle (
	Id INT NOT NULL AUTO_INCREMENT,
	Nombre VARCHAR(20) NOT NULL,
	Colonia INT NOT NULL CHECK (Colonia > 0),
	CONSTRAINT PK_CatalogoCalle PRIMARY KEY (Id)
);

INSERT INTO CatalogoCalle (Nombre, Colonia) VALUES ('Koyotlan', 1);
INSERT INTO CatalogoCalle (Nombre, Colonia) VALUES ('Bahía de Manzanillo', 1);
INSERT INTO CatalogoCalle (Nombre, Colonia) VALUES ('Kopalli', 1);
INSERT INTO CatalogoCalle (Nombre, Colonia) VALUES ('Almolli', 1);
INSERT INTO CatalogoCalle (Nombre, Colonia) VALUES ('Laguna del Jabali', 2);
INSERT INTO CatalogoCalle (Nombre, Colonia) VALUES ('Laguna de la Cosa', 2);
INSERT INTO CatalogoCalle (Nombre, Colonia) VALUES ('Laguna de Rosa', 2);
INSERT INTO CatalogoCalle (Nombre, Colonia) VALUES ('Calle Perdida', 2);

DROP TABLE IF EXISTS Casa;
CREATE TABLE Casa (
	Id INT NOT NULL AUTO_INCREMENT,
	Calle INT NOT NULL CHECK (Calle > 0 ),
	Colonia INT NOT NULL CHECK (Colonia > 0),
	Familia VARCHAR(50) NOT NULL,
	Numero INT NOT NULL,
	Tel_Casa VARCHAR(30) NOT NULL,
	CONSTRAINT PK_Casa PRIMARY KEY (Id)
);

INSERT INTO Casa (Calle, Colonia, Familia, Numero, Tel_Casa) 
VALUES (1,1, 'Cisneros Silva', 230, '3126124');

DROP TABLE IF EXISTS CatalogoOcupaciones;
CREATE TABLE CatalogoOcupaciones (
	Id INT NOT NULL AUTO_INCREMENT,
	Nombre VARCHAR(40) NOT NULL,
	CONSTRAINT PK_CatalogoOcupaciones PRIMARY KEY (Id)
);

INSERT INTO CatalogoOcupaciones (Nombre) VALUES ('Carpintero');
INSERT INTO CatalogoOcupaciones (Nombre) VALUES ('Zapatero');
INSERT INTO CatalogoOcupaciones (Nombre) VALUES ('Maestro');
INSERT INTO CatalogoOcupaciones (Nombre) VALUES ('Pintor');
INSERT INTO CatalogoOcupaciones (Nombre) VALUES ('Herrero');
INSERT INTO CatalogoOcupaciones (Nombre) VALUES ('Ingeniero Civil');
INSERT INTO CatalogoOcupaciones (Nombre) VALUES ('Contador');

DROP TABLE IF EXISTS CatalogoRolesFamiliares;
CREATE TABLE CatalogoRolesFamiliares(
	Id INT NOT NULL AUTO_INCREMENT,
	Rol VARCHAR(50) NOT NULL,
	CONSTRAINT PK_CatalogoRolesFamiliares PRIMARY KEY (Id)
);

INSERT INTO CatalogoRolesFamiliares (Rol) VALUES ('Padre'), ('Madre'), ('Hijo Mayor'), ('Hijo Menor'), ('Hijo'), ('Hijo Único');

DROP TABLE IF EXISTS Colono;
CREATE TABLE Colono (
	Id INT NOT NULL AUTO_INCREMENT,
	Casa INT NOT NULL CHECK (Casa > 0),
	ApellidoPaterno VARCHAR(30) NOT NULL,
	ApellidoMaterno VARCHAR(30) NOT NULL,
	FechaNacimiento DATETIME NOT NULL,
	Estatura REAL NOT NULL,
	Nombre VARCHAR(30) NOT NULL, 
	RolFamiliar INT NOT NULL,
	Ocupacion INT NOT NULL CHECK (Ocupacion > 0), 
	Peso FLOAT NOT NULL DEFAULT '0',
	Email VARCHAR(50) NOT NULL,
	Sexo CHAR(1) NOT NULL CHECK (Sexo IN ('M', 'F')),
	Tel_celular VARCHAR(12) NOT NULL DEFAULT '000-00-00000' CHECK (Telefono LIKE '[0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9][0-9][0-9][0-9]'),
	CONSTRAINT PK_Colono PRIMARY KEY (Id)
);

INSERT INTO Colono (Casa, ApellidoPaterno, ApellidoMaterno, FechaNacimiento, Estatura, Nombre, RolFamiliar, Ocupacion, Peso, Email, Sexo, Tel_celular)
VALUES (1, 'Cisneros', 'Larios', '1993-12-04', 1.92, 'Oscar', 1, 2, 80, 'swanros@gmail.com', 'M', '312-11-41872');
INSERT INTO Colono (Casa, ApellidoPaterno, ApellidoMaterno, FechaNacimiento, Estatura, Nombre, RolFamiliar, Ocupacion, Peso, Email, Sexo, Tel_celular)
VALUES (1, 'Villa', 'Colinas', '1993-09-09', 1.92, 'Marco', 6, 5, 88, 'swanros2@gmail.com', 'M', '312-11-4565');
INSERT INTO Colono (Casa, ApellidoPaterno, ApellidoMaterno, FechaNacimiento, Estatura, Nombre, RolFamiliar, Ocupacion, Peso, Email, Sexo, Tel_celular)
VALUES (1, 'Silvia', 'Michel', '1993-11-23', 1.70, 'Yuridia', 2, 5, 88, 'nanyur1@gmail.com', 'M', '312-11-4565');


DROP TABLE IF EXISTS ComiteDeBarrio;
CREATE TABLE ComiteDeBarrio (
	Id INT NOT NULL AUTO_INCREMENT,
	Colonia INT NOT NULL CHECK (Colonia > 0),
	FechaFundacion DATETIME NOT NULL,
	Nombre VARCHAR(30) NOT NULL,
	Numero_Integrantes INT NOT NULL DEFAULT 0 CHECK (Numero_Integrantes > 0 AND Numero_Integrantes < 20),
	Presidente INT NOT NULL CHECK (Presidente > 0),
	CONSTRAINT PK_ComiteDeBarrio PRIMARY KEY (Id)
);

INSERT INTO ComiteDeBarrio (Colonia, FechaFundacion, Nombre, Numero_Integrantes, Presidente)
VALUES (1, '2010-01-01', 'Leones Unidos', 4, 1);

DROP TABLE IF EXISTS CatalogoDependencias;
CREATE TABLE CatalogoDependencias (
	Id INT NOT NULL AUTO_INCREMENT,
	Nombre VARCHAR(30) NOT NULL,
	CONSTRAINT PK_CatalogoDependencias PRIMARY KEY (Id)
);

INSERT INTO CatalogoDependencias (Nombre) VALUES ('CIAPACOV');
INSERT INTO CatalogoDependencias (Nombre) VALUES ('SAGARPA');
INSERT INTO CatalogoDependencias (Nombre) VALUES ('CONAGUA');
INSERT INTO CatalogoDependencias (Nombre) VALUES ('INFONAVIT');
INSERT INTO CatalogoDependencias (Nombre) VALUES ('CFE');

DROP TABLE IF EXISTS Estado;
CREATE TABLE Estado (
	Id INT NOT NULL AUTO_INCREMENT,
	Nombre VARCHAR(30) NOT NULL DEFAULT 'NombreEstado',
	CONSTRAINT PK_Estado PRIMARY KEY (Id)
);

INSERT INTO Estado VALUES (1, 'Colima');

DROP TABLE IF EXISTS Municipio;
CREATE TABLE Municipio(
	Id INT NOT NULL AUTO_INCREMENT,
	Estado INT NOT NULL CHECK (Estado > 0),
	Nombre VARCHAR(30) NOT NULL,
	CONSTRAINT PK_Municipio PRIMARY KEY (Id)
);

INSERT INTO Municipio (Estado, Nombre) VALUES (1, 'Colima');
INSERT INTO Municipio (Estado, Nombre) VALUES (1, 'Villa de Alvarez');
INSERT INTO Municipio (Estado, Nombre) VALUES (1, 'Manzanillo');
INSERT INTO Municipio (Estado, Nombre) VALUES (1, 'Comala');
INSERT INTO Municipio (Estado, Nombre) VALUES (1, 'Minatitlan');
INSERT INTO Municipio (Estado, Nombre) VALUES (1, 'Coquimatlan');
INSERT INTO Municipio (Estado, Nombre) VALUES (1, 'Armería');
INSERT INTO Municipio (Estado, Nombre) VALUES (1, 'Cuauhtemoc');
INSERT INTO Municipio (Estado, Nombre) VALUES (1, 'Tecoman');
INSERT INTO Municipio (Estado, Nombre) VALUES (1, 'Ixtlahuacan');

DROP TABLE IF EXISTS Colonia;
CREATE TABLE Colonia (
	Id INT NOT NULL AUTO_INCREMENT,
	Municipio INT NOT NULL CHECK (Municipio > 0),
	ComiteDeBarrio INT NOT NULL CHECK (ComiteDeBarrio > 0),
	FechaFun DATETIME NOT NULL,
	NumeroHabitantes INT NOT NULL DEFAULT 0,
	Nombre VARCHAR(30) NOT NULL DEFAULT 'Nombre',
	Ubicacion VARCHAR(100) NOT NULL DEFAULT 'Ubicacion',
	Diagnostico_inicial TEXT NOT NULL,
	Extension_Geografica VARCHAR(20) NOT NULL,
	Croquis TEXT NOT NULL,
	CONSTRAINT PK_Colonia PRIMARY KEY (Id)
);

INSERT INTO Colonia (Municipio, ComiteDeBarrio, FechaFun, NumeroHabitantes, Nombre, Ubicacion, Diagnostico_Inicial, Extension_Geografica, Croquis)
VALUES (1, 1, '1990-01-01', 200, 'Almendros', 'Entre Solidaridad y Villa Izcalli','Diagnostico Inicial 1', '200km', 'http://algo.com/croquis');
INSERT INTO Colonia (Municipio, ComiteDeBarrio, FechaFun, NumeroHabitantes, Nombre, Ubicacion, Diagnostico_Inicial, Extension_Geografica, Croquis)
VALUES (1, 1, '1990-01-01', 500, 'Villa Izcalli', 'Debajo de Almendros','Diagnostico Inicial 1', '600km', 'http://algo.com/croquis');
INSERT INTO Colonia (Municipio, ComiteDeBarrio, FechaFun, NumeroHabitantes, Nombre, Ubicacion, Diagnostico_Inicial, Extension_Geografica, Croquis)
VALUES (1, 1, '1990-01-01', 500, 'Solidaridad', 'Sobre de Almendros','Diagnostico Inicial 3', '500km', 'http://algo.com/croquis');

SELECT * FROM Colonia;

DROP TABLE IF EXISTS Autoridad;
CREATE TABLE Autoridad (
	Id INT NOT NULL AUTO_INCREMENT,
	Nombre VARCHAR(20) NOT NULL,
	ApellidoP VARCHAR(30) NOT NULL,
	ApellidoM VARCHAR(30) NOT NULL,
	Correo VARCHAR(50) NOT NULL,
	CONSTRAINT PK_Autoridad PRIMARY KEY (Id)
);

INSERT INTO Autoridad (Nombre, ApellidoP, ApellidoM, Correo) VALUES ('Oscar', 'Cisneros', 'Larios', 'correo1@algo.com');
INSERT INTO Autoridad (Nombre, ApellidoP, ApellidoM, Correo) VALUES ('Angel', 'Carrillo', 'Villa', 'correo2@algo.com');
INSERT INTO Autoridad (Nombre, ApellidoP, ApellidoM, Correo) VALUES ('Maciel', 'Ventura', 'Silva', 'correo3@algo.com');
INSERT INTO Autoridad (Nombre, ApellidoP, ApellidoM, Correo) VALUES ('Luis', 'López', 'Michel', 'correo1@a4go.com');
INSERT INTO Autoridad (Nombre, ApellidoP, ApellidoM, Correo) VALUES ('Gerardo', 'Pérez', 'Valdez', 'correo5@algo.com');


DROP TABLE IF EXISTS Autoridad_Dependencia;
CREATE TABLE Autoridad_Dependencia (
	Id INT NOT NULL AUTO_INCREMENT,
	Autoridad INT NOT NULL CHECK (Autoridad > 0),
	Dependencia INT NOT NULL CHECK (Dependencia > 0),
	InicioPeriodo DATETIME NOT NULL,
	FinPeriodo DATETIME NOT NULL,
	Municipio INT NOT NULL CHECK (Municipio > 0),
	Puesto VARCHAR(30) NOT NULL,
	CONSTRAINT PK_Autoridad_Dependencia PRIMARY KEY (Id)
);

INSERT INTO Autoridad_Dependencia (Autoridad, Dependencia, InicioPeriodo, FinPeriodo, Municipio, Puesto)
VALUES (1, 1, '2010-12-01', '2013-12-01', 1, 'Director');
INSERT INTO Autoridad_Dependencia (Autoridad, Dependencia, InicioPeriodo, FinPeriodo, Municipio, Puesto)
VALUES (2, 1, '2010-12-01', '2013-12-01', 1, 'Secretario General');
INSERT INTO Autoridad_Dependencia (Autoridad, Dependencia, InicioPeriodo, FinPeriodo, Municipio, Puesto)
VALUES (3, 2, '2010-12-01', '2013-12-01', 1, 'Director');
INSERT INTO Autoridad_Dependencia (Autoridad, Dependencia, InicioPeriodo, FinPeriodo, Municipio, Puesto)
VALUES (5, 5, '2010-12-01', '2013-12-01', 1, 'Tesorero');
INSERT INTO Autoridad_Dependencia (Autoridad, Dependencia, InicioPeriodo, FinPeriodo, Municipio, Puesto)
VALUES (4, 4, '2010-12-01', '2013-12-01', 1, 'Director de Zona');


-- CONSTRAINTS
ALTER TABLE ComiteDeBarrio ADD CONSTRAINT FK_ComiteDeBarrio_Colonia FOREIGN KEY (Colonia) REFERENCES Colonia (Id) ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE CatalogoCalle ADD CONSTRAINT FK_CatalogoCalle_Colonia FOREIGN KEY (Colonia) REFERENCES Colonia (Id) ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE Casa ADD CONSTRAINT FK_Casa_Colonia FOREIGN KEY (Colonia) REFERENCES Colonia (Id) ON DELETE NO ACTION ON UPDATE CASCADE;

ALTER TABLE Autoridad_Dependencia ADD 	CONSTRAINT FK_Autoridad_Dependencia_Autoridad FOREIGN KEY (Autoridad) REFERENCES Autoridad (Id) ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE Autoridad_Dependencia ADD 	CONSTRAINT FK_Autoridad_Dependencia_Dependencia FOREIGN KEY (Dependencia)  REFERENCES CatalogoDependencias (Id) ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE Autoridad_Dependencia ADD 	CONSTRAINT FL_Autoridad_Dependencia_Municipio FOREIGN KEY (Dependencia) REFERENCES Municipio (Id) ON DELETE NO ACTION ON UPDATE CASCADE;

ALTER TABLE Colonia ADD CONSTRAINT FK_Colonia_Municipio FOREIGN KEY (Municipio) REFERENCES Municipio (Id) ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE Colonia ADD CONSTRAINT FK_Colonia_ComiteDeBarrio FOREIGN KEY (ComiteDeBarrio) REFERENCES ComiteDeBarrio (Id) ON DELETE NO ACTION ON UPDATE CASCADE;

ALTER TABLE Municipio ADD CONSTRAINT FK_Municipio_Estado FOREIGN KEY (Estado) REFERENCES Estado (Id) ON DELETE NO ACTION ON UPDATE CASCADE;

ALTER TABLE Casa ADD CONSTRAINT FK_Casa_Calle FOREIGN KEY (Calle) REFERENCES CatalogoCalle (Id) ON DELETE NO ACTION ON UPDATE CASCADE;

ALTER TABLE Colono ADD CONSTRAINT FK_Colono_Casa FOREIGN KEY (Casa) REFERENCES Casa (Id) ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE Colono ADD CONSTRAINT FK_Colono_Ocupacion FOREIGN KEY (Ocupacion) REFERENCES CatalogoOcupaciones (Id) ON DELETE NO ACTION ON UPDATE CASCADE;

ALTER TABLE ComiteDeBarrio ADD CONSTRAINT FK_ComiteDeBarrio_Presidente FOREIGN KEY (Presidente) REFERENCES Colono (Id) ON DELETE No ACTION ON UPDATE CASCADE;
