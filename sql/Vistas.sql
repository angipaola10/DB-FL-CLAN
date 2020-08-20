CREATE VIEW VHorarioEquipo AS 
(SELECT fecha, hora, nombre AS equipo, numero AS cancha 
FROM Equipo, Cancha, Horario 
WHERE Cancha.sede = Equipo.sedeCancha AND Equipo.numeroCancha = Cancha.numero AND Cancha.sede = Horario.sedeCancha AND Horario.numeroCancha = Cancha.numero
);

CREATE VIEW VEntrena AS
(SELECT Equipo.nombre AS equipo, Empleado.nombre AS entrenador, Empleado.documento AS documentoEntrenador 
FROM Equipo, Entrena, Empleado
WHERE Equipo.nombre = Entrena.equipo AND Entrena.entrenador = Empleado.documento
);

CREATE VIEW VJugador AS
(SELECT nombre, noDocumento, numTelefono AS telefono
FROM Jugador, TelefonosJugador
WHERE Jugador.noDocumento = TelefonosJugador.IdJugador
);

CREATE VIEW VEmpleado AS 
(SELECT nombre, documento, numTelefono AS telefono
FROM Empleado, TelefonosEmpleado
WHERE Empleado.documento = TelefonosEmpleado.numTelefono
);

CREATE VIEW VJugadoresEquipo AS 
(SELECT Equipo.nombre AS equipo, Jugador.nombre AS jugador, Jugador.noDocumento AS documento
FROM Jugador, Equipo
WHERE Jugador.equipo = Equipo.nombre
);
