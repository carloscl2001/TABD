CREATE OR REPLACE FUNCTION Comprobar_Paciente(email IN VARCHAR2, pin IN NUMBER) RETURN BOOLEAN IS
    v_pin_correcto NUMBER;
BEGIN
  SELECT PIN INTO v_pin_correcto
  FROM Tabla_Paciente
  WHERE Email = email;

  
  IF pin = v_pin_correcto THEN
    RETURN TRUE;
  ELSE
    RETURN FALSE;
  END IF;
  
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN FALSE;
END;
/


CREATE OR REPLACE FUNCTION Comprobar_Medico(email IN VARCHAR2, pin IN NUMBER) RETURN BOOLEAN IS
    v_pin_correcto NUMBER;
BEGIN
  SELECT PIN INTO v_pin_correcto
  FROM Tabla_Medico
  WHERE Email = email;

  
  IF pin = v_pin_correcto THEN
    RETURN TRUE;
  ELSE
    RETURN FALSE;
  END IF;
  
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN FALSE;
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