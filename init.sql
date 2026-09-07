CREATE TABLE IF NOT EXISTS logs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario VARCHAR(50),
    accion VARCHAR(255),
    fecha DATETIME DEFAULT CURRENT_TIMESTAMP
);
 
INSERT INTO logs (usuario, accion) VALUES ('root', 'Inicio de sesion SSH');
INSERT INTO logs (usuario, accion) VALUES ('asistente1', 'Modifico el archivo de configuracion');
