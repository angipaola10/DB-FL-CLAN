ALTER TABLE Empleado ADD CONSTRAINT CK_Empleado_fechas CHECK ((fechaContratacion< fechaRetiro) OR (fechaRetiro IS NULL));
ALTER TABLE TestFisico ADD CONSTRAINT CK_TestFisico_realizadoPor CHECK ((preparador IS NULL AND entrenador IS NOT NULL) OR (entrenador IS NULL AND preparador IS NOT NULL));
ALTER TABLE Jugador ADD CONSTRAINT CK_Jugador_correo2 CHECK ((edad > 10 AND correo IS NOT NULL) OR (edad < 11));
