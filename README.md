# Antigravity Agents Repository

Colección de subagentes especializados y optimizados para Google Antigravity y Gemini Flash.

## Catálogo de Agentes Disponibles

| Agente | Archivo | Modelo | Función |
| :--- | :--- | :--- | :--- |
| **Code Reviewer** | `code-reviewer.md` | `gemini-3.8-flash` | Auditoría de código, detección de vulnerabilidades, análisis de rendimiento y diffs. |

## Requisitos Previos

Tener instalado Node.js (versión 18 o superior) y el gestor de paquetes pnpm (o npm/npx) en el sistema operativo.

## Instrucciones de Instalación en Proyectos

Para instalar cualquier subagente en un proyecto local, abra una terminal en la raíz del proyecto destino y ejecute el comando correspondiente:

### Con pnpm (Recomendado)

```bash
pnpm dlx @black-jaguar-1/antigravity-agents --agent code-reviewer
```

### Alternativa con npx

```bash
npx @black-jaguar-1/antigravity-agents --agent code-reviewer
```

### Resultado de la instalación

El script creará automáticamente la estructura de directorios requerida por el entorno y descargará el manifiesto en:

```text
.antigravity/agents/code-reviewer.md
```

Una vez instalado, Google Antigravity cargará automáticamente las directrices del subagente dentro del contexto de trabajo del proyecto.