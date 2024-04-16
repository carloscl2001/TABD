DECLARE
    v_nombre_paciente VARCHAR2(100) := 'Juan';
    v_apellidos_paciente VARCHAR2(100) := 'González';
    v_telefono_paciente NUMBER := 123456789;
    v_fecha_nacimiento DATE := TO_DATE('1990-01-01', 'YYYY-MM-DD');
    v_ciudad_paciente VARCHAR2(100) := 'Ciudad';
    v_calle_paciente VARCHAR2(100) := 'Calle';
    v_email_usuario VARCHAR2(100) := 'juan@example.com';
BEGIN
    Insertar_Paciente(
        v_nombre_paciente,
        v_apellidos_paciente,
        v_telefono_paciente,
        v_fecha_nacimiento,
        v_ciudad_paciente,
        v_calle_paciente,
        v_email_usuario
    );
    
    DBMS_OUTPUT.PUT_LINE('Procedimiento Insertar_Paciente ejecutado correctamente.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/