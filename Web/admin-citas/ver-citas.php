<!DOCTYPE html>
<html>
<head>
    <title>HospiHub - Tus Citas</title>
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
    <link rel="stylesheet" href="../css/ver.css">
</head>
<body>

<nav>
    <div id="logo">HospiHub</div>
</nav>

<div id="contenedor">
    <h1>Tus Citas</h1>

    <?php

    // Conecta al servicio XE (esto es, una base de datos) en el servidor "localhost"
    include('../conexion.php');
    $conexion = conexion();



    $stid = oci_parse($conexion, 
        'SELECT 
            c.Id_Cita, c.Fecha, TO_CHAR(c.Hora, \'HH24:MI:SS\') AS Hora_Cita, c.Id_Medico, c.Id_Paciente, c.Estado
        FROM 
            Tabla_Cita c
            JOIN Tabla_Paciente p ON c.Id_paciente = p.Id_paciente
            JOIN Tabla_Medico m ON c.Id_medico = m.Id_medico
         ');
    
    oci_execute($stid);


    echo "<table class='table table-striped'>\n";
    echo "<thead>";
    echo "<tr>";
    echo "<th>Id de la cita</th>";
    echo "<th>Fecha de la cita</th>";
    echo "<th>Hora de la cita</th>";
    echo "<th>Id del Médico</th>";
    echo "<th>Id del Paciente</th>";
    echo "<th>Estado de la Cita</th>";
    echo "</tr>";
    echo "</thead>";
    while ($row = oci_fetch_array($stid, OCI_ASSOC+OCI_RETURN_NULLS)) {
        echo "<tr>\n";
        foreach ($row as $item) {
            echo "    <td>" . ($item !== null ? htmlentities($item, ENT_QUOTES) : "") . "</td>\n";
        }
        // Añadido un botón para ver detalles solo si el estado es "Diagnóstico completo"
        if ($row['ESTADO'] === 'Diagnostico Completo') {
            echo "<td><a href='ver-detalles-cita.php?id_cita=" . $row['ID_CITA'] . "'>Ver detalles</a></td>";
        } else {
            echo "<td></td>";
        }
        echo "</tr>\n";
    }
    echo "</table>\n";
    ?>

</div>

<a href="../menu-paciente.php" id="volver">Volver al menú de paciente <span class="material-symbols-outlined">
    home
    </span>
</a>
</body>
</html>
