<?php
$host = "db";
$user = "root";
$pass = "clave123";
$db   = "proyecto";
 
$conexion = new mysqli($host, $user, $pass, $db);
 
if ($conexion->connect_error) {
    die("Error de conexión: " . $conexion->connect_error);
}
 
$resultado = $conexion->query("SELECT id, usuario, accion, fecha FROM logs ORDER BY fecha DESC");
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Registro de logs</title>
    <style>
        table { border-collapse: collapse; width: 100%; }
        th, td { border: 1px solid #999; padding: 8px 12px; text-align: left; }
        th { background-color: #222; color: #fff; }
    </style>
</head>
<body>
    <table>
        <tr><th>ID</th><th>Usuario</th><th>Acción</th><th>Fecha</th></tr>
        <?php while ($fila = $resultado->fetch_assoc()): ?>
        <tr>
            <td><?= $fila['id'] ?></td>
            <td><?= htmlspecialchars($fila['usuario']) ?></td>
            <td><?= htmlspecialchars($fila['accion']) ?></td>
            <td><?= $fila['fecha'] ?></td>
        </tr>
        <?php endwhile; ?>
    </table>
</body>
</html>
