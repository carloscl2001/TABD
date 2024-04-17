-- Ejecutar inserción de datos de prueba
BEGIN

    -- Insertar médicos de prueba
    Insertar_Medico('Departamento X', 'Juan', 'González', 123456789, TO_DATE('1990-01-01', 'YYYY-MM-DD'), 'Ciudad X', 'Calle X', 'juan@example.com', 1234);
END;
/