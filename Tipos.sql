-- Creacion de tipos propios

-- Direccion
CREATE OR REPLACE TYPE Tipo_Direccion AS OBJECT (
    Ciudad VARCHAR2(25),
    Calle VARCHAR2(50)
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

--Creacion de tipos especificos

--Paciente
CREATE OR REPLACE TYPE Tipo_Paciente AS OBJECT (
    Id_paciente NUMBER,
    Datos_persona Tipo_Persona
);
/

-- M�dico
CREATE OR REPLACE TYPE Tipo_Medico AS OBJECT (
    Id_medico NUMBER,
    Datos_persona Tipo_Persona,
    Id_departamento NUMBER
);
/

-- Primero definimos los tipos sin referencias cruzadas
CREATE OR REPLACE TYPE Tipo_Diagnostico AS OBJECT (
    Id_diagnostico NUMBER,
    Descripcion VARCHAR(100),
    Recomendacion VARCHAR(100)
);
/

-- Cita
CREATE OR REPLACE TYPE Tipo_Cita AS OBJECT (
    Id_cita NUMBER,
    Id_medico NUMBER,
    Id_paciente NUMBER,
    Id_diagnostico NUMBER,
    Fecha_cita DATE,
    Hora_cita DATE,
    Estado VARCHAR(10)
);
/

-- Medicamento
CREATE OR REPLACE TYPE Tipo_Medicamento AS OBJECT (
    Id_medicamento NUMBER,
    Id_diagnostico NUMBER,
    Nombre VARCHAR(20),
    Descripcion VARCHAR2(100),
    Stock NUMBER,
    Precio FLOAT
);
/



-- Departamento
CREATE OR REPLACE TYPE Tipo_Departamento AS OBJECT (
    Id_departamento NUMBER,
    Id_hospital NUMBER,
    Nombre VARCHAR2(20),
    Ubicacion VARCHAR2(20)
);
/


-- Hospital
CREATE OR REPLACE TYPE Tipo_Hospital AS OBJECT (
    Id_hospital NUMBER,
    Nombre VARCHAR2(20),
    Direccion Tipo_Direccion
);
/