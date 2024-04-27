<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cliente - TABank</title>
    <link rel="stylesheet" href="../css/main_usu.css" type="text/css">
</head>
<body>
    <h1>Movimientos - TABank</h1>

    <?php

        // Conecta al servicio XE (esto es, una base de datos) en el servidor "localhost"
        include('conexion.php');
        $conexion = conexion();


        $stid = oci_parse($conexion, 'SELECT Nombre, Apellidos, Telefono, Fecha_nacimiento, Email, Pin FROM Tabla_Paciente ORDER BY Id_paciente');
        oci_bind_by_name($stid, ':id_cliente', $id_cliente);
        oci_execute($stid);
            echo "<table class='table table-striped'>\n";
            echo "<thead>";
            echo "<tr>";
            echo "<th>Nombre</th>";
            echo "<th>Apellidos</th>";
            echo "<th>Cantidad</th>";
            echo "<th>Fecha</th>";
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

    <a href="main_usu.php">Regresar al menu principal</a> <br>

</body>
</html>