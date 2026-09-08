#!/bin/bash
HOST="127.0.0.1"
PUERTO="3306"
USUARIO="root"
CLAVE="clave123"
BASEDATOS="proyecto"
TABLA="logs"

cargar_registro() {
    read -p "Usuario: " usuario
    read -p "Acción realizada: " accion

    mysql -h "$HOST" -P "$PUERTO" -u "$USUARIO" -p"$CLAVE" "$BASEDATOS" \
        -e "INSERT INTO $TABLA (usuario, accion) VALUES ('$usuario', '$accion');"

    echo "Registro cargado: $usuario - $accion"
}

mostrar_menu() {
    echo ""
    echo "===== Carga de registros en MySQL (contenedor db_logs) ====="
    echo "1) Cargar un registro"
    echo "2) Salir"
    read -p "Opción: " opcion

    case $opcion in
        1) cargar_registro ;;
        2) exit 0 ;;
        *) echo "Opción inválida" ;;
    esac
}

while true; do
    mostrar_menu
done
