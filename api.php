<?php
header('Content-Type: application/json');
// Conecta a tu base "estaciones"
$conn = new mysqli("127.0.0.1", "root", "", "estaciones");

if ($conn->connect_error) {
    die(json_encode(["error" => "Error de conexión"]));
}

$query = "SELECT e.nombre AS Estacion, s.nombre AS Sensor, m.valor AS Valor, m.fecha AS Fecha, m.hora AS Hora 
          FROM medicion m
          JOIN estacion_sensor es ON m.esstacion_sensor_id = es.id
          JOIN estaciones e ON es.estacion_id = e.id_estacion
          JOIN sensores s ON es.sensor_id = s.id";

$result = $conn->query($query);
$datos = array();
while($row = $result->fetch_assoc()) {
    $datos[] = $row;
}

echo json_encode($datos);
$conn->close();
?>