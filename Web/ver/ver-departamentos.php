<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HospiHub - Lista de departamentos</title>
    <link rel="stylesheet" href="../css/ver.css" type="text/css">
</head>
<body>
    <header>   
        <nav>
            <div id="logo">HospiHub</div>
        </nav>
    </header>
    
    <h1>Lista de Departamentos del Sistema</h1>

    <?php

        // Conecta al servicio XE (esto es, una base de datos) en el servidor "localhost"
        include('../conexion.php');
        $conexion = conexion();


        $stid = oci_parse($conexion, 'SELECT 
                    d.Id_departamento,
                    d.Nombre AS Nombre_departamento,
                    d.Ubicacion AS Ubicacion_departamento,
                    h.Id_hospital,
                    h.Nombre AS Nombre_hospital,
                    h.Direccion.Ciudad AS Ciudad_hospital,
                    h.Direccion.Calle AS Calle_hospital
                FROM 
                    Tabla_Departamento d
                    JOIN Tabla_Hospital h ON d.Id_hospital = h.Id_hospital
        ');
        oci_execute($stid);
            echo "<table class='table table-striped'>\n";
            echo "<thead>";
            echo "<tr>";
            echo "<th>Id Departamento</th>";
            echo "<th>Nombre Departamento</th>";
            echo "<th>Ubicacion Departamento</th>";
            echo "<th>Id Hospital</th>";
            echo "<th>Nombre Hospital</th>";
            echo "<th>Ciudad Hospital</th>";
            echo "<th>Calle Hospital</th>";
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