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
