CREATE TABLE Equipo (
nombre VARCHAR(40) NOT NULL,
numeroCancha NUMBER(2) NOT NULL,
sedeCancha VARCHAR(40) NOT NULL,
categoria VARCHAR (20) NOT NULL
);

CREATE TABLE Jugador (
tipoDocumento VARCHAR(2) NOT NULL,
noDocumento  NUMBER(11) NOT NULL,
nombre VARCHAR(40) NOT NULL,
edad NUMBER(2) NOT NULL,
correo VARCHAR(50),
direccion VARCHAR(40) NOT NULL,
nombreAcudiente VARCHAR(40) NOT NULL,
telefonoAcudiente NUMBER(10) NOT NULL,
equipo VARCHAR(40) NOT NULL,
posicion VARCHAR(2),
genero VARCHAR(1) NOT NULL
);

CREATE TABLE FichaMedica (
codigo NUMBER(5),
fecha DATE,
tipoDeConsulta VARCHAR(30) NOT NULL,
descripcion VARCHAR(500) NOT NULL,
realizadaPor NUMBER(11) NOT NULL,
correspondeA NUMBER(11) NOT NULL
);

CREATE TABLE TestFisico (
codigo NUMBER(5) NOT NULL,
peso NUMBER(4, 2) NOT NULL,
estatura NUMBER(3, 2) NOT NULL,
imc NUMBER(4, 2) NOT NULL,
recomendaciones VARCHAR(500) NOT NULL,
correspondeA NUMBER(11) NOT NULL,
preparador NUMBER(11),
entrenador NUMBER(11)
);

CREATE TABLE TelefonosJugador (
idJugador NUMBER(11) NOT NULL,
numTelefono NUMBER(10) NOT NULL
);

CREATE TABLE Horario (
codigo NUMBER(5) NOT NULL,
fecha DATE NOT NULL,
hora TIMESTAMP NOT NULL,
numeroCancha NUMBER(2) NOT NULL,
sedeCancha VARCHAR(40) NOT NULL
);

CREATE TABLE Asistencia (
codigo NUMBER(5) NOT NULL,
fecha DATE NOT NULL,
totalPracticas NUMBER(3) NOT NULL,
asistencias NUMBER(3) NOT NULL,
horario NUMBER(5) NOT NULL,
entrenador NUMBER(11) NOT NULL,
jugador NUMBER(11) NOT NULL
);

CREATE TABLE Implemento (
sede VARCHAR (40) NOT NULL,
nombre VARCHAR(20) NOT NULL,
cantidad NUMBER(3) NOT NULL,
descripcion VARCHAR(200)
);

CREATE TABLE Empleado (
tipoDocumento VARCHAR(2) NOT NULL,
documento NUMBER(11) NOT NULL,
nombre VARCHAR(40),
edad NUMBER(2) NOT NULL,
direccion VARCHAR(40) NOT NULL,
correo VARCHAR(50) NOT NULL,
fechaContratacion DATE NOT NULL, 
fechaRetiro DATE
);

CREATE TABLE Sede (
nombre VARCHAR(40) NOT NULL,
direccion VARCHAR(40) NOT NULL
);

CREATE TABLE Cancha (
numero NUMBER(2) NOT NULL,
sede VARCHAR(40) NOT NULL
);

CREATE TABLE TelefonosEmpleado (
idEmpleado NUMBER(11) NOT NULL,
numTelefono NUMBER(10) NOT NULL
);

CREATE TABLE UtilizadoPor (
codigo NUMBER(11) NOT NULL,
fecha DATE NOT NULL,
hora TIMESTAMP NOT NULL,
encargado NUMBER(11) NOT NULL,
implemento VARCHAR(20) NOT NULL,
sede VARCHAR(40) NOT NULL, 
estadoInicial VARCHAR(10) NOT NULL, 
estadoFinal VARCHAR(10) NOT NULL
);

CREATE TABLE EncargadoA (
codigo NUMBER(5) NOT NULL,
fecha DATE NOT NULL,
hora TIMESTAMP NOT NULL,
implemento VARCHAR(30) NOT NULL, 
sede VARCHAR(40) NOT NULL, 
encargado NUMBER(11) NOT NULL, 
cantidadInicial NUMBER(2) NOT NULL, 
cantidadFinal NUMBER(2) NOT NULL, 
nota VARCHAR(500)
);

CREATE TABLE Medico (
documento NUMBER(11) NOT NULL,
especialidad VARCHAR(30) NOT NULL
);

CREATE TABLE Utilero (
sede VARCHAR(30) NOT NULL,
documento NUMBER(11) NOT NULL
);

CREATE TABLE PreparadorFisico (
documento NUMBER(11) NOT NULL,
tipo VARCHAR(30) NOT NULL
);

CREATE TABLE Entrenador (documento NUMBER(11) NOT NULL, 
tecnico VARCHAR(2) NOT NULL, 
especialidad VARCHAR(2) NOT NULL
);

CREATE TABLE Entrena (
entrenador NUMBER(11) NOT NULL, 
equipo VARCHAR(40) NOT NULL
);