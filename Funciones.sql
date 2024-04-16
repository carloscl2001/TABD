-- Procedimiento para insertar datos en la tabla Paciente
CREATE OR REPLACE PROCEDURE Insertar_Paciente(
    nombre_paciente IN VARCHAR2,
    apellidos_paciente IN VARCHAR2,
    telefono_paciente IN NUMBER,
    fecha_nacimiento IN DATE,
    ciudad_paciente IN VARCHAR2,
    calle_paciente IN VARCHAR2,
    email_usuario IN VARCHAR2
)
IS
    v_direccion Tipo_Direccion := Tipo_Direccion(ciudad_paciente, calle_paciente);
    v_usuario Tipo_Usuario := Tipo_Usuario(email_usuario, 12345678);
    v_persona Tipo_Persona := Tipo_Persona(nombre_paciente, apellidos_paciente, telefono_paciente, v_direccion, v_usuario, fecha_nacimiento);
BEGIN

    -- Insertar datos en la tabla Paciente
    INSERT INTO Tabla_Paciente(Datos_persona)
    VALUES (v_persona);
END;
/
