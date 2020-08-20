ALTER TABLE Jugador ADD CONSTRAINT UK_Jugador_correo UNIQUE (correo);
ALTER TABLE Sede ADD CONSTRAINT UK_Sede_direccion UNIQUE (direccion);
ALTER TABLE Empleado ADD CONSTRAINT UK_Empleado_correo UNIQUE (correo);