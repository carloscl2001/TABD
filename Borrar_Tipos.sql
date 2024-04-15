-- Eliminamos las referencias cruzadas
DROP TYPE Tipo_Citas_Medico FORCE;
DROP TYPE Tipo_Citas_Paciente FORCE;
DROP TYPE Tipo_Citas_Diagnostico FORCE;
DROP TYPE Tipo_Medicos_Cita FORCE;
DROP TYPE Tipo_Pacientes_Cita FORCE;

-- Eliminamos los tipos con referencias cruzadas
ALTER TYPE Tipo_Medicamento DROP ATTRIBUTE Lista_diagnosticos CASCADE;
ALTER TYPE Tipo_Diagnostico DROP ATTRIBUTE Lista_medicamentos CASCADE;
ALTER TYPE Tipo_Diagnostico DROP ATTRIBUTE Id_cita CASCADE;
ALTER TYPE Tipo_Cita DROP ATTRIBUTE Id_medico CASCADE;
ALTER TYPE Tipo_Cita DROP ATTRIBUTE Id_paciente CASCADE;
ALTER TYPE Tipo_Cita DROP ATTRIBUTE Id_diagnostico CASCADE;

-- Eliminamos los tipos sin referencias cruzadas
DROP TYPE Tipo_Direccion FORCE;
DROP TYPE Tipo_Usuario FORCE;
DROP TYPE Tipo_Persona FORCE;
DROP TYPE Tipo_Medico FORCE;
DROP TYPE Tipo_Cita FORCE;
DROP TYPE Tipo_Lista_Citas FORCE;
DROP TYPE Tipo_Paciente FORCE;
DROP TYPE Tipo_Diagnostico FORCE;
DROP TYPE Tipo_Medicamento FORCE;

-- Eliminamos los tipos adicionales
DROP TYPE Tipo_Lista_Medicos FORCE;
DROP TYPE Tipo_Departamento FORCE;
DROP TYPE Tipo_Lista_Departamentos FORCE;
DROP TYPE Tipo_Hospital FORCE;