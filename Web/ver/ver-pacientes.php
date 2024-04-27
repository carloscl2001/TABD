<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HospiHub - Lista de pacientes</title>
    <link rel="stylesheet" href="../css/ver.css" type="text/css">
</head>
<body>
    <header>   
        <nav>
            <div id="logo">HospiHub</div>
        </nav>
    </header>
    
    <h1>Lista de Pacientes del Sistema</h1>

    <?php

        // Conecta al servicio XE (esto es, una base de datos) en el servidor "localhost"
        include('../conexion.php');
        $conexion = conexion();


        $stid = oci_parse($conexion, 'SELECT 
                p.Id_paciente,
                p.Nombre,
                p.Apellidos,
                p.Telefono,
                p.Fecha_nacimiento,
                p.Direccion.Ciudad AS Ciudad,
                p.Direccion.Calle AS Calle,
                p.Email,
                p.PIN
                FROM 
                Tabla_Paciente p
                ORDER BY p.Id_paciente ASC

        ');
        oci_execute($stid);
            echo "<table class='table table-striped'>\n";
            echo "<thead>";
            echo "<tr>";
            echo "<th>Id Paciente</th>";
            echo "<th>Nombre</th>";
            echo "<th>Apellidos</th>";
            echo "<th>Telefono</th>";
            echo "<th>Fecha de nacimiento</th>";
            echo "<th>Ciudad</th>";
            echo "<th>Calle</th>";
            echo "<th>Email</th>";
            echo "<th>PIN</th>";
            echo "</tr>";
            echo "</thead>";
        while ($row = oci_fetch_array($stid, OCI_ASSOC+OCI_RETURN_NULLS)) {
            echo "<tr>\n";
        foreach ($row as $item) {
            echo "    <td>" . ($item !== null ? htmlentities($item, ENT_QUOTES) : "") . "</td>\n";
            }
            echo "</tr>\n";
            }
        echo "</table>\n";
    ?>

    <a href="menu-admin.html">Regresar al menu principal</a> <br>

</body>
</html>