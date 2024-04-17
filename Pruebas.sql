
--TRIGGER ID_HOSPITAL
CREATE OR REPLACE TRIGGER trg_hospital_id
BEFORE INSERT ON Tabla_Hospital
FOR EACH ROW
BEGIN
  :new.Id_hospital := seq_hospital_id.NEXTVAL;
END;
/