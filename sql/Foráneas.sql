ALTER TABLE Equipo ADD CONSTRAINT FK_Equipo_CanchaNum FOREIGN KEY (numeroCancha , sedeCancha) REFERENCES Cancha (numero , sede);
ALTER TABLE Horario ADD CONSTRAINT FK_Horario_Canchanum FOREIGN KEY (numeroCancha, sedeCancha) REFERENCES Cancha (numero, sede);
ALTER TABLE Asistencia ADD CONSTRAINT FK_Asistencia_Horario FOREIGN KEY (horario) REFERENCES Horario (codigo);
ALTER TABLE Asistencia ADD CONSTRAINT FK_Asistencia_Entrenador FOREIGN KEY (entrenador) REFERENCES Entrenador (documento);
ALTER TABLE Asistencia ADD CONSTRAINT FK_Asistencia_Jugador FOREIGN KEY (jugador) REFERENCES Jugador (noDocumento);
ALTER TABLE EncargadoA ADD CONSTRAINT FK_EncargadoA_Implemento FOREIGN KEY (implemento, sede) REFERENCES Implemento (nombre, sede);
ALTER TABLE EncargadoA ADD CONSTRAINT FK_EncargadoA_Utilero FOREIGN KEY (encargado) REFERENCES Utilero (documento);
ALTER TABLE FichaMedica ADD CONSTRAINT FK_FichaMedica_Medico FOREIGN KEY (realizadaPor) REFERENCES Medico (documento);
ALTER TABLE FichaMedica ADD CONSTRAINT FK_FichaMedica_Jugador FOREIGN KEY (correspondeA) REFERENCES Jugador (NoDocumento);
ALTER TABLE Jugador ADD CONSTRAINT FK_Jugador_Equipo FOREIGN KEY (equipo) REFERENCES Equipo (nombre);
ALTER TABLE Medico ADD CONSTRAINT FK_Medico_Empleado FOREIGN KEY (documento) REFERENCES Empleado (documento);
ALTER TABLE preparadorFisico ADD CONSTRAINT FK_PreparadorFisico_Empleado FOREIGN KEY (documento) REFERENCES Empleado (documento);
ALTER TABLE Utilero ADD CONSTRAINT FK_Utilero_Empleado FOREIGN KEY (documento) REFERENCES Empleado (documento);
ALTER TABLE Utilero ADD CONSTRAINT FK_Utilero_Sede FOREIGN KEY (sede) REFERENCES Sede (nombre);
ALTER TABLE Entrenador ADD CONSTRAINT FK_Entrenador_Empleado FOREIGN KEY (documento) REFERENCES Empleado (documento);
ALTER TABLE UtilizadoPor ADD CONSTRAINT FK_UtilizadoPor_Entrenador FOREIGN KEY (encargado) REFERENCES Entrenador (documento);
ALTER TABLE UtilizadoPor ADD CONSTRAINT FK_UtilizadoPor_Implemento FOREIGN KEY (implemento, sede) REFERENCES Implemento (nombre, sede);
ALTER TABLE TelefonosEmpleado ADD CONSTRAINT FK_TelefonosEmpleado_Empleado FOREIGN KEY (idEmpleado) REFERENCES Empleado (documento);
ALTER TABLE TestFisico ADD CONSTRAINT FK_TestFisico_Jugador FOREIGN KEY (correspondeA) REFERENCES Jugador (noDocumento);
ALTER TABLE TestFisico ADD CONSTRAINT FK_TestFisico_PreparadorFisico FOREIGN KEY (preparador) REFERENCES PreparadorFisico (documento);
ALTER TABLE TestFisico ADD CONSTRAINT FK_TestFisico_Entrenador FOREIGN KEY (entrenador) REFERENCES Entrenador (documento);
ALTER TABLE TelefonosJugador ADD CONSTRAINT FK_TelefonosJugador_Jugador FOREIGN KEY (idJugador) REFERENCES Jugador (noDocumento);
ALTER TABLE Cancha ADD CONSTRAINT FK_Cancha_Sede FOREIGN KEY (sede) REFERENCES Sede(nombre);
ALTER TABLE Implemento ADD CONSTRAINT FK_Implemento_Sede FOREIGN KEY (sede) REFERENCES Sede (nombre);
ALTER TABLE Entrena ADD CONSTRAINT FK_Entrena_Equipo FOREIGN KEY (equipo) REFERENCES Equipo(nombre);
ALTER TABLE Entrena ADD CONSTRAINT FK_Entrena_Entrenador FOREIGN KEY (entrenador) REFERENCES Entrenador(documento);





