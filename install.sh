#!/usr/bin/env bash
set -e

REPO_USER="BLACK-JAGUAR-1"
REPO_NAME="agentes-ias"
PLATFORM="antigravity"
AGENT=""
PACKAGE=""

while [[ "$#" -gt 0 ]]; do
  case $1 in
    --agent|-a) AGENT="$2"; shift ;;
    --package|-p) PACKAGE="$2"; shift ;;
    --platform|--target) PLATFORM="$2"; shift ;;
    *) if [ -z "$AGENT" ]; then AGENT="$1"; fi ;;
  esac
  shift
done

if [ -z "$AGENT" ] && [ -z "$PACKAGE" ]; then
  echo "[ERROR] Debe especificar un agente (--agent <nombre>) o paquete (--package <nombre>)."
  echo "Uso:"
  echo "  ./install.sh --agent code-reviewer --platform kiro"
  echo "  ./install.sh --package backend --platform claude"
  exit 1
fi

case "$(echo "$PLATFORM" | tr '[:upper:]' '[:lower:]')" in
  kiro) TARGET_DIR=".kiro/agents" ;;
  claude) TARGET_DIR=".claude/agents" ;;
  codex) TARGET_DIR=".codex/agents" ;;
  antigravity) TARGET_DIR=".antigravity/agents" ;;
  *) TARGET_DIR=".ai/agents" ;;
esac

mkdir -p "$TARGET_DIR"

declare -A REGISTRY=(
  ["code-reviewer"]="development/code-reviewer.md"
  ["test-automator"]="qa-automation/test-automator.md"
  ["load-testing-specialist"]="qa-automation/load-testing-specialist.md"
  ["test-engineer"]="qa-automation/test-engineer.md"
  ["debugger"]="qa-automation/debugger.md"
  ["performance-engineer"]="performance/performance-engineer.md"
  ["performance-profiler"]="performance/performance-profiler.md"
  ["frontend-performance-optimizer"]="performance/frontend-performance-optimizer.md"
  ["backend-architect"]="backend/backend-architect.md"
  ["backend-developer"]="backend/backend-developer.md"
  ["api-documenter"]="backend/api-documenter.md"
  ["database-architect"]="database/database-architect.md"
  ["sql-pro"]="database/sql-pro.md"
  ["database-admin"]="database/database-admin.md"
)

BASE_URL="https://raw.githubusercontent.com/$REPO_USER/$REPO_NAME/main/packages"

echo "[INFO] Plataforma destino: [$PLATFORM] -> $TARGET_DIR"

if [ -n "$AGENT" ]; then
  REL_PATH="${REGISTRY[$AGENT]}"
  if [ -z "$REL_PATH" ]; then
    echo "[ERROR] El agente '$AGENT' no existe en el catalogo."
    exit 1
  fi
  DEST="$TARGET_DIR/$AGENT.md"
  echo "[INFO] Descargando $AGENT..."
  curl -fsSL "$BASE_URL/$REL_PATH" -o "$DEST"
  echo "[OK] Agente '$AGENT' instalado en $DEST"
elif [ -n "$PACKAGE" ]; then
  echo "[INFO] Instalando paquete '$PACKAGE'..."
  COUNT=0
  for KEY in "${!REGISTRY[@]}"; do
    REL_PATH="${REGISTRY[$KEY]}"
    if [[ "$REL_PATH" == "$PACKAGE/"* ]]; then
      DEST="$TARGET_DIR/$KEY.md"
      curl -fsSL "$BASE_URL/$REL_PATH" -o "$DEST"
      echo "  [OK] $KEY instalado en $DEST"
      COUNT=$((COUNT + 1))
    fi
  done
  if [ "$COUNT" -eq 0 ]; then
    echo "[ERROR] El paquete '$PACKAGE' no existe o esta vacio."
    exit 1
  fi
  echo "[OK] Paquete '$PACKAGE' completado."
fi