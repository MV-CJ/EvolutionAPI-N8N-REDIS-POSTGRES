#!/bin/bash
set -e

# Cria os volumes caso não existam
echo "Criando volumes do Docker..."
docker volume create evolution_store || true
docker volume create evolution_instances || true
docker volume create postgres_data || true
docker volume create redis_data || true

# Verifica se a pasta já existe
if [ ! -d "evolution-api" ]; then
    echo "Clonando repositório evolution-api..."
    git clone https://github.com/EvolutionAPI/evolution-api
else
    echo "Pasta evolution-api já existe. Pulando clone."
fi

cd evolution-api

# Garantir que estamos na branch main e atualizar
git checkout main
git pull origin main

# Build da imagem
docker build -t evolution-api:2.3.7 .

cd ..

# Subir os containers
docker compose up -d

# Espera PostgreSQL ficar saudável
echo "Aguardando PostgreSQL..."
until docker exec evolution_postgres pg_isready -U evolution -d evolution; do
    sleep 2
done
echo "PostgreSQL pronto!"

# Cria o banco do n8n se não existir
# echo "Criando banco n8n_db se necessário..."
# docker exec -i evolution_postgres psql -U evolution -tc "SELECT 1 FROM pg_database WHERE datname = 'n8n_db'" | grep -q 1 || \
# docker exec -i evolution_postgres psql -U evolution -c "CREATE DATABASE n8n_db;"

echo "Build finalizado, Database, N8N e EvolutionApi prontos!"
