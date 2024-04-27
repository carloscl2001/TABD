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