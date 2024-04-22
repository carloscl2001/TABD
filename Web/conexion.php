<?php
// FUNCION QUE CONECTA A LA BASE DE DATOS
function conexion() {

    $usuario = 'prueba';
    $contrasenna = 'prueba';
    $servidor_baseDeDatos = '//localhost:1521/XEPDB1';

    //$usuario = 'System';
    //$contrasenna = 'MiCarmen';
    //$servidor_baseDeDatos = '//localhost:1521/XE';

    // $usuario = /*INTRODUZCA AQUI SU USUARIO*/;
    // $contrasenna = /*INTRODUZCA AQUI SU CONTRASEÑA*/;
    // $servidor_baseDeDatos = /*INTRODUZCA AQUI SU SERVIDOR DE BASE DE DATOS*/;
    
    $conn = oci_connect($usuario, $contrasenna, $servidor_baseDeDatos);
    if (!$conn) {
        $e = oci_error();
        trigger_error(htmlentities($e['Error de conexión'], ENT_QUOTES), E_USER_ERROR);
    }
    return $conn;
}
?>