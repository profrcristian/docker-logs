# Visualizador de Logs con Docker Compose

![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)
![PHP](https://img.shields.io/badge/PHP-777BB4?style=for-the-badge&logo=php&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)

Sistema web ligero desarrollado con **Docker Compose** para la consulta de registros del sistema (`logs`). La arquitectura consta de dos contenedores interconectados en una red interna (`red_logs`).

---

## Arquitectura

| Servicio | Tecnología | Puerto (Host:Contenedor) | Descripción |
| :--- | :--- | :--- | :--- |
| **`web`** | PHP + Apache | `8080:80` | Interfaz web que consulta y muestra los registros. |
| **`db`** | MySQL 5.7 | - | Base de datos `proyecto` inicializada con `init.sql`. |

---

## Inicio Rápido

1. Clonar el repositorio y posicionarse en la carpeta raíz.
2. Ejecutar el entorno:
   docker compose up -d --build
3. Abrir en el navegador:
http://localhost:8080

## Configuración en Entorno VirtualBox / Red CEIBAL
Si ejecutas el proyecto en una Máquina Virtual dentro de la red CEIBAL y no puedes acceder mediante la IP en el navegador, realiza la siguiente configuración:

1. Reenvío de Puertos en VirtualBox
- Ve a Propiedades/Configuración de la máquina virtual -> Red.
<img width="747" height="397" alt="virtualbox-1" src="https://github.com/user-attachments/assets/95e65da9-db0e-4f78-8c7f-ef51bd44cb7a" />

- Abre la sección Reenvío de puertos y añade la regla:

Puerto Host: 8080

Puerto Invitado: 8080

IP Invitado: La IP fija configurada en netplan (ej. 10.0.2.50).

<img width="747" height="140" alt="virtualbox-2" src="https://github.com/user-attachments/assets/7dee07bd-6a45-4aa0-a650-976f6b80a8d0" />

2. Configuración de IP Fija
Identifica el gateway de la red ejecutando:
- ip route show
Configura tu archivo de Netplan e ingresa el gateway/router correspondiente.

Aplica los cambios:
- sudo netplan apply

<img width="510" height="357" alt="virtualbox-3" src="https://github.com/user-attachments/assets/b5d39dae-78da-414c-ab6f-4919f25c3e33" />

3. Acceso Web
Accede a la aplicación desde tu equipo anfitrión en:
http://localhost:8080
http://127.0.0.1:8080

# Comandos Útiles
Iniciar contenedores ya creados:
- docker compose start db web

Reconstruir y levantar contenedores:
- docker compose up -d --build

Detener servicios:
- docker compose down
- docker compose down -v
