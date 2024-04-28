<?php
// Incluir el archivo de conexión a la base de datos
include('../conexion.php');

// Verificar si se han enviado datos por el método POST
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Recuperar los datos del formulario
    $departamento = $_POST["departamento"];
    $fecha_inicio = $_POST["fecha_inicio"];
    $fecha_fin = $_POST["fecha_fin"];

    // Establecer la conexión a la base de datos
    $conexion = conexion();

    // Preparar la consulta SQL para obtener las citas disponibles
    $sql = "SELECT m.Nombre AS NombreMedico, c.Fecha, c.Hora
            FROM Tabla_Cita c
            INNER JOIN Tabla_Medico m ON c.Id_medico = m.Id_medico
            WHERE m.Id_departamento = :departamento
            AND c.Fecha BETWEEN TO_DATE(:fecha_inicio, 'YYYY-MM-DD') AND TO_DATE(:fecha_fin, 'YYYY-MM-DD')
            ORDER BY c.Fecha, c.Hora";

    // Preparar la sentencia
    $stid = oci_parse($conexion, $sql);

    // Vincular los parámetros
    oci_bind_by_name($stid, ":departamento", $departamento);
    oci_bind_by_name($stid, ":fecha_inicio", $fecha_inicio);
    oci_bind_by_name($stid, ":fecha_fin", $fecha_fin);

    // Ejecutar la consulta
    oci_execute($stid);

    // Mostrar las citas disponibles
    echo "<h2>Citas disponibles</h2>";
    echo "<ul>";
    while ($row = oci_fetch_assoc($stid)) {
        echo "<li>Medico: " . $row['NOMBREMEDICO'] . " | Fecha: " . $row['FECHA'] . " | Hora: " . $row['HORA'] . "</li>";
    }
    echo "</ul>";

    // Cerrar la conexión
    oci_close($conexion);
}
?>
