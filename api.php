<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');

$conn = new mysqli("127.0.0.1", "root", "", "estaciones");

if ($conn->connect_error) {
    die(json_encode(["error" => "Error de conexión: " . $conn->connect_error]));
}

$query = "SELECT 
            e.nombre     AS Estacion,
            s.nombre     AS Sensor,
            u.nombre     AS Unidad,
            m.valor      AS Valor,
            m.fecha      AS Fecha,
            m.hora       AS Hora
          FROM medicion m
          JOIN estacion_sensor es ON m.esstacion_sensor_id = es.id
          JOIN estaciones e       ON es.estacion_id = e.id_estacion
          JOIN sensores s         ON es.sensor_id   = s.id
          LEFT JOIN unidad u      ON s.unidad_id    = u.id
          ORDER BY m.fecha ASC, m.hora ASC";

$result = $conn->query($query);

if (!$result) {
    die(json_encode(["error" => "Error en la consulta: " . $conn->error]));
}

$datos = [];
while ($row = $result->fetch_assoc()) {
    $datos[] = $row;
}

echo json_encode($datos);
$conn->close();
?>