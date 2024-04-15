--CREACION DE TABLAS

--Medicamento
CREATE TABLE Medicamento OF Tipo_Medicamento(
    CONSTRAINT PK_Medicamento PRIMARY KEY(Id_medicamento)
)

NESTED TABLE Lista_diagnosticos STORE AS Diagnosticos;
/

--Diagnostico
CREATE TABLE Diagnostico OF Tipo_Diagnostico(
    CONSTRAINT PK_Diagnostico PRIMARY KEY(Id_diagnostico),
    Id_cita NOT NULL
)

NESTED TABLE Lista_medicamentos STORE AS Medicamentos;
/

--Cita
CREATE TABLE Cita OF Tipo_Cita(
    CONSTRAINT PK_Cita PRIMARY KEY(Id_cita),
    Id_medico NOT NULL,
    Id_paciente NOT NULL,
    Id_diagnostico NOT NULL
);
/

--Medico
CREATE TABLE Medico OF Tipo_Medico(
    CONSTRAINT PK_Medico PRIMARY KEY(Id_medico),
    CONSTRAINT FK_Id_medico FOREIGN KEY(Id_departamento) REFERENCES Departamento(Id_departamento)
)

NESTED TABLE Lista_citas STORE AS Citas;

/

--Paciente
CREATE TABLE Paciente OF Tipo_Paciente(
    CONSTRAINT PK_Paciente PRIMARY KEY(Id_paciente)
)

NESTED TABLE Lista_citas STORE AS Citas;


--DEPARTAMENTO

CREATE TABLE Departamento OF Tipo_Departamento(
    CONSTRAINT PK_Departamento PRIMARY KEY(Id_departamento)
)

NESTED TABLE Lista_medicos STORE AS Medicos;
/

--HOSPITAL
CREATE TABLE Hospital OF Tipo_Hospital(
    CONSTRAINT PK_Hospital PRIMARY KEY(Nombre)
)

NESTED TABLE Lista_departamentos STORE AS Departamentos;
/
