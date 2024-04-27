<?php
    // Conexión a la base de datos Oracle
    include('../conexion.php');
    $conexion = conexion();

    // Inicializar la variable de mensaje
    $mensaje = '';

    // Comprobar si se envió el formulario
    if($_SERVER["REQUEST_METHOD"] == "POST"){
        // Recuperar el nombre del departamento y el nombre del hospital
        $nombre_departamento = $_POST["nombre_departamento"];
        $nombre_hospital = $_POST["nombre_hospital"];

        // Preparar y ejecutar la consulta SQL
        $sql = "BEGIN Eliminar_Departamento(:nombre_departamento, :nombre_hospital); END;";
        $stid = oci_parse($conexion, $sql);
        oci_bind_by_name($stid, ":nombre_departamento", $nombre_departamento);
        oci_bind_by_name($stid, ":nombre_hospital", $nombre_hospital);
        oci_execute($stid);

        // Verificar si se ejecutó correctamente
        $mensaje = 'Departamento eliminado correctamente';
    }
?>

<!DOCTYPE html>
<html>
<head>
    <title>HospiHub - Eliminar Departamento</title>
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
    <link rel="stylesheet" href="../register.css">
    <!-- Enlace al archivo JavaScript -->
    
</head>
<body>

<header>   
    <nav>
        <div id="logo">HospiHub</div>
    </nav>
</header>

<div id="contenedor">
    <h1>Eliminar Departamento</h1>
    
    <form action="#" method="post" id="formulario">
        <label for="nombre_departamento">Nombre del departamento a eliminar</label><br>
        <input type="text" id="nombre_departamento" name="nombre_departamento" required>
            
        <br><br>

        <label for="nombre_hospital">Nombre del hospital</label><br>
        <input type="text" id="nombre_hospital" name="nombre_hospital" required>
            
        <br><br>

        <button type="submit">Eliminar</button>
    </form>
    <a href="menu-admin.html">Regresar al menu principal</a> <br>

    <?php if (!empty($mensaje)) { ?>
        <div><?php echo $mensaje; ?></div>
    <?php } ?>
    <br>
    <br>
</div>
    
</body>
</html>
