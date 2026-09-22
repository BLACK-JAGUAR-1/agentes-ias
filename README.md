# Antigravity Agents Repository

Colección de subagentes especializados y optimizados para Google Antigravity y Gemini Flash.

## Catálogo de Agentes Disponibles

| Agente | Archivo | Modelo | Función |
| :--- | :--- | :--- | :--- |
| **Code Reviewer** | `code-reviewer.md` | `gemini-3.8-flash` | Auditoría de código, detección de vulnerabilidades, análisis de rendimiento y diffs. |

## Instrucciones de Instalación en Proyectos

Para instalar un subagente dentro de un proyecto, abra una terminal en la raíz del proyecto correspondiente y ejecute el comando según el sistema operativo:

### Windows (PowerShell)
```powershell
& ([scriptblock]::Create((Invoke-RestMethod -Uri "[https://raw.githubusercontent.com/BLACK-JAGUAR-1/antigravity-agents/main/install.ps1](https://raw.githubusercontent.com/BLACK-JAGUAR-1/antigravity-agents/main/install.ps1)"))) -Agent "code-reviewer"
```

### Linux / macOS (Bash)
```bash
curl -fsSL [https://raw.githubusercontent.com/BLACK-JAGUAR-1/antigravity-agents/main/install.sh](https://raw.githubusercontent.com/BLACK-JAGUAR-1/antigravity-agents/main/install.sh) | bash -s code-reviewer
```