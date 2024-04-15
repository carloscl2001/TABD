--CREACION DE TIPOS

--Direccion
CREATE OR REPLACE TYPE Tipo_Direccion AS OBJECT
(
    Calle VARCHAR2(50),
    Ciudad VARCHAR2(25)
);
/

--Usuario
CREATE OR REPLACE TYPE Tipo_Usuario AS OBJECT(
    Email VARCHAR2(20),
    PIN NUMBER(8)
);
/

--Persona
CREATE OR REPLACE TYPE Tipo_Persona AS OBJECT(
    Nombre VARCHAR2(20), 
    Apellidos VARCHAR2(20),
    Telefono NUMBER(9),
    Direccion Tipo_Direccion,
    Datos_usuario Tipo_Usuario,
    Fecha_nacimiento DATE
);
/

--Medico
CREATE TYPE Tipo_Lista_Citas AS TABLE OF REF Tipo_Cita;
/

CREATE OR REPLACE TYPE Tipo_Medico AS OBJECT(
    Id_medico NUMBER,
    Datos_persona Tipo_Persona,
    Id_departamento NUMBER,
    Lista_citas Tipo_Listas_Citas
);
/

--Paciente
CREATE OR REPLACE TYPE Tipo_Paciente AS OBJECT(
    Id_paciente NUMBER,
    Datos_persona Tipo_Persona,
    Lista_citas Tipo_Listas_Citas
);
/


--Cita
CREATE OR REPLACE TYPE Tipo_Cita AS OBJECT(
    Id_cita NUMBER,
    Id_medico REF Tipo_Medico,
    Id_paciente REF Tipo_Paciente,
    Id_iagnostico REF Tipo_Diagnostico,
    Fecha_cita DATE,
    Hora_cita DATE
);
/

--Medicamento
CREATE TYPE Tipo_Diagnosticos_Medicamento AS TABLE OF REF Tipo_Diagnostico;
/

CREATE TYPE Tipo_Medicamento AS OBJECT(
    Id_medicamento NUMBER,
    Nombre VARCHAR(20),
    Descripcion VARCHAR2(100),
    Stock NUMBER,
    Precio FLOAT,
    Lista_diagnosticos Tipo_Diagnostico_Medicamento
);
/



--Diagnostico
CREATE TYPE Tipo_Medicamentos_Diagnostico AS TABLE OF REF Tipo_Medicamento;
/

CREATE OR REPLACE TYPE Tipo_Diagnostico AS OBJECT(
    Id_diagnostico NUMBER,
    Id_cita REF Tipo_Cita,
    Descripcion VARCHAR(100),
    Recomendacion VARCHAR(100),
    Lista_medicamentos Tipo_Medicamentos_Diagnostico
);
/

--DEPARTAMENTO
CREATE OR REPLACE TYPE Tipo_Lista_Medicos AS TABLE OF Tipo_Medico;
/

CREATE OR REPLACE TYPE Tipo_Departamento AS OBJECT(
    Id_departamento NUMBER,
    Nombre VARCHAR2(20),
    Ubicacion VARCHAR2(20),
    Lista_medicos Tipo_Lista_Medicos
);
/

--HOSPITAL
CREATE OR REPLACE TYPE Tipo_Lista_Departamentos AS TABLE OF Tipo_Departamento;
/

CREATE OR REPLACE TYPE Tipo_Hospital AS OBJECT(
    Nombre VARCHAR2(20),
    Direccion Tipo_Direccion,
    Lista_departamentos Tipo_Lista_Departamentos
);
/











