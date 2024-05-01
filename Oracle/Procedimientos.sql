SET SERVEROUTPUT ON;



-------------------------------
   --INSERTAR PACIENTES--    
-------------------------------
-- Crear el procedimiento para insertar pacientes
CREATE OR REPLACE PROCEDURE Insertar_Paciente(
    nombre IN VARCHAR2,
    apellidos IN VARCHAR2,
    telefono IN NUMBER,
    fecha_nacimiento IN DATE,
    ciudad IN VARCHAR2,
    calle IN VARCHAR2,
    email IN VARCHAR2,
    pin IN NUMBER
)
IS
    v_direccion Tipo_Direccion := Tipo_Direccion(ciudad, calle);
BEGIN
    -- Insertar datos en la tabla Paciente
    INSERT INTO Tabla_Paciente(Nombre, Apellidos, Telefono, Fecha_nacimiento, Direccion, Email, PIN)
    VALUES (nombre, apellidos, telefono, fecha_nacimiento, v_direccion, email, pin);
    
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Paciente insertado correctamente');
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN -- Capturar la excepci贸n de clave duplicada (violaci贸n de restricci贸n 煤nica)
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error al insertar el paciente: El correo electr贸nico ya existe');
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error al insertar el paciente: ' || SQLERRM);
END;
/


----------------------------
   --INSERTAR MEDICOS--    
----------------------------
--Procedimiento para insertar datos en Tabla_Medico-
create or replace PROCEDURE Insertar_Medico(
    nombre_hospital IN VARCHAR2,
    nombre_departamento IN VARCHAR2,
    nombre IN VARCHAR2,
    apellidos IN VARCHAR2,
    telefono IN NUMBER,
    fecha_nacimiento IN DATE,
    ciudad IN VARCHAR2,
    calle IN VARCHAR2,
    email IN VARCHAR2,
    pin IN NUMBER
)
IS
    v_direccion Tipo_Direccion := Tipo_Direccion(ciudad, calle);
    v_id_hospital Tabla_Hospital.Id_Hospital%TYPE;
    v_id_departamento Tabla_Departamento.Id_Departamento%TYPE;
BEGIN
    -- Obtener el ID del hospital dado su nombre
    SELECT Id_Hospital INTO v_id_hospital
    FROM Tabla_Hospital
    WHERE Nombre = nombre_hospital;

    -- Obtener el ID del departamento dado su nombre y el ID del hospital
    SELECT Id_Departamento INTO v_id_departamento
    FROM Tabla_Departamento
    WHERE Nombre = nombre_departamento
    AND Id_Hospital = v_id_hospital;

    -- Insertar datos en la tabla Medico
    INSERT INTO Tabla_Medico(Id_Departamento, Nombre, Apellidos, Telefono, Fecha_Nacimiento, Direccion, Email, PIN)
    VALUES (v_id_departamento, nombre, apellidos, telefono, fecha_nacimiento, v_direccion, email, pin);

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('M閐ico insertado correctamente');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('El departamento especificado no existe para el hospital dado');
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error al insertar el m閐ico: ' || SQLERRM);
END;



-----------------------------
   --INSERTAR DEPARTAMENTOS--    
-----------------------------
-- Procedimiento para insertar datos en la Tabla_Departamento
CREATE OR REPLACE PROCEDURE Insertar_Departamento(
    nombre_hospital IN VARCHAR2,
    nombre IN VARCHAR2,
    ubicacion IN VARCHAR2
)
IS
    v_id_hospital Tabla_Hospital.Id_Hospital%TYPE;
BEGIN
    -- Obtener el ID del hospital dado su nombre
    SELECT Id_Hospital INTO v_id_hospital
    FROM Tabla_Hospital
    WHERE Nombre = nombre_hospital;

    -- Insertar datos en la tabla Departamento
    INSERT INTO Tabla_Departamento(Id_Hospital, Nombre, Ubicacion)
    VALUES (v_id_hospital, nombre, ubicacion);

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Departamento insertado correctamente');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('El hospital especificado no existe');
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error al insertar el departamento: ' || SQLERRM);
END;
/



-----------------------------
   --INSERTAR HOSPITALES--    
-----------------------------
-- Procedimiento para insertar datos en la Tabla_Hospital-
CREATE OR REPLACE PROCEDURE Insertar_Hospital(
    nombre IN VARCHAR2,
    ciudad IN VARCHAR2,
    calle IN VARCHAR2
)
IS
    v_direccion Tipo_Direccion := Tipo_Direccion(ciudad, calle);
BEGIN
    -- Insertar datos en la tabla Hospital
    INSERT INTO Tabla_Hospital(Nombre, Direccion)
    VALUES (nombre, v_direccion);
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Hospital insertado correctamente');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error al insertar el hospital: ' || SQLERRM);
END;
/



-----------------------------
   --INSERTAR DIAGNOSTICOS--    
-----------------------------
CREATE OR REPLACE PROCEDURE Insertar_Diagnostico(
    descripcion IN VARCHAR2,
    recomendacion IN VARCHAR2
)
IS
BEGIN
    -- Insertar datos en la tabla Diagnostico
    INSERT INTO Tabla_Diagnostico(Descripcion, Recomendacion)
    VALUES (descripcion, recomendacion);
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Diagn贸stico insertado correctamente');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error al insertar el diagn贸stico: ' || SQLERRM);
END;
/




-------------------------------
  --ELIMINAR PACIENTES--    
-------------------------------
-- Crear el procedimiento para eliminar pacientes
CREATE OR REPLACE PROCEDURE Eliminar_Paciente(
    email_paciente IN VARCHAR2
)
IS
BEGIN
    -- Eliminar el paciente basado en su direcci贸n de correo electr贸nico
    DELETE FROM Tabla_Paciente
    WHERE Email = email_paciente;
    
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Paciente eliminado correctamente');
EXCEPTION
    WHEN NO_DATA_FOUND THEN -- Capturar la excepci贸n cuando no se encuentra ning煤n dato
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('El paciente especificado no existe');
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error al eliminar el paciente: ' || SQLERRM);
END;
/


-------------------------------
  --ELIMINAR MEDICOS --    
-------------------------------
CREATE OR REPLACE PROCEDURE Eliminar_Medico(
    email_medico IN VARCHAR2
)
IS
BEGIN
    -- Eliminar el m茅dico basado en su direcci贸n de correo electr贸nico
    DELETE FROM Tabla_Medico
    WHERE Email = email_medico;
    
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('M茅dico eliminado correctamente');
EXCEPTION
    WHEN NO_DATA_FOUND THEN -- Capturar la excepci贸n cuando no se encuentra ning煤n dato
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('El m茅dico especificado no existe');
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error al eliminar el m茅dico: ' || SQLERRM);
END;
/





-------------------------------
  --ELIMINAR DEPARTAMENTOS--    
-------------------------------
CREATE OR REPLACE PROCEDURE Eliminar_Departamento(
    nombre_departamento IN VARCHAR2,
    nombre_hospital IN VARCHAR2
)
IS
BEGIN
    -- Obtener el ID del hospital dado su nombre
    DECLARE
        v_id_hospital Tabla_Hospital.Id_Hospital%TYPE;
    BEGIN
        SELECT Id_Hospital INTO v_id_hospital
        FROM Tabla_Hospital
        WHERE Nombre = nombre_hospital;

        -- Eliminar el departamento basado en su nombre y el ID del hospital
        DELETE FROM Tabla_Departamento
        WHERE Nombre = nombre_departamento
        AND Id_Hospital = v_id_hospital;

        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Departamento eliminado correctamente');
    EXCEPTION
        WHEN NO_DATA_FOUND THEN -- Capturar la excepci贸n cuando no se encuentra ning煤n dato
            ROLLBACK;
            DBMS_OUTPUT.PUT_LINE('El departamento especificado no existe');
        WHEN OTHERS THEN
            ROLLBACK;
            DBMS_OUTPUT.PUT_LINE('Error al eliminar el departamento: ' || SQLERRM);
    END;
END;
/


-------------------------------
  --ELIMINAR HOSPITALES --    
-------------------------------
CREATE OR REPLACE PROCEDURE Eliminar_Hospital(
    nombre_hospital IN VARCHAR2
)
IS
BEGIN
    -- Eliminar el hospital basado en su nombre
    DELETE FROM Tabla_Hospital
    WHERE Nombre = nombre_hospital;
    
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Hospital eliminado correctamente');
EXCEPTION
    WHEN NO_DATA_FOUND THEN -- Capturar la excepci贸n cuando no se encuentra ning煤n dato
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('El hospital especificado no existe');
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error al eliminar el hospital: ' || SQLERRM);
END;
/








---------------------------
  --CREAR CITAS --    
---------------------------
--Procedimiento para que el 
create or replace PROCEDURE Crear_Citas AS
  v_fecha DATE;
  v_hora TIMESTAMP(0);
  v_estado VARCHAR2(50) := 'Paciente sin asignar';
  v_citas_existen NUMBER;
  -- Declaraci髇 de cursores
  CURSOR hospital_cursor IS
    SELECT * FROM Tabla_Hospital;
  CURSOR departamento_cursor (p_id_hospital NUMBER) IS
    SELECT * FROM Tabla_Departamento WHERE Id_hospital = p_id_hospital;
  CURSOR medico_cursor (p_id_departamento NUMBER) IS
    SELECT * FROM Tabla_Medico WHERE Id_departamento = p_id_departamento;
BEGIN
  -- Obtener la fecha actual
  SELECT TRUNC(SYSDATE) INTO v_fecha FROM dual;

  -- Verificar si ya existen citas para la fecha actual
  SELECT COUNT(*) INTO v_citas_existen FROM Tabla_Cita WHERE Fecha = v_fecha;
  IF v_citas_existen > 0 THEN
    RAISE_APPLICATION_ERROR(-20001, 'Ya existen citas para la fecha actual.');
  END IF;

  -- Loop a trav閟 de todos los hospitales
  FOR hospital_rec IN hospital_cursor LOOP

    -- Loop a trav閟 de todos los departamentos del hospital actual
    FOR departamento_rec IN departamento_cursor(hospital_rec.Id_hospital) LOOP

      -- Loop a trav閟 de todos los m閐icos del departamento actual
      FOR medico_rec IN medico_cursor(departamento_rec.Id_departamento) LOOP

        -- Calcular hora de la cita (de 8 a 14)
        v_hora := TO_TIMESTAMP(TO_CHAR(v_fecha, 'YYYY-MM-DD') || ' 08:00:00', 'YYYY-MM-DD HH24:MI:SS');

        -- Crear la cita
        INSERT INTO Tabla_Cita (Id_cita, Id_medico, Id_paciente, Id_diagnostico, Fecha, Hora, Estado)
        VALUES (seq_cita_id.NEXTVAL, medico_rec.Id_medico, NULL, NULL, v_fecha, v_hora, v_estado);

        -- Incrementar hora en 1 hora (60 minutos)
        v_hora := v_hora + INTERVAL '60' MINUTE;

        -- Crear m醩 citas hasta las 14:00
        WHILE EXTRACT(HOUR FROM v_hora) < 14 LOOP
          INSERT INTO Tabla_Cita (Id_cita, Id_medico, Id_paciente, Id_diagnostico, Fecha, Hora, Estado)
          VALUES (seq_cita_id.NEXTVAL, medico_rec.Id_medico, NULL, NULL, v_fecha, v_hora, v_estado);
          v_hora := v_hora + INTERVAL '60' MINUTE;
        END LOOP;

      END LOOP; -- Fin del loop de m閐icos

    END LOOP; -- Fin del loop de departamentos

  END LOOP; -- Fin del loop de hospitales
END;
/