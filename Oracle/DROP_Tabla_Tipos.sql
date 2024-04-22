-- Eliminar las tablas en el orden inverso al que se crearon
DROP PROCEDURE Insertar_Paciente;
DROP PROCEDURE Insertar_Hospital;
DROP PROCEDURE Insertar_Departamento;
DROP PROCEDURE Insertar_Medico;
DROP PROCEDURE Insertar_Cita_General;
DROP PROCEDURE Insertar_Cita_Especializada;
DROP PROCEDURE Insertar_Medicamento;
DROP PROCEDURE Insertar_Cita_Sin_Paciente;



DROP TRIGGER trg_paciente_id;
DROP TRIGGER trg_medico_id;
DROP TRIGGER trg_cita_id;
DROP TRIGGER trg_diagnostico_id;
DROP TRIGGER trg_medicamento_id;
DROP TRIGGER trg_departamento_id;
DROP TRIGGER trg_hospital_id;


DROP SEQUENCE seq_paciente_id;
DROP SEQUENCE seq_medico_id;
DROP SEQUENCE seq_cita_id;
DROP SEQUENCE seq_diagnostico_id;
DROP SEQUENCE seq_medicamento_id;
DROP SEQUENCE seq_departamento_id;
DROP SEQUENCE seq_hospital_id;



-- Tabla Hospital
DROP TABLE Tabla_Hospital;

-- Tabla Medicamento
DROP TABLE Tabla_Medicamento;

-- Tabla Cita
DROP TABLE Tabla_Cita;

-- Tabla Diagnostico
DROP TABLE Tabla_Diagnostico;

-- Tabla Medico
DROP TABLE Tabla_Medico;

-- Tabla Departamento
DROP TABLE Tabla_Departamento;

-- Tabla Paciente
DROP TABLE Tabla_Paciente;

-- Eliminar los tipos en el orden inverso al que se crearon

-- Tipo Hospital
DROP TYPE Tipo_Hospital;

-- Tipo Departamento
DROP TYPE Tipo_Departamento;

-- Tipo Medicamento
DROP TYPE Tipo_Medicamento;

-- Tipo Cita
DROP TYPE Tipo_Cita;

-- Tipo Diagnostico
DROP TYPE Tipo_Diagnostico;

-- Tipo Medico
DROP TYPE Tipo_Medico;

-- Tipo Paciente
DROP TYPE Tipo_Paciente;

-- Finalmente, eliminar los tipos sin referencias cruzadas

-- Tipo Direccion
DROP TYPE Tipo_Direccion;




