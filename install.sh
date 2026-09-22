#!/usr/bin/env bash
set -e

AGENT="$1"
REPO_USER="${2:-BLACK-JAGUAR-1}"

if [ -z "$AGENT" ]; then
  echo "[ERROR] Uso: ./install.sh <nombre-del-agente> [usuario-github]"
  exit 1
fi

TARGET_DIR=".antigravity/agents"
mkdir -p "$TARGET_DIR"

URL="https://raw.githubusercontent.com/$REPO_USER/antigravity-agents/main/agents/$AGENT.md"
DESTINATION="$TARGET_DIR/$AGENT.md"

if curl -fsSL "$URL" -o "$DESTINATION"; then
  echo "[OK] Subagente '$AGENT' instalado en $DESTINATION"
else
  echo "[ERROR] Fallo al descargar el subagente '$AGENT'. Verifique el nombre del archivo o la conexion."
  exit 1
fi