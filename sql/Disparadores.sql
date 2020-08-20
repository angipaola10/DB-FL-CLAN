--Automatización de código y fecha en ficha médica. 
CREATE OR REPLACE TRIGGER AD_FICHAMEDICA
BEFORE INSERT ON FichaMedica 
FOR EACH ROW 
DECLARE cod NUMBER;
BEGIN 
    SELECT MAX(codigo)+1 INTO cod  FROM fichaMedica; 
    IF cod = null THEN cod := 0;
    END IF;
    :new.codigo := cod;
    :new.fecha := TO_DATE( SYSDATE , 'YYYY/MM/DD');
END AD_FICHAMEDICA;


--Automatización de código.
CREATE OR REPLACE TRIGGER AD_TESTFISICO
BEFORE INSERT ON TestFisico 
FOR EACH ROW 
DECLARE
    cod NUMBER(5);
BEGIN 
    SELECT MAX(codigo)+1  INTO cod FROM TestFisico; 
    IF cod = null THEN cod := 0;
    END IF;
    :new.codigo := cod;
END AD_TESTFISICO;

--Automatización de código y fecha. 
CREATE OR REPLACE TRIGGER AD_ASISTENCIA
BEFORE INSERT ON Asistencia 
FOR EACH ROW 
DECLARE
    cod NUMBER(5);
BEGIN 
    SELECT MAX(codigo)+1 INTO cod FROM Asistencia;
    IF cod = null THEN cod := 0;
    END IF;
    :new.codigo := cod;
    :new.fecha := TO_DATE(SYSDATE(), 'YYYY/MM/DD');
END AD_ASISTENCIA;

--Automatización de código. 
CREATE OR REPLACE TRIGGER AD_HORARIO
BEFORE INSERT ON Horario 
FOR EACH ROW 
DECLARE
    cod NUMBER(5);
BEGIN 
    SELECT  MAX(codigo)+1 INTO cod FROM Horario; 
    IF cod = null THEN cod := 0;
    END IF;
    :new.codigo := cod;
END AD_HORARIO;

--No se puede actualizar una ficha medica
CREATE OR REPLACE TRIGGER UP_FICHAMEDICA
BEFORE UPDATE ON FichaMedica
FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20001,'No se puede actualizar una ficha médica');
END UP_FICHAMEDICA;

--No se puede actualizar un testFisico
CREATE OR REPLACE TRIGGER UP_TESTFISICO
BEFORE UPDATE ON TestFisico
FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20001,'No se puede actualizar un test físico');
END UP_TESTFISICO;

--No se puede actualizar encargadoA
CREATE OR REPLACE TRIGGER UP_ENCARGADOA
BEFORE UPDATE ON EncargadoA
FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20001,'No es posible actualizar este registro a cerca de manejo de implementos');
END UP_ENCARGADOA;

--No se puede actualizar utilizadoPor
CREATE OR REPLACE TRIGGER UP_UTILIZADOPOR
BEFORE UPDATE ON UtilizadoPor
FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20001,'No es posible actualizar este registro a cerca de manejo de implementos');
END UP_UTILIZADOPOR;

--Un jugador puede tener máximo 3 telefonos
CREATE OR REPLACE TRIGGER AD_TELEFONOSJUGADOR
BEFORE INSERT ON TelefonosJugador
FOR EACH ROW
DECLARE 
    numTelefonos NUMBER(1);
BEGIN
    SELECT COUNT(*) INTO numTelefonos FROM TelefonosJugador WHERE idJugador = :new.idJugador;
    IF numTelefonos > 2
    THEN  RAISE_APPLICATION_ERROR(-20001,'Se pueden registrar máximo 3 telefonos por jugador');
    END IF;
END AD_TELEFONOSJUGADOR;

--Un empleado puede tener máximo 3 telefonos
CREATE OR REPLACE TRIGGER AD_TELEFONOEMPLEADO
BEFORE INSERT ON TelefonosEmpleado
FOR EACH ROW
DECLARE 
    numTelefonos NUMBER(1);
BEGIN
    SELECT COUNT(*) INTO numTelefonos FROM TelefonosEmpleado;
    IF numTelefonos = 3 
    THEN  RAISE_APPLICATION_ERROR(-20001,'Se pueden registrar máximo 3 telefonos por empleado');
    END IF;
END AD_TELEFONOEMPLEADO;    

 --De jugador se puede actualizar el tipo de documento de TI a CC solo si se actualiza la edad a 18 años.
 CREATE OR REPLACE TRIGGER UP_JUGADOR_TID
 BEFORE UPDATE ON Jugador
 FOR EACH ROW 
 BEGIN 
    IF :old.tipoDocumento <> :new.tipoDocumento AND ( :old.edad = :new.edad OR :new.edad <> 18 OR :old.tipoDocumento <> 'TI' OR :new.tipoDocumento <> 'CC')
    THEN RAISE_APPLICATION_ERROR(-20001,'Solo se puede actualizar el tipo de documento de TI a CC y se hace cuando se actualiza la edad a 18 años');
    END IF;
END UP_JUGADOR_TID;

--El documento de un jugador solo se puede actualizar cuando se actualiza la edad a 18 años y el documento a CC
 CREATE OR REPLACE TRIGGER UP_JUGADOR_DOCUMENTO
 BEFORE UPDATE ON Jugador
 FOR EACH ROW 
 BEGIN 
    IF  ((:new.tipoDocumento <> 'CC') OR (:old.tipoDocumento <> 'TI') OR (:new.edad <> 18)) AND :old.noDocumento <> :new.noDocumento
     THEN RAISE_APPLICATION_ERROR(-20001,'No es posible realizar la actualización');
    END IF;
END UP_JUGADOR_DOCUMENTO;

--Solo se puede actualizar la edad del jugador por una mayor 
 CREATE OR REPLACE TRIGGER UP_JUGADOR_EDAD
 BEFORE UPDATE ON Jugador
 FOR EACH ROW 
 BEGIN 
    IF :old.edad <> :new.edad AND :old.edad > :new.edad
    THEN RAISE_APPLICATION_ERROR(-20001,'No esposible actualizar la edad del jugador por una menor');
    END IF;
END UP_JUGADOR_EDAD;

--Del jugador no se puede actualizar ni el nombre ni el genero
 CREATE OR REPLACE TRIGGER UP_JUGADOR_VALIDO
 BEFORE UPDATE ON Jugador
 FOR EACH ROW 
 BEGIN 
    IF :old.nombre <> :new.nombre OR :old.genero > :new.genero
    THEN RAISE_APPLICATION_ERROR(-20001,'No es posible realizar la actualización');
    END IF;
END UP_JUGADOR_VALIDO;

--Solo se puede actualizar la edad del empleado por una mayor 
 CREATE OR REPLACE TRIGGER UP_EMPLEADO_EDAD
 BEFORE UPDATE ON Empleado
 FOR EACH ROW 
 BEGIN 
    IF :old.edad <> :new.edad AND :old.edad > :new.edad
    THEN RAISE_APPLICATION_ERROR(-20001,'No es posible actualizar la edad del jugador por una menor');
    END IF;
END UP_EMPLEADO_EDAD;

--Del empleado solo se puede actualizar edad, dirreccion y correo 
CREATE OR REPLACE TRIGGER UP_EMPLEADO_VALIDO
BEFORE UPDATE ON Empleado
 FOR EACH ROW 
 BEGIN 
    IF :old.nombre <> :new.nombre OR :old.tipoDocumento <> :new.tipoDocumento OR :old.documento = :new.documento OR :old.fechaContratacion <> :new.fechaContratacion OR :old.fechaRetiro <> :new.fechaRetiro
    THEN RAISE_APPLICATION_ERROR(-20001,'No es posible realizar la actualización');
    END IF;
END UP_EMPLEADO_VALIDO;

--No se puede eliminar Asistencia
 CREATE OR REPLACE TRIGGER DEL_ASISTENCIA
BEFORE DELETE ON Asistencia
 FOR EACH ROW 
 BEGIN 
    RAISE_APPLICATION_ERROR(-20001,'No se puede eliminar un registro de asistencia');
END DEL_ASISTENCIA;

--No se puede eliminar EncargadoA
 CREATE OR REPLACE TRIGGER DEL_ENCARGADOA
BEFORE DELETE ON EncargadoA
 FOR EACH ROW 
 BEGIN 
    RAISE_APPLICATION_ERROR(-20001,'No es posible realizar esta acción');
END DEL_ENCARGADOA;

--No se puede eliminar UtilizadoPor
CREATE OR REPLACE TRIGGER DEL_UTILIZADOPOR
BEFORE DELETE ON UtilizadoPor
 FOR EACH ROW 
 BEGIN 
    RAISE_APPLICATION_ERROR(-20001,'No es posible realizar esta acción');
END DEL_UTILIZADOPOR;

--Llave alternativa de la tabla EncargadoA (fecha,hora,implemento,sede,encargado):
CREATE OR REPLACE TRIGGER AD_EncargadoA
BEFORE INSERT ON EncargadoA
FOR EACH ROW
DECLARE 
    identico NUMBER(1);
BEGIN 
    SELECT COUNT(*) INTO identico FROM EncargadoA WHERE :new.hora = hora AND :new.fecha = fecha AND :new.implemento = implemento AND :new.sede = sede AND :new.encargado = encargado;
    IF identico > 0 THEN RAISE_APPLICATION_ERROR(-20001,'Existe un registro con datos reelevantes identicos');
    END IF;
END AD_EncargadoA;
 
--Llave alternativa de la tabla UtilizadoPor (fecha,hora,encargado,implemento,sede):
CREATE OR REPLACE TRIGGER AD_UtilizadoPor
BEFORE INSERT ON UtilizadoPor
FOR EACH ROW
DECLARE 
    identico NUMBER(1);
BEGIN 
    SELECT COUNT(*) INTO identico FROM UtilizadoPor WHERE :new.hora = hora AND :new.fecha = fecha AND :new.implemento = implemento AND :new.sede = sede AND :new.encargado = encargado;
    IF identico > 0 THEN RAISE_APPLICATION_ERROR(-20001,'Existe un registro con datos reelevantes identicos');
    END IF;
END AD_UtilizadoPor;

    
--Si se actualiza el nombre de la sede, se actualiza en implemento y cancha 
CREATE OR REPLACE TRIGGER UP_Sede
AFTER UPDATE ON Sede
FOR EACH ROW
BEGIN
    IF :new.nombre <> :old.nombre THEN UPDATE Implemento SET sede = :new.nombre WHERE sede = :old.nombre; UPDATE Cancha SET sede = :new.nombre WHERE sede = :old.nombre; UPDATE Utilero set sede = :new.nombre WHERE :old.nombre = sede;
    END IF;
END UP_sede;

--No se puede actualizar cancha. 
CREATE OR REPLACE TRIGGER UP_Cancha
BEFORE UPDATE ON Cancha
FOR EACH ROW
BEGIN 
     RAISE_APPLICATION_ERROR(-20001,'No se pueden modificar los datos de una cancha');
END UP_Cancha;