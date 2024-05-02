SET SERVEROUTPUT ON
-- Procedimiento para insertar datos en la Tabla_Paciente
DECLARE
BEGIN
    Insertar_Paciente('PAblo', 'Cort?s', 644326265, TO_DATE('2024-04-06', 'YYYY-MM-DD'), 'San Fernando, C?diz', 'Albina,31', 'carlosaantonio.uca.es', 12345678);
     
END;
/

BEGIN
    Insertar_Paciente('Pablo', 'Cortes Lora', 678625565, TO_DATE('2002-08-20', 'YYYY-MM-DD'), 'San Fernando', 'C. Albina, 31', 'pablocorteslora@alum.uca.es', 12345678);
    Insertar_Paciente('Carlos', 'Cortes Lora', 644326265, TO_DATE('2001-05-10', 'YYYY-MM-DD'), 'San Fernando', 'C. Albina, 31', 'carlosantoniocorteslora@alum.uca.es', 12345);
    Insertar_Paciente('Roberto', 'Rivero Diaz', 644326265, TO_DATE('2002-04-12', 'YYYY-MM-DD'), 'Cadiz', 'C. Obrdor, 5', 'robertoriverodiaz@alum.uca.es', 12345);
    Insertar_Paciente('Lucas', 'Gomez Coello', 642346263, TO_DATE('2002-03-08', 'YYYY-MM-DD'), 'Jerez', 'C. GEneral, 21', 'lucasgomezcoello@alum.uca.es', 12345);
    --PARA METER -> Insertar_Paciente()
    
    
    Insertar_Hospital('Hospital Universitario Puerta del Mar', 'Cadiz', 'Av. Ana de Viya, 21');
    Insertar_Hospital('Hospital Universitario Puerto Real', 'Puerto Real', 'Calle Romería, 7');
    Insertar_Hospital('Carlos III', 'San Fernando', 'C. de Sinesio Delgado, 10');

    
    Insertar_Departamento('Hospital Universitario Puerta del Mar', 'Cardiologia', 'Piso 4');
    Insertar_Departamento('Hospital Universitario Puerto Real', 'Cardiologia', 'Piso 4');
    Insertar_Departamento('Carlos III', 'Cardiologia', 'Piso 5');
   
    Insertar_Departamento('Hospital Universitario Puerta del Mar', 'Dermatologia', 'Piso 2');
    Insertar_Departamento('Hospital Universitario Puerto Real', 'Dermatologia', 'Piso 5');
    Insertar_Departamento('Carlos III', 'Dermatologia', 'Piso 3');
     
    Insertar_Departamento('Hospital Universitario Puerta del Mar', 'Aantomia', 'Piso 2');
    Insertar_Departamento('Hospital Universitario Puerto Real', 'Anatomia', 'Piso 5');
    --PARA METER -> Insertar_Departamento('Carlos III', 'Dermatologia', 'Piso 3');
    
    
    Insertar_Medico('Hospital Universitario Puerta del Mar', 'Cardiologia', 'Pedro', 'Lopez Rueda', 987654321, TO_DATE('1985-03-20', 'YYYY-MM-DD'), 'Jerez', 'Calle Rojo, 5', 'pedro@example.com', 5678);
    Insertar_Medico('Hospital Universitario Puerta del Mar', 'Dermatologia', 'Maria', 'Dominguez Rivera', 987665321, TO_DATE('1986-04-21', 'YYYY-MM-DD'), 'San Fernando', 'Calle Amapola, 10', 'maria@example.com', 5867);
    Insertar_Medico('Hospital Universitario Puerta del Mar', 'Anatomia', 'Idelfonsio', 'Hernandez Gomez', 687645321, TO_DATE('1986-04-21', 'YYYY-MM-DD'), 'San Fernando', 'Calle Girasol, 7', 'idelfonsio@example.com', 5867);

    Insertar_Medico('Hospital Universitario Puerto Real', 'Cardiologia', 'Carlos', 'Lopez Rueda', 987654321, TO_DATE('1985-03-20', 'YYYY-MM-DD'), 'Jerez', 'Calle Azul, 4', 'carlos@example.com', 5678);
    Insertar_Medico('Hospital Universitario Puerto Real', 'Dermatologia', 'Dani', 'Dominguez Rivera', 987665321, TO_DATE('1986-04-21', 'YYYY-MM-DD'), 'San Fernando', 'Calle Clavel, 9', 'dani@example.com', 5867);
    Insertar_Medico('Hospital Universitario Puerto Real', 'Anatomia', 'Ivan', 'Hernandez Gomez', 687645321, TO_DATE('1986-04-21', 'YYYY-MM-DD'), 'San Fernando', 'Calle Alemania, 8', 'ivan@example.com', 5867);
    
    Insertar_Medico('Carlos III', 'Cardiologia', 'Alejandro', 'Lopez Rueda', 987654321, TO_DATE('1985-03-20', 'YYYY-MM-DD'), 'Jerez', 'Calle Amarillo, 2', 'alejandro@example.com', 5678);
    Insertar_Medico('Carlos III', 'Dermatologia', 'Daniela', 'Dominguez Rivera', 987665321, TO_DATE('1986-04-21', 'YYYY-MM-DD'), 'San Fernando', 'Calle Avenida Verde, 3', 'daniela@example.com', 5867);
    --PARA METER ->Insertar_Medico('Hospital Universitario Puerto Real', 'Anatomia');

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