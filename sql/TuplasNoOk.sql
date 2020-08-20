--CK_Empleado_fechas
--No debería dejar insertar un empleado con fecha de retiro mayor a fecha de contratación.
INSERT INTO Empleado Values ('CC', 1007771860, 'ANGI JIMENEZ', 19, 'Cra 87a No. 128b - 26', 'angijimenez@hotmail.com', TO_DATE('2019/10/30','YYYY/MM/DD'), TO_DATE('2019/9/30','YYYY/MM/DD'));

--CK_TestFisico_realizadoPor
--No debería dejar registrar un test fisico dos campos llenos (entrenador y preparador fisico) o los dos vacíos. 
--INSERT INTO TestFisico VALUES (9, 32.16, 1.45, 11.06, 'recomendacion9', 45678765432, 3206782626, 3103165164);
--INSERT INTO TestFisico VALUES (10, 55.21, 1.59, 12.54, 'recomendacion10', 90543234567, null, null);

--CK_Jugador_correo2
--No  debería dejar registrar un jugador mayor a 11 años sin correo
INSERT INTO Jugador VALUES ('TI', 37953469161, 'Luis Caro', 17, null, '246 Arrowood Plaza', 'Julienne caro', '5976345366', 'FL CLAN Infantil Norte', 'AT', 'M');