<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HospiHub - Lista de médicos</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="stylesheet" href="../css/ver.css" type="text/css">
</head>
<body>

    <header>   
        <nav>
            <div id="logo">HospiHub</div>
        </nav>
    </header>

    <br><br><br><br>
    
    <h1>Lista de Medicos del Sistema</h1>

<?php

    // Conecta al servicio XE (esto es, una base de datos) en el servidor "localhost"
    include('../conexion.php');
    $conexion = conexion();

    $stid = oci_parse($conexion, 'SELECT 
        m.Id_medico,
        m.Nombre,
        m.Apellidos,
        m.Telefono,
        m.Fecha_nacimiento,
        m.Direccion.Ciudad AS Ciudad,
        m.Direccion.Calle AS Calle,
        m.Email,
        m.PIN,
        d.Id_departamento,
        d.Nombre AS Nombre_departamento,
        h.Id_hospital,
        h.Nombre AS Nombre_hospital
    FROM 
        Tabla_Medico m
        JOIN Tabla_Departamento d ON m.Id_departamento = d.Id_departamento
        JOIN Tabla_Hospital h ON d.Id_hospital = h.Id_hospital');

    oci_execute($stid);

    echo "<table class='table table-striped'>\n";
    echo "<thead>";
    echo "<tr>";
    echo "<th>Id del Médico</th>";
    echo "<th>Nombre</th>";
    echo "<th>Apellidos</th>";
    echo "<th>Telefono</th>";
    echo "<th>Fecha de nacimiento</th>";
    echo "<th>Ciudad</th>";
    echo "<th>Calle</th>";
    echo "<th>Email</th>";
    echo "<th>PIN</th>";
    echo "<th>Id Hospital</th>";
    echo "<th>Nombre Departamento</th>";
    echo "<th>Id Departamento</th>";
    echo "<th>Nombre del Hospital</th>";
    echo "</tr>";
    echo "</thead>";

    while ($row = oci_fetch_array($stid, OCI_ASSOC+OCI_RETURN_NULLS)) {
        echo "<tr>\n";
        foreach ($row as $item) {
            echo "<td>" . ($item !== null ? htmlentities($item, ENT_QUOTES) : "") . "</td>\n";
        }
        echo "</tr>\n";
    }

    echo "</table>\n";
?>

<a href="../menu-admin.php">Regresar al menú del administrador <span class="material-symbols-outlined">
            arrow_left_alt
            </span></a> <br>

</body>
</html>