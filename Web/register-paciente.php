<!DOCTYPE html>
<html>
<head>
	<title>FitnessZone</title>
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
    <link rel="stylesheet" href="css/register-paciente.css">
    <!-- Enlace al archivo JavaScript -->
    
</head>
<body>

    <?php
        // Conecta al servicio XE (esto es, una base de datos) en el servidor "localhost"
        $conn = oci_pconnect('system', 'system', 'localhost');
        if (!$conn) {
            $e = oci_error();
            trigger_error(htmlentities($e['message'], ENT_QUOTES), E_USER_ERROR);
        }

        session_start();
        $id_empleado = $_SESSION['id'];

        if($_SERVER["REQUEST_METHOD"] == "POST"){
            $nombre = $_POST["nombre"];
            $apellido = $_POST["apellido"];
            $telefono = $_POST["telefono"];
            $fecha = $_POST["fecha"];
            $ciudad = $_POST["ciudad"];
            $calle = $_POST["calle"];
            $email = $_POST["email"];
            $pin = $_POST["pin"];


            $sql = "BEGIN Insertar_Paciente(:nombre, :apellido, :telefono,  :fecha, :ciudad, :calle, :email, :pin); END;";
            $stid = oci_parse($conn, $sql);
            oci_bind_by_name($stid, ':nombre', $nombre);
            oci_bind_by_name($stid, ':apellido', $apellido);
            oci_bind_by_name($stid, ':telefono', $telefono);
            oci_bind_by_name($stid, ':fecha', $fecha);
            oci_bind_by_name($stid, ':ciudad', $ciudad);
            oci_bind_by_name($stid, ':calle', $calle);
            oci_bind_by_name($stid, ':email', $email);
            oci_bind_by_name($stid, ':pin', $pin);
            oci_execute($stid);

            header("location: main_empleado.php");
        }
    ?>


    <header>   
        <nav>
            <div id="logo">HospiHub</div>
        </nav>
    </header>

    <div id="contenedor">
        <h1>Registro de paciente<span class="material-symbols-outlined">
            personal_injury</span>
        </h1>
    
        <form action="#" method="post" id="formulario">
            <label for="nombre">Nombre</label><br>
            <input type="text" id="nombre" name="nombre" required>
    
            <br><br>
    
            <label for="apellido">Apellidos</label><br>
            <input type="text" id="apellido" name="apellido" required>
    
            <br><br>
    
            <label for="telefono">Teléfono</label><br>
            <input type="number" id="telefono" name="telefono" required>
    
            <br><br>
    
            <label for="fecha">Fecha de nacimiento</label><br>
            <input type="date" id="fecha" name="fecha" required>
                    
            <br><br>
            
            <label for="ciudad">Ciudad</label><br>
            <input type="text" id="ciudad" name="ciudad" required>
            
            <br><br>
            
            <label for="calle">Calle</label><br>
            <input type="text" id="calle" name="calle" required>
            
            <br><br>
    
            <label for="email">Email</label><br>
            <input type="text" id="email" name="email" required>
    
            <br><br>
    
            <label for="pin">Pin</label><br>
            <input type="number" id="pin" name="pin" required>
           
            <br><br>
            
            <button type="submit">Enviar</button>
    
        </form>
        <br>
        <br>
    </div>
	
</body>
</html>