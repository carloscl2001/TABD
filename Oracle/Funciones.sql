-------------------------------
  --VERFICAR PACIENTE--    
-------------------------------
CREATE OR REPLACE FUNCTION Verificar_Credenciales_Paciente(email_in VARCHAR2, pin_in VARCHAR2) RETURN NUMBER AS
    paciente_id NUMBER;
BEGIN
    SELECT Id_paciente INTO paciente_id
    FROM Tabla_Paciente
    WHERE Email = email_in AND PIN = pin_in;
    
    RETURN paciente_id;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
END;
/

CREATE OR REPLACE FUNCTION Obtener_Departamentos_Hospitales_Cursor RETURN SYS_REFCURSOR AS
    v_cursor SYS_REFCURSOR;
BEGIN
    OPEN v_cursor FOR
        SELECT 
            d.Id_departamento,
            d.Nombre AS Nombre_departamento,
            d.Ubicacion AS Ubicacion_departamento,
            h.Id_hospital,
            h.Nombre AS Nombre_hospital,
            h.Direccion.Ciudad AS Ciudad_hospital,
            h.Direccion.Calle AS Calle_hospital
        FROM 
            Tabla_Departamento d
            JOIN Tabla_Hospital h ON d.Id_hospital = h.Id_hospital;

    RETURN v_cursor;
END;
/


-------------------------------
  --VERFICAR MEDICO--    
-------------------------------
CREATE OR REPLACE FUNCTION Verificar_Credenciales_Medico(email_in VARCHAR2, pin_in VARCHAR2) RETURN NUMBER AS
    id_medico NUMBER;
BEGIN
    SELECT Id_Medico INTO id_medico
    FROM Tabla_Medico
    WHERE Email = email_in AND PIN = pin_in;
    
    RETURN id_medico;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
END;
/

-------------------------------
  --OBTENER DIAGNOSTICO--    
-------------------------------
CREATE OR REPLACE FUNCTION Obtener_Max_Id_Diagnostico
RETURN NUMBER
IS
    max_id_diagnostico NUMBER;
BEGIN
    -- Seleccionar el mÃ¡ximo ID de diagnÃ³stico de la tabla Tabla_Diagnostico
    SELECT MAX(Id_diagnostico) INTO max_id_diagnostico FROM Tabla_Diagnostico;
    
    -- Devolver el mÃ¡ximo ID de diagnÃ³stico
    RETURN max_id_diagnostico;
EXCEPTION
    WHEN OTHERS THEN
        RETURN NULL; -- En caso de error, devolver NULL
END;
/

-- Función para obtener los hospitales utilizando un cursor
CREATE OR REPLACE FUNCTION Obtener_Hospitales_Cursor RETURN SYS_REFCURSOR IS
    resultado SYS_REFCURSOR;
BEGIN
    OPEN resultado FOR
    SELECT 
        h.Id_hospital,
        h.Nombre AS Nombre_hospital,
        h.Direccion.Ciudad AS Ciudad_hospital,
        h.Direccion.Calle AS Calle_hospital
    FROM 
        Tabla_Hospital h;
    RETURN resultado;
END;
/

-- Función para obtener los médicos utilizando un cursor
CREATE OR REPLACE FUNCTION Obtener_Medicos_Cursor RETURN SYS_REFCURSOR IS
    resultado SYS_REFCURSOR;
BEGIN
    OPEN resultado FOR
    SELECT 
        m.Id_medico,
        m.Nombre,
        m.Apellidos,
        m.Telefono,
        m.Fecha_nacimiento,
        m.Direccion.Ciudad AS Ciudad,
        m.Direccion.Calle AS Calle,
        m.Email,
        m.PIN,
        d.Id_departamento,
        d.Nombre AS Nombre_departamento,
        h.Id_hospital,
        h.Nombre AS Nombre_hospital
    FROM 
        Tabla_Medico m
        JOIN Tabla_Departamento d ON m.Id_departamento = d.Id_departamento
        JOIN Tabla_Hospital h ON d.Id_hospital = h.Id_hospital;
    RETURN resultado;
END;
/

-- Función para obtener los pacientes utilizando un cursor
CREATE OR REPLACE FUNCTION Obtener_Pacientes_Cursor RETURN SYS_REFCURSOR IS
    resultado SYS_REFCURSOR;
BEGIN
    OPEN resultado FOR
    SELECT 
        p.Id_paciente,
        p.Nombre,
        p.Apellidos,
        p.Telefono,
        p.Fecha_nacimiento,
        p.Direccion.Ciudad AS Ciudad,
        p.Direccion.Calle AS Calle,
        p.Email,
        p.PIN
    FROM 
        Tabla_Paciente p;
    RETURN resultado;
END;
/
