-- Ejecutar inserci�n de datos de prueba
BEGIN

    -- Insertar m�dicos de prueba
    Insertar_Medico('Departamento X', 'Juan', 'Gonz�lez', 123456789, TO_DATE('1990-01-01', 'YYYY-MM-DD'), 'Ciudad X', 'Calle X', 'juan@example.com', 1234);
END;
/