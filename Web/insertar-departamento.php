<?php
    // Conexión a la base de datos Oracle
    include('conexion.php');
    $conexion = conexion();

    // Comprobar si se envió el formulario
    if($_SERVER["REQUEST_METHOD"] == "POST"){
        // Recuperar datos del formulario
        $nombre_hospital = $_POST["nombre_hospital"];
        $nombre_departamento = $_POST["nombre_departamento"];
        $ubicacion = $_POST["ubicacion"];

        // Preparar y ejecutar la consulta SQL
        $sql = "BEGIN Insertar_Departamento(:nombre_hospital, :nombre_departamento, :ubicacion); END;";
        $stid = oci_parse($conexion, $sql);
        oci_bind_by_name($stid, ":nombre_hospital", $nombre_hospital);
        oci_bind_by_name($stid, ":nombre_departamento", $nombre_departamento);
        oci_bind_by_name($stid, ":ubicacion", $ubicacion);
        oci_execute($stid);
        oci_error();
    }
?>

<!DOCTYPE html>
<html>
<head>
    <title>Registro de Departamento</title>
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
    <!-- Enlaces a los archivos CSS -->
    <link rel="stylesheet" href="css/register.css">
    <!-- Enlace al archivo JavaScript -->
    
</head>
<body>

<header>   
    <nav>
        <div id="logo">HospiHub</div>
    </nav>
</header>

<div id="contenedor">
    <h1>Registrar Departamento</h1>
    
    <form action="#" method="post" id="formulario">
        <label for="nombre_hospital">Nombre del hospital</label><br>
        <input type="text" id="nombre_hospital" name="nombre_hospital" required>
    
        <br><br>
    
        <label for="nombre_departamento">Nombre del departamento</label><br>
        <input type="text" id="nombre_departamento" name="nombre_departamento" required>
            
        <br><br>
            
        <label for="ubicacion">Ubicación</label><br>
        <input type="text" id="ubicacion" name="ubicacion" required>
            
        <br><br>

        <button type="submit">Registrar</button>
    </form>
    <br>
    <br>
</div>
    
</body>
</html>
