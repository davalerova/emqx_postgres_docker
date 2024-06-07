# EMQX CON DOCKER

## Crear nuestro servicio de mqtt desde docker compose.

### Instalar los servicios.

1- Instalar docker en Ubuntu, página oficial de Docker
```
https://docs.docker.com/engine/install/ubuntu/#install-from-a-package
```
2- Instalar docker-compose en Ubuntu
```
sudo curl -L "https://github.com/docker/compose/releases/download/1.28.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
```
```
sudo chmod +x /usr/local/bin/docker-compose
```
Verificar instalación de Docker y docker-compose
```
sudo docker --version
```
```
sudo docker compose --version
```
3- Clonar el repositorio
```
sudo git clone https://github.com/davalerova/emqx_postgres_docker.git
```
4- Entrar a la carpeta descargada
```
cd emqx-docker
```
5- Crear el archivo _.env_
```
sudo nano .env
```
6- Definir las variables de entorno en el archivo _.env_
```
# Postgres
POSTGRES_SERVER=db
POSTGRES_PORT=5432
POSTGRES_DB=emqxdb
POSTGRES_USER=emqx
POSTGRES_PASSWORD=emqxpass
# EMQX
EMQX_NAME=broker-host-iot
EMQX_DASHBOARD_DEFAULT_USER_PASSWORD=emqxpass 
EMQX_NODE_COOKIE=mycookiefileemqxyhp
EMQX_AUTH_PGSQL_SERVER=postgres_host:5432
EMQX_ALLOW_ANONYMOUS=false
TZ=America/Bogota

```
7- Ejecutar el comando para correr el servicio
```
sudo docker-compose up -d
```