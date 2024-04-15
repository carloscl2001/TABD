-- Creación de tipos

-- Dirección
CREATE OR REPLACE TYPE Tipo_Direccion AS OBJECT (
    Calle VARCHAR2(50),
    Ciudad VARCHAR2(25)
);
/

-- Usuario
CREATE OR REPLACE TYPE Tipo_Usuario AS OBJECT (
    Email VARCHAR2(20),
    PIN NUMBER(8)
);
/

-- Persona
CREATE OR REPLACE TYPE Tipo_Persona AS OBJECT (
    Nombre VARCHAR2(20), 
    Apellidos VARCHAR2(20),
    Telefono NUMBER(9),
    Direccion Tipo_Direccion,
    Datos_usuario Tipo_Usuario,
    Fecha_nacimiento DATE
);
/

-- Médico
CREATE OR REPLACE TYPE Tipo_Medico AS OBJECT (
    Id_medico NUMBER,
    Datos_persona Tipo_Persona,
    Id_departamento NUMBER
);
/

-- Cita
CREATE OR REPLACE TYPE Tipo_Cita AS OBJECT (
    Id_cita NUMBER,
    Fecha_cita DATE,
    Hora_cita DATE
);
/

-- Paciente
---- Lista de citas
CREATE OR REPLACE TYPE Tipo_Lista_Citas AS TABLE OF REF Tipo_Cita;
/

CREATE OR REPLACE TYPE Tipo_Paciente AS OBJECT (
    Id_paciente NUMBER,
    Datos_persona Tipo_Persona
);
/

-- Primero definimos los tipos sin referencias cruzadas
CREATE OR REPLACE TYPE Tipo_Diagnostico AS OBJECT (
    Id_diagnostico NUMBER,
    Descripcion VARCHAR(100),
    Recomendacion VARCHAR(100)
);
/

CREATE OR REPLACE TYPE Tipo_Medicamento AS OBJECT (
    Id_medicamento NUMBER,
    Nombre VARCHAR(20),
    Descripcion VARCHAR2(100),
    Stock NUMBER,
    Precio FLOAT
);
/

-- Luego, agregamos las referencias cruzadas
CREATE OR REPLACE TYPE Tipo_Diagnosticos_Medicamento AS TABLE OF REF Tipo_Diagnostico;
/

CREATE OR REPLACE TYPE Tipo_Medicamentos_Diagnostico AS TABLE OF REF Tipo_Medicamento;
/

ALTER TYPE Tipo_Medicamento ADD ATTRIBUTE Lista_diagnosticos Tipo_Diagnosticos_Medicamento CASCADE;
/

ALTER TYPE Tipo_Diagnostico ADD ATTRIBUTE Lista_medicamentos Tipo_Medicamentos_Diagnostico CASCADE;
/

-- Luego, agregamos las referencias cruzadas
CREATE OR REPLACE TYPE Tipo_Citas_Medico AS TABLE OF REF Tipo_Cita;
/

CREATE OR REPLACE TYPE Tipo_Citas_Paciente AS TABLE OF REF Tipo_Cita;
/

CREATE OR REPLACE TYPE Tipo_Citas_Diagnostico AS TABLE OF REF Tipo_Cita;
/

CREATE OR REPLACE TYPE Tipo_Medicos_Cita AS TABLE OF REF Tipo_Medico;
/

CREATE OR REPLACE TYPE Tipo_Pacientes_Cita AS TABLE OF REF Tipo_Paciente;
/

ALTER TYPE Tipo_Medico ADD ATTRIBUTE Lista_citas Tipo_Citas_Medico CASCADE;
/

ALTER TYPE Tipo_Paciente ADD ATTRIBUTE Lista_citas Tipo_Citas_Paciente CASCADE;
/

ALTER TYPE Tipo_Diagnostico ADD ATTRIBUTE Lista_citas Tipo_Citas_Diagnostico CASCADE;
/

ALTER TYPE Tipo_Cita ADD ATTRIBUTE Id_medico REF Tipo_Medico CASCADE;
/

ALTER TYPE Tipo_Cita ADD ATTRIBUTE Id_paciente REF Tipo_Paciente CASCADE;
/

ALTER TYPE Tipo_Cita ADD ATTRIBUTE Id_diagnostico REF Tipo_Diagnostico CASCADE;
/

-- Departamento
-- Lista de medicos
CREATE OR REPLACE TYPE Tipo_Lista_Medicos AS TABLE OF REF Tipo_Medico;
/

CREATE OR REPLACE TYPE Tipo_Departamento AS OBJECT (
    Id_departamento NUMBER,
    Nombre VARCHAR2(20),
    Ubicacion VARCHAR2(20),
    Lista_medicos Tipo_Lista_Medicos
);
/


-- Hospital
--   Lista de departamentos
CREATE OR REPLACE TYPE Tipo_Lista_Departamentos AS TABLE OF REF Tipo_Departamento;
/


CREATE OR REPLACE TYPE Tipo_Hospital AS OBJECT (
    Nombre VARCHAR2(20),
    Direccion Tipo_Direccion,
    Lista_departamentos Tipo_Lista_Departamentos
);
/