--consultar el equipo de la sede norte en el que mas jugadores han asistido al kinesiologo. 

SELECT nombre, MAX( SELECT COUNT(*) FROM Jugador INNER JOIN FichaMedica ON (correspondeA = noDocumento) WHERE equipo = Equipo.nombre AND tipoDeConsulta = 'Kinesiología') as x FROM Equipo GROUP BY (x);

