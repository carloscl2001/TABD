<!DOCTYPE html>
<html>
<head>
    <title>HospiHub - Login de paciente</title>
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
    <link rel="stylesheet" href="../css/register.css">
    <!-- Enlace al archivo JavaScript -->
    
</head>
<body>

<?php
    // Incluir el archivo de conexión a la base de datos Oracle
    include('../conexion.php');
    
    // Comprobar si se envió el formulario
    if($_SERVER["REQUEST_METHOD"] == "POST"){
        // Recuperar datos del formulario
        $email = $_POST["email"];
        $pin = $_POST["pin"];

        // Consulta SQL para verificar las credenciales del paciente
        $sql = "SELECT Id_paciente FROM Tabla_Paciente WHERE Email = :email AND PIN = :pin";

        // Preparar la consulta
        $stid = oci_parse($conexion, $sql);

        // Bind de los parámetros
        oci_bind_by_name($stid, ":email", $email);
        oci_bind_by_name($stid, ":pin", $pin);

        // Ejecutar la consulta
        oci_execute($stid);

        // Verificar si se encontraron resultados
        if ($row = oci_fetch_assoc($stid)) {
            // Redirigir al paciente a la página de ver citas
            header("Location: elegir-citas.php?id_paciente=" . $row['ID_PACIENTE']);
            exit();
        } else {
            // Mostrar un mensaje de error si las credenciales son incorrectas
            echo "<p>Las credenciales de inicio de sesión son incorrectas. Por favor, inténtalo de nuevo.</p>";
        }
    }
?>
    <header>   
        <nav>
            <div id="logo">HospiHub</div>
        </nav>
    </header>

    <div id="contenedor">
        <h1>Iniciar sesión como paciente<span class="material-symbols-outlined">
            personal_injury</span>
        </h1>
    
        <form action="#" method="post" id="formulario">
            <label for="email">Email</label><br>
            <input type="text" id="email" name="email" required>
    
            <br><br>
    
            <label for="pin">Pin</label><br>
            <input type="number" id="pin" name="pin" required>
           
            <br><br>
            
            <button type="submit">Entrar</button>
    
        </form>
        <br>
        <br>
    </div>
	
</body>
</html>
