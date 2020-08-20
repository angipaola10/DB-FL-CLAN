ALTER TABLE Jugador ADD CONSTRAINT CK_Jugador_tipoDocumento CHECK (tipoDocumento IN ('CC', 'CE', 'TI'));
ALTER TABLE Jugador ADD CONSTRAINT CK_Jugador_edad CHECK (edad >= 5);
ALTER TABLE Jugador ADD CONSTRAINT CK_Jugador_correo CHECK (correo LIKE ('%@%.%'));
ALTER TABLE Jugador ADD CONSTRAINT CK_Jugador_posicion CHECK (posicion IN ('GK', 'DF', 'MD', 'AT'));
ALTER TABLE Jugador ADD CONSTRAINT CK_Jugador_genero CHECK (genero IN ('F', 'M'));
ALTER TABLE Equipo ADD CONSTRAINT CK_Equipo_categoria CHECK (categoria IN ('Pre Benjamín', 'Benjamín', 'Alevín', 'Infantil', 'Cadetes', 'Juvenil', 'Infantil femenina', 'Juvenil femenina'));
ALTER TABLE TestFisico ADD CONSTRAINT CK_TestFisico_peso CHECK (peso > 0);
ALTER TABLE TestFisico ADD CONSTRAINT CK_TestFisico_estatura CHECK (estatura > 0);
ALTER TABLE TestFisico ADD CONSTRAINT CK_TestFisico_imc CHECK (imc > 0);
ALTER TABLE Implemento ADD CONSTRAINT CK_Implemento_cantidad CHECK (cantidad >= 0);
ALTER TABLE Empleado ADD CONSTRAINT CK_Empleado_tipoDocumento CHECK (tipoDocumento IN ('CC', 'CE', 'TI'));
ALTER TABLE Empleado ADD CONSTRAINT CK_Empleado_edad CHECK (edad >= 18);
ALTER TABLE Empleado ADD CONSTRAINT CK_Empleado_correo CHECK (correo LIKE ('%@%.%'));
ALTER TABLE Cancha ADD CONSTRAINT CK_Empleado_numero CHECK (numero > 0);
ALTER TABLE UtilizadoPor ADD CONSTRAINT CK_UtilizadoPor_estadoInicial CHECK (estadoInicial IN ('Excelente', 'Bueno', 'Regular', 'Malo'));
ALTER TABLE UtilizadoPor ADD CONSTRAINT CK_UtilizadoPor_estadoFinal CHECK (estadoFinal IN ('Excelente', 'Bueno', 'Regular', 'Malo'));
ALTER TABLE EncargadoA ADD CONSTRAINT CK_EncargadoA_cantidadIncial CHECK (cantidadInicial >= 0);
ALTER TABLE EncargadoA ADD CONSTRAINT CK_EncargadoA_cantidadFinal CHECK (cantidadFinal >= 0);
ALTER TABLE Entrenador ADD CONSTRAINT CK_Entrenador_especialidad CHECK (especialidad IN ('GK', 'DF', 'MD', 'AT'));
ALTER TABLE Entrenador ADD CONSTRAINT CK_Entrenador_tecnico CHECK (tecnico IN ('SI', 'NO'));
ALTER TABLE FichaMedica ADD CONSTRAINT CK_FichaMedica_tipoDeConsulta CHECK (tipoDeConsulta IN ('Nutrición','Psicología', 'Kinesiología', 'Fisiología', 'Rehabilitación', 'Cardiología', 'General'));