-- Procedimiento para insertar datos en la Tabla_Paciente-
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
    WHEN OTHERS THEN
        ROLLBACK;
    DBMS_OUTPUT.PUT_LINE('Error al insertar el paciente: ' || SQLERRM);
END;
/

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

-- Procedimiento para insertar datos en la Tabla_Departamento-
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


-- Procedimiento para insertar datos en la Tabla_Diagnostico
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
    DBMS_OUTPUT.PUT_LINE('Diagnóstico insertado correctamente');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error al insertar el diagnóstico: ' || SQLERRM);
END;
/

--Procedimiento para insertar datos en Tabla_Medico-
CREATE OR REPLACE PROCEDURE Insertar_Medico(
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
    v_id_departamento Tabla_Departamento.Id_Departamento%TYPE;
BEGIN
    DBMS_OUTPUT.PUT_LINE('eMPIEZA');
    -- Obtener el ID del departamento dado su nombre
    SELECT Id_Departamento INTO v_id_departamento
    FROM Tabla_Departamento
    WHERE Nombre = nombre_departamento;

    DBMS_OUTPUT.PUT_LINE(v_id_departamento);

    -- Insertar datos en la tabla Medico
    INSERT INTO Tabla_Medico(Id_Departamento, Nombre, Apellidos, Telefono, Fecha_Nacimiento, Direccion, Email, PIN)
    VALUES (v_id_departamento, nombre, apellidos, telefono, fecha_nacimiento, v_direccion, email, pin);

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('MÃ©dico insertado correctamente');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('El departamento especificado no existe');
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error al insertar el mÃ©dico: ' || SQLERRM);
END;
/



-- Procedimiento para insertar datos en la Tabla_Cita
CREATE OR REPLACE PROCEDURE Insertar_Cita(
    id_medico IN NUMBER,
    id_paciente IN NUMBER,
    id_diagnostico IN NUMBER,
    fecha_cita IN DATE,
    hora_cita IN DATE,
    estado IN VARCHAR2
)
IS
BEGIN
    -- Insertar datos en la tabla Cita
    INSERT INTO Tabla_Cita(Id_medico, Id_paciente, Id_diagnostico, Fecha_cita, Hora_cita, Estado)
    VALUES (id_medico, id_paciente, id_diagnostico, fecha_cita, hora_cita, estado);
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Cita insertada correctamente');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error al insertar la cita: ' || SQLERRM);
END;
/

-- Procedimiento para insertar datos en la Tabla_Medicamento
CREATE OR REPLACE PROCEDURE Insertar_Medicamento(
    id_diagnostico IN NUMBER,
    nombre IN VARCHAR2,
    descripcion IN VARCHAR2,
    stock IN NUMBER,
    precio IN FLOAT
)
IS
BEGIN
    -- Insertar datos en la tabla Medicamento
    INSERT INTO Tabla_Medicamento(Id_diagnostico, Nombre, Descripcion, Stock, Precio)
    VALUES (id_diagnostico, nombre, descripcion, stock, precio);
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Medicamento insertado correctamente');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error al insertar el medicamento: ' || SQLERRM);
END;
/

