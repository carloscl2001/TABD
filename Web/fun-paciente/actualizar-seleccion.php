<?php
session_start(); // Iniciar la sesión para acceder al id_paciente

// Verificar si se recibió el ID de la cita seleccionada y el ID del paciente
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['cita_id']) && isset($_SESSION['id_paciente'])) {
    // Obtener el ID de la cita seleccionada y el ID del paciente desde la sesión
    $id_cita = $_POST['cita_id'];
    echo $id_cita;
    $id_paciente = $_SESSION['id_paciente'];
    

    // Conectar a la base de datos
    include('../conexion.php');
    $conexion = conexion();

    // Preparar la consulta SQL para actualizar la cita con el ID del paciente y cambiar su estado
    $sql = "BEGIN Asignar_Cita(:id_paciente, :id_cita); END;";
    $stmt = oci_parse($conexion, $sql);

    // Bind de los parámetros
    oci_bind_by_name($stmt, ":id_paciente", $id_paciente);
    oci_bind_by_name($stmt, ":id_cita", $id_cita);

    // Ejecutar la consulta
    $resultado = oci_execute($stmt);

    // Verificar si la actualización fue exitosa
    if ($resultado) {
        echo "La cita ha sido asignada correctamente.";
    } else {
        echo "Error al asignar la cita.";
    }

    // Liberar recursos
    oci_free_statement($stmt);
    oci_close($conexion);
} else {
    // Redireccionar si no se recibió el ID de la cita o el ID del paciente
    header("Location: elegir-citas.php");
    exit();
}
?>
