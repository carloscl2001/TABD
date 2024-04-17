-- Procedimiento para insertar datos en la Tabla_Paciente
DECLARE
BEGIN
    Insertar_Paciente('Juan', 'González', 123456789, TO_DATE('1990-05-15', 'YYYY-MM-DD'), 'Ciudad', 'Calle', 'juan@example.com', 1234);
END;
/

-- Procedimiento para insertar datos en la Tabla_Hospital
DECLARE
BEGIN
    Insertar_Hospital('Hospital Central', 'Ciudad', 'Avenida Principal');
END;
/

-- Procedimiento para insertar datos en la Tabla_Departamento
DECLARE
BEGIN
    Insertar_Departamento('Hospital Central', 'Cardiología', 'Piso 5');
END;
/

-- Procedimiento para insertar datos en la Tabla_Diagnostico
DECLARE
BEGIN
    Insertar_Diagnostico('Dolor de cabeza', 'Reposo y medicación');
END;
/

-- Procedimiento para insertar datos en la Tabla_Medico
DECLARE
BEGIN
    Insertar_Medico('Cardiología', 'Pedro', 'López', 987654321, TO_DATE('1985-03-20', 'YYYY-MM-DD'), 'Ciudad', 'Calle 2', 'pedro@example.com', 5678);
END;
/

-- Procedimiento para insertar datos en la Tabla_Cita
DECLARE
BEGIN
    Insertar_Cita_sin_Paciente(3, TO_DATE('2024-04-17', 'YYYY-MM-DD'), TO_DATE('1:30', 'HH24:MI'));
END;
/


SELECT TO_CHAR(hora, 'HH24:MI:SS') as "HORITA"
FROM Tabla_Cita;
