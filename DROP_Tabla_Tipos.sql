-- Eliminar las tablas en el orden inverso al que se crearon

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