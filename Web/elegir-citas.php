<!DOCTYPE html>
<html>
<head>
    <title>HospiHub - Elegir Citas</title>
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
    <!-- Enlace al archivo JavaScript hola jefe -->
    
</head>
<body>

    <header>   
        <nav>
            <div id="logo">HospiHub</div>
        </nav>
    </header>

    <div id="contenedor">
        <h1>Elegir Citas</h1>
    
        <!-- Formulario para elegir citas -->
        <form action="procesar_citas.php" method="post" id="formulario">
            <label for="departamento">Departamento:</label><br>
            <select id="departamento" name="departamento" required>
                <?php
                    // Incluir archivo de conexión
                    include('../conexion.php');
                    $conexion = conexion();
                    
                    // Consulta SQL para obtener los nombres de los departamentos
                    $sql = "SELECT Id_departamento, Nombre FROM Tabla_Departamento";
                    $stid = oci_parse($conexion, $sql);
                    oci_execute($stid);
                    
                    // Iterar sobre los resultados y mostrar opciones en el formulario
                    while ($row = oci_fetch_assoc($stid)) {
                        echo "<option value=\"" . $row['Id_departamento'] . "\">" . $row['Nombre'] . "</option>";
                    }
                ?>
            </select>
            <br><br>
            <label for="fecha_inicio">Fecha de inicio:</label><br>
            <input type="date" id="fecha_inicio" name="fecha_inicio" required>
            <br><br>
            <label for="fecha_fin">Fecha de fin:</label><br>
            <input type="date" id="fecha_fin" name="fecha_fin" required>
            <br><br>
            <button type="submit">Buscar Citas</button>
        </form>
    
        <!-- Aquí se mostrarán las citas disponibles -->
        <div id="citas_disponibles">
            <?php include 'procesar_citas.php'; ?>
        </div>
    </div>
	
</body>
</html>
