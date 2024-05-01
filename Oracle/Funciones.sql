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
    -- Seleccionar el máximo ID de diagnóstico de la tabla Tabla_Diagnostico
    SELECT MAX(Id_diagnostico) INTO max_id_diagnostico FROM Tabla_Diagnostico;
    
    -- Devolver el máximo ID de diagnóstico
    RETURN max_id_diagnostico;
EXCEPTION
    WHEN OTHERS THEN
        RETURN NULL; -- En caso de error, devolver NULL
END;
/
