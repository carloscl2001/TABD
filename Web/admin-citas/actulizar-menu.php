<!DOCTYPE html>
<html>
<head>
    <title>HospiHub - Citas Disponibles</title>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1" name="viewport">
    <!-- Metadatos del autor y diseñador del sitio -->
    <meta name="author" content="Carlos Antonio Cortés Lora, Roberto Rivero Díaz">
    <meta name="designer" content="Carlos Antonio Cortés Lora, Roberto Rivero Díaz">
    <!-- Enlaces a las fuentes de Google y hojas de estilos -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Rubik:ital,wght@0,300..900;1,300..900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <!-- Enlaces a los archivos CSS -->
    <link rel="stylesheet" href="../css/procesar-citas.css">
    <!-- Enlace al archivo JavaScript hola jefe -->
    
</head>
<body>
<?php// Conectar a la base de datos
    include('conexion.php');
    $conexion = conexion();

    // Preparar la consulta SQL para actualizar la cita con el ID del paciente y cambiar su estado
    $sql = "BEGIN Crear_Citas(); END;";
    $stmt = oci_parse($conexion, $sql);


    // Ejecutar la consulta
    $resultado = oci_execute($stmt);

    echo "Citas creadas correctamente";
?>
<br><br>

<br>
<a href="menu-admin.php">Regresar al menú del admin <span class="material-symbols-outlined">
        arrow_left_alt
        </span></a>

</body>
</html>