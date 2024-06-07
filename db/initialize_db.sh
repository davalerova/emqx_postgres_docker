#!/bin/bash
set -e

# Crear la base de datos emqx si no existe
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
  SELECT 'CREATE DATABASE emqx' 
  WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'emqx')\gexec
EOSQL

# Ejecutar el script de inicialización
# psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname emqx < /docker-entrypoint-initdb.d/init_db.sql
