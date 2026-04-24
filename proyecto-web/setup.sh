#!/usr/bin/env bash
# ═══════════════════════════════════════════════════════════════
#  setup.sh  —  Carga el contenido web en el volumen compartido
#  Ejecutar UNA VEZ antes (o después) de `docker compose up -d`
# ═══════════════════════════════════════════════════════════════
set -euo pipefail

COMPOSE_FILE="$(dirname "$0")/docker-compose.yml"
CONTENT_DIR="$(dirname "$0")/webcontent"

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo " Iniciando infraestructura Docker…"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

# 1. Levantar los servicios
docker compose -f "$COMPOSE_FILE" up -d

echo ""
echo "⏳  Esperando a que los contenedores estén listos…"
sleep 4

# 2. Copiar el contenido web al volumen compartido
#    Usamos el contenedor web1 como puente para escribir en el volumen
echo "📁  Copiando contenido web al volumen compartido…"
docker cp "$CONTENT_DIR/index.html" backend-1:/usr/local/apache2/htdocs/index.html

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo " ✅  Infraestructura lista"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "  🌐  Acceso:  http://localhost"
echo ""
echo "  Para verificar el balanceo de carga:"
echo "  curl -s -I http://localhost | grep X-Backend"
echo ""
echo "  Estado del proxy:"
echo "  curl -s http://localhost/nginx-status"
echo ""
echo "  Para detener todo:"
echo "  docker compose down"
echo ""
