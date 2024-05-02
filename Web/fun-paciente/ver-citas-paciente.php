<?php

// Conecta al servicio XE (esto es, una base de datos) en el servidor "localhost"
include('../conexion.php');
$conexion = conexion();

session_start();

$paciente_id = $_SESSION['id_paciente'];
$email = $_SESSION['email'];
echo "<h1>Paciente: $email</h1>";

$stid = oci_parse($conexion, 
    'SELECT 
        c.Id_Cita, c.Fecha, TO_CHAR(c.Hora, \'HH24:MI:SS\') AS Hora_Cita, c.Id_Medico, c.Estado
    FROM 
        Tabla_Cita c
        JOIN Tabla_Paciente p ON c.Id_paciente = p.Id_paciente
        JOIN Tabla_Medico m ON c.Id_medico = m.Id_medico
    WHERE
        c.Id_Paciente = :paciente_id
     ');

oci_bind_by_name($stid, ":paciente_id", $paciente_id);
oci_execute($stid);

echo "<table class='table table-striped'>\n";
echo "<thead>";
echo "<tr>";
echo "<th>Id de la cita</th>";
echo "<th>Fecha de la cita</th>";
echo "<th>Hora de la cita</th>";
echo "<th>Id del Médico</th>";
echo "<th>Estado de la Cita</th>";
echo "</tr>";
echo "</thead>";
while ($row = oci_fetch_array($stid, OCI_ASSOC+OCI_RETURN_NULLS)) {
    echo "<tr>\n";
    echo "<td>" . ($row['ID_CITA'] !== null ? htmlentities($row['ID_CITA'], ENT_QUOTES) : "") . "</td>\n";
    echo "<td>" . ($row['FECHA'] !== null ? htmlentities($row['FECHA'], ENT_QUOTES) : "") . "</td>\n";
    echo "<td>" . ($row['HORA_CITA'] !== null ? htmlentities($row['HORA_CITA'], ENT_QUOTES) : "") . "</td>\n";
    echo "<td>" . ($row['ID_MEDICO'] !== null ? htmlentities($row['ID_MEDICO'], ENT_QUOTES) : "") . "</td>\n";
    echo "<td>" . ($row['ESTADO'] !== null ? htmlentities($row['ESTADO'], ENT_QUOTES) : "") . "</td>\n";
    // Agregar botón para ver detalles solo si el estado es "Diagnostico completado"
    if ($row['ESTADO'] === 'Diagnostico completado') {
        echo "<td><a href='ver-detalles-cita.php?id_cita=" . $row['ID_CITA'] . "'>Ver detalles</a></td>";
    } else {
        echo "<td></td>";
    }
    echo "</tr>\n";
}
echo "</table>\n";

?>
