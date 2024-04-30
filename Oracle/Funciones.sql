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

CREATE OR REPLACE FUNCTION Verificar_Credenciales_Medico(email_in VARCHAR2, pin_in VARCHAR2) RETURN NUMBER AS
    medico_id NUMBER;
BEGIN
    SELECT Id_medico INTO medico_id
    FROM Tabla_Medico
    WHERE Email = email_in AND PIN = pin_in;
    
    RETURN medico_id;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
END;
/

CREATE OR REPLACE FUNCTION Obtener_Id_Paciente(email IN VARCHAR2) RETURN NUMBER IS
    v_id_paciente NUMBER;
BEGIN
    SELECT Id_paciente INTO v_id_paciente
    FROM Tabla_Paciente
    WHERE Email = email;

    RETURN v_id_paciente;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL; -- Devuelve NULL si no se encuentra ningún paciente con el correo electrónico dado
END;
/


CREATE OR REPLACE FUNCTION Obtener_Id_Medico(email IN VARCHAR2) RETURN NUMBER IS
    v_id_medico NUMBER;
BEGIN
    SELECT Id_medico INTO v_id_medico
    FROM Tabla_Medico
    WHERE Email = email;

    RETURN v_id_medico;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL; -- Devuelve NULL si no se encuentra ningún paciente con el correo electrónico dado
END;
/