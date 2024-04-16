-- Procedimiento para insertar datos en la tabla Paciente
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
