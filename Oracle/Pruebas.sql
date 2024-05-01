SET SERVEROUTPUT ON
-- Procedimiento para insertar datos en la Tabla_Paciente
DECLARE
BEGIN
    Insertar_Paciente('PAblo', 'Cort?s', 644326265, TO_DATE('2024-04-06', 'YYYY-MM-DD'), 'San Fernando, C?diz', 'Albina,31', 'carlosaantonio.uca.es', 12345678);
     
END;
/

-- Procedimiento para insertar datos en la Tabla_Hospital
DECLARE
BEGIN
    Insertar_Hospital('Hospital Centro', 'Ciudad', 'Avenida Principal');
END;
/

-- Procedimiento para insertar datos en la Tabla_Departamento
DECLARE
BEGIN
    Insertar_Departamento('Hospital Centro', 'Cardiologia', 'Piso 5');
END;
/

-- Procedimiento para insertar datos en la Tabla_Diagnostico
DECLARE
BEGIN
    Insertar_Diagnostico('Dolor de cabeza', 'Reposo y medicaci?n');
END;
/

-- Procedimiento para insertar datos en la Tabla_Medico
DECLARE
BEGIN
    Insertar_Medico('Cardiologia', 'Pedro', 'L?pez', 987654321, TO_DATE('1985-03-20', 'YYYY-MM-DD'), 'Ciudad', 'Calle 2', 'pedro@example.com', 5678);
END;
/

-- Procedimiento para insertar datos en la Tabla_Cita
DECLARE
BEGIN
    Insertar_Cita_sin_Paciente(6, TO_DATE('2024-04-17', 'YYYY-MM-DD'), TO_DATE('1:30', 'HH24:MI'));
END;
/

BEGIN
    Eliminar_Medico('carlosantonio.corteslora@alum.uca.es');
END;
/


BEGIN
    DELETE FROM Tabla_Cita;
END;
/

BEGIN
    Crear_Citas();
END;
/

SELECT c.Id_cita, c.Fecha, c.Hora, m.Nombre AS Nombre_medico
            FROM Tabla_Cita c
            JOIN Tabla_Medico m ON c.Id_medico = m.Id_medico
            JOIN Tabla_Departamento d ON m.Id_departamento = d.Id_departamento
            JOIN Tabla_Hospital h ON d.Id_hospital = h.Id_hospital
            WHERE h.Nombre = 'H1'
            AND d.Nombre = 'Cardiologia'
            AND c.Estado = 'Paciente sin asignar';
            
            
SELECT c.Id_cita FROM Tabla_Cita c;

SELECT TO_CHAR(c.Hora, 'HH24:MI:SS') AS fecha_formateada
FROM Tabla_Cita c;