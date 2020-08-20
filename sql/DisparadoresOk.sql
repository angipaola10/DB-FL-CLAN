--AD_FICHAMEDICA
INSERT INTO FichaMedica VALUES (null, null, 'General', 'descripcion10', 5888035942, 90543234567);

--AD_TESTFISICO
--INSERT INTO TestFisico VALUES (null, 65.4, 1.8, 12.0, 'recomendacion1', 50086783529, null, 6248448652);

--AD_ASISTENCIA
INSERT INTO Asistencia VALUES (null,  TO_DATE('2019/10/30','YYYY/MM/DD'), 20, 19, 2, 1529214111);

--AD_HORARIO
INSERT INTO Horario VALUES (null, TO_DATE('2019/02/11','YYYY/MM/DD'),TO_TIMESTAMP('2014-07-02 15:00:00.742000000', 'YYYY-MM-DD HH24:MI:SS.FF'), 1, 'Sede Sur');

--UP_FICHAMEDICA
--No se puede actualizar

--UP_TESTFISICO
--No se puede actualizar 

--UP_ENCARGADOA
--No se puede acualizar

--UP_UTILIZADOPOR
--No se puede actualizar

--AD_TELEFONOSJUGADOR
INSERT INTO TelefonosJugador VALUES(50086783529, 3152069865);
INSERT INTO TelefonosJugador VALUES(50086783529, 3213175698);

--AD_TELEFONOEMPLEADO
INSERT INTO TelefonosJugador VALUES(9400084145, 3152067665);
INSERT INTO TelefonosJugador VALUES(9400084145, 3042069869);

--UP_JUGADOR_TID
INSERT INTO Jugador VALUES ('TI', 102937284, 'Marcos Vega', 17, 'marcosvega23@hotmail.com', '47 Heath Road', 'Alfonso Vega', '578845456', 'FL CLAN Juvenil Sur', 'MD', 'M');
UPDATE Jugador SET tipoDocumento = 'CC', edad = 18 WHERE noDocumento = 102937284;

--UP_JUGADOR_DOCUMENTO
INSERT INTO Jugador VALUES ('TI', 52987680, 'Marcos Vega', 17, 'marcosvega24@hotmail.com', '47 Heath Road', 'Alfonso Vega', '578845456', 'FL CLAN Juvenil Sur', 'MD', 'M');
UPDATE Jugador SET tipoDocumento = 'CC', edad = 18, noDocumento = 10234534 WHERE noDocumento = 52987680;

--UP_JUGADOR_EDAD
UPDATE Jugador SET edad = 19 WHERE noDocumento = 52987680;

--UP_JUGADOR_VALIDO
UPDATE Jugador SET correo = 'otrocorreo@h.com' WHERE noDocumento = 52987680;

--DEL_ASISTENCIA
--No se puede eliminar registros en asistencia

--DEL_ENCARGADOA
--No se´puede eliminar registros en encargadoa

--DEL_UTILIZADOPOR
--No se puede eliminar registros en utilizadopor
