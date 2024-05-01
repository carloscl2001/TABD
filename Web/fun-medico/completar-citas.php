<?php
// Conecta al servicio XE (esto es, una base de datos) en el servidor "localhost"
include('../conexion.php');
$conexion = conexion();

session_start();

$medico_id = $_SESSION['medico_id'];
$email = $_SESSION['email'];

// Mostrar el nombre del médico
echo "<h2>Medico: $medico_id</h2>";

// Consulta SQL para obtener las citas con estado 'Paciente Asignado' para el médico actual
$sql = "SELECT 
            c.Id_Cita, 
            c.Fecha, 
            TO_CHAR(c.Hora, 'HH24:MI:SS') AS Hora_Cita, 
            c.Id_Medico
        FROM 
            Tabla_Cita c
            JOIN Tabla_Medico m ON c.Id_medico = m.Id_medico
            JOIN Tabla_Departamento d ON m.Id_departamento = d.Id_departamento
            JOIN Tabla_Hospital h ON d.Id_hospital = h.Id_hospital
        WHERE
            c.Id_Medico = :medico_id
            AND c.Estado = 'Paciente Asignado'";

// Preparar la consulta
$stid = oci_parse($conexion, $sql);

// Bind de los parámetros
oci_bind_by_name($stid, ":medico_id", $medico_id);

// Ejecutar la consulta
oci_execute($stid);

// Mostrar las citas en una tabla
echo "<table class='table table-striped'>\n";
echo "<thead>";
echo "<tr>";
echo "<th>Id de la cita</th>";
echo "<th>Fecha de la cita</th>";
echo "<th>Hora de la cita</th>";
echo "<th>Id del Medico</th>";
echo "<th>Insertar Diagnóstico</th>"; // Agregar una columna para el botón "Insertar Diagnóstico"
echo "</tr>";
echo "</thead>";
while ($row = oci_fetch_array($stid, OCI_ASSOC+OCI_RETURN_NULLS)) {
    echo "<tr>\n";
    foreach ($row as $item) {
        echo "    <td>" . ($item !== null ? htmlentities($item, ENT_QUOTES) : "") . "</td>\n";
    }
    // Agregar el botón "Añadir" en cada fila de la tabla
    echo "<td>";
    echo "<button type='button' onclick='mostrarFormulario(\"" . $row['ID_CITA'] . "\")'>Añadir</button>"; // Botón "Añadir"
    echo "</td>";
    echo "</tr>\n";
}
echo "</table>\n";
?>

<!-- Script para mostrar el formulario emergente -->
<script>
var numMedicamentos = 1; // Contador de medicamentos

function mostrarFormulario(idCita) {
    // Mostrar el formulario emergente
    var formulario = document.createElement("form");
    formulario.setAttribute("id", "formularioDiagnostico");
    formulario.innerHTML = `
    <label for="descripcion">Descripción:</label><br>
    <input type="text" id="descripcion" name="descripcion"><br>
    <label for="recomendacion">Recomendación:</label><br>
    <input type="text" id="recomendacion" name="recomendacion"><br>
    <div id="medicamentos"></div>
    <button type="button" onclick="agregarMedicamento()">Añadir Medicamento</button><br><br>
    <input type="hidden" name="cita_id" value="${idCita}">
    <input type="button" value="Insertar Diagnóstico" onclick="enviarFormulario()">
    `;
    document.body.appendChild(formulario);
}

// Función para agregar un medicamento
function agregarMedicamento() {
    var divMedicamentos = document.getElementById("medicamentos");
    var nuevoMedicamento = document.createElement("div");
    nuevoMedicamento.innerHTML = `
    <label for="nombre_medicamento${numMedicamentos}">Nombre del Medicamento:</label><br>
    <input type="text" id="nombre_medicamento${numMedicamentos}" name="nombre_medicamento[]"><br>
    <label for="frecuencia${numMedicamentos}">Frecuencia del Medicamento:</label><br>
    <input type="text" id="frecuencia${numMedicamentos}" name="frecuencia[]"><br><br>
    `;
    divMedicamentos.appendChild(nuevoMedicamento);
    numMedicamentos++;
}

// Función para enviar el formulario
function enviarFormulario() {
    var formulario = document.getElementById("formularioDiagnostico");
    formulario.setAttribute("action", "insertar-diagnostico.php");
    formulario.setAttribute("method", "post");
    formulario.submit();
}
</script>
