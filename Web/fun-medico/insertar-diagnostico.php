<?php
// Verificar si se recibieron los datos del formulario
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['cita_id']) && isset($_POST['descripcion']) && isset($_POST['recomendacion']) && isset($_POST['nombre_medicamento']) && isset($_POST['frecuencia'])) {
    // Obtener los datos del formulario
    $cita_id = $_POST['cita_id'];
    $descripcion = $_POST['descripcion'];
    $recomendacion = $_POST['recomendacion'];
    $nombre_medicamento = $_POST['nombre_medicamento'];
    $frecuencia = $_POST['frecuencia'];

    // Incluir el archivo de conexión a la base de datos
    include('../conexion.php');
    $conexion = conexion();

    // Preparar la consulta SQL para insertar el diagnóstico
    $sql_diagnostico = "BEGIN Insertar_Diagnostico(:cita_id, :descripcion, :recomendacion); END;";
    $stmt_diagnostico = oci_parse($conexion, $sql_diagnostico);

    // Bind de los parámetros para el diagnóstico
    oci_bind_by_name($stmt_diagnostico, ":cita_id", $cita_id);
    oci_bind_by_name($stmt_diagnostico, ":descripcion", $descripcion);
    oci_bind_by_name($stmt_diagnostico, ":recomendacion", $recomendacion);

    // Ejecutar la consulta para insertar el diagnóstico
    $resultado_diagnostico = oci_execute($stmt_diagnostico);

    // Verificar si la inserción del diagnóstico fue exitosa
    if ($resultado_diagnostico) {
        echo "El diagnóstico se ha insertado correctamente.";

        // Obtener el ID del diagnóstico insertado
        $id_diagnostico = obtenerIdDiagnostico($conexion);

        // Preparar la consulta SQL para insertar el medicamento asociado al diagnóstico
        $sql_medicamento = "INSERT INTO Tabla_Medicamento(Id_diagnostico, Nombre, Frecuencia) VALUES (:id_diagnostico, :nombre_medicamento, :frecuencia)";
        $stmt_medicamento = oci_parse($conexion, $sql_medicamento);

        // Bind de los parámetros para el medicamento
        oci_bind_by_name($stmt_medicamento, ":id_diagnostico", $id_diagnostico);
        oci_bind_by_name($stmt_medicamento, ":nombre_medicamento", $nombre_medicamento);
        oci_bind_by_name($stmt_medicamento, ":frecuencia", $frecuencia);

        // Ejecutar la consulta para insertar el medicamento
        $resultado_medicamento = oci_execute($stmt_medicamento);

        // Verificar si la inserción del medicamento fue exitosa
        if ($resultado_medicamento) {
            echo "El medicamento se ha asociado correctamente al diagnóstico.";
        } else {
            echo "Error al insertar el medicamento asociado al diagnóstico.";
        }
    } else {
        echo "Error al insertar el diagnóstico.";
    }

    // Liberar recursos
    oci_free_statement($stmt_diagnostico);
    oci_free_statement($stmt_medicamento);
    oci_close($conexion);
} else {
    // Redireccionar si no se recibieron todos los datos necesarios
    header("Location: citas.php");
    exit();
}

// Función para obtener el ID del diagnóstico insertado
function obtenerIdDiagnostico($conexion)
{
    $sql = "SELECT MAX(Id_diagnostico) AS Id_diagnostico FROM Tabla_Diagnostico";
    $stmt = oci_parse($conexion, $sql);
    oci_execute($stmt);
    $row = oci_fetch_assoc($stmt);
    return $row['ID_DIAGNOSTICO'];
}
?>
