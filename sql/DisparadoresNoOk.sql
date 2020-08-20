--UP_FICHAMEDICA
--No deber�a dejar actualizar una ficha medica
UPDATE FichaMedica SET descripcion = null WHERE codigo = 1;

--UP_TESTFISICO
--No deber�a dejar actualizar un test fisico
UPDATE TestFisico SET imc = null WHERE codigo = 1;

--UP_ENCARGADOA
--No deberia dejar actualizar encargadoA
UPDATE EncargadoA SET cantidadInicial = 0 WHERE cantidadInicial > 1;

--UP_UTILIZADOPOR
--No deberia dejar actualizar utilizadopor
UPDATE UtilizadoPor SET estadoFinal = 'Excelente' WHERE implemento = 'Bal�n';

--AD_TELEFONOSJUGADOR
INSERT INTO TelefonosJugador VALUES (50086783529, 5432345);

--UP_JUGADOR_TID
--No deber�a dejar actualizar el tipo de documento de TI a CE
UPDATE Jugador SET tipoDocumento = 'CE', edad = 18 WHERE noDocumento = 90543234567;
--No deber�a dejar actualizar el tipo de documento a CC si no se actualiza la edad a 18
UPDATE Jugador SET tipoDocumento = 'CC', edad = 17 WHERE noDocumento = 45678765432;

--UP_JUGADOR_DOCUMENTO : CASCADE NO DEFINIDA
--No debr�a dejar actualizar el documento si no se actualiza la edad a 18 a�os y el documento a CC
--INSERT INTO Jugador VALUES ('TI', 4567654323, 'Luis Perez', 15, 'luchitoperez2@theglobeandmail.com', '246 Arrowood Plaza', 'Julienne Perez', '5976345366', 'FL CLAN Infantil Norte', 'AT', 'M');
--UPDATE Jugador SET tipoDocumento = 'CC', edad = 17, noDocumento = 23456432 WHERE noDocumento = 4567654323;

--UP_JUIGADOR_EDAD
UPDATE Jugador SET edad = 18 WHERE noDocumento = 43452324543;

--UP_EMPLEADO_VALIDO 
UPDATE Empleado SET fechaRetiro = NULL WHERE documento = 9400084145;

--DEL_ASISTENCIA
--No deber�a dejar eliminar los registros de Asistencia
DELETE FROM Asistencia;

--DEL_ENCARGADOA
--No deber�a dejer eleminar los registros de EncargadoA
DELETE FROM EncargadoA;

--DEL_UTILIZADO_POR
--No deber�a dejar eliminar los registros de utilizadoPor
DELETE FROM UtilizadoPor