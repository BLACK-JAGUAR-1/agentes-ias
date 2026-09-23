# Agentes IAs

Coleccion modular de subagentes de IA especializados en ingenieria de software, disenados para operar de forma agnostica sobre multiples entornos de desarrollo: **Kiro**, **Antigravity**, **Claude** y **Codex**.

El repositorio distribuye los agentes mediante ejecucion directa con **pnpm dlx** o scripts de consola para Windows, Linux y macOS.

---

## 1. Catalogo de Subagentes Disponibles

### Desarrollo (`packages/development/`)
| Agente | Archivo | Ambito de aplicacion |
| :--- | :--- | :--- |
| **Code Reviewer** | `code-reviewer.md` | Auditoria estatica de codigo, control de calidad, deteccion de vulnerabilidades y analisis de diffs. |

### Calidad y Automatizacion (`packages/qa-automation/`)
| Agente | Archivo | Ambito de aplicacion |
| :--- | :--- | :--- |
| **Test Automator** | `test-automator.md` | Implementacion de suites de pruebas unitarias, integracion y E2E (Playwright, Cypress, Vitest). |
| **Load Testing Specialist** | `load-testing-specialist.md` | Pruebas de carga y estres, escenarios de concurrencia distribuida (k6, Locust) y percentiles p95/p99. |
| **Test Engineer** | `test-engineer.md` | Estrategia integral de QA, matrices de cobertura, criterios de aceptacion BDD/Gherkin y Quality Gates. |
| **Debugger** | `debugger.md` | Diagnostico de causa raiz, resolucion de bugs, analisis forense de trazas y prevencion de regresiones. |

### Rendimiento (`packages/performance/`)
| Agente | Archivo | Ambito de aplicacion |
| :--- | :--- | :--- |
| **Performance Engineer** | `performance-engineer.md` | Optimizacion de latencia, arquitectura de baja asignacion de memoria (zero-allocation) y caching. |
| **Performance Profiler** | `performance-profiler.md` | Profiling de CPU/memoria, analisis de runtime (.NET CLR / Node.js) y diagnostico de PostgreSQL. |
| **Frontend Performance Optimizer** | `frontend-performance-optimizer.md` | Optimizacion de interfaz, reduccion de bundles, metricas Core Web Vitals (LCP, INP, CLS) y reflows. |

### Backend y Servicios (`packages/backend/`)
| Agente | Archivo | Ambito de aplicacion |
| :--- | :--- | :--- |
| **Backend Architect** | `backend-architect.md` | Diseno de sistemas distribuidos, Clean Architecture, Bounded Contexts (DDD), eventos y observabilidad. |
| **Backend Developer** | `backend-developer.md` | Implementacion de APIs RESTful, inyeccion de dependencias, validaciones y patrones de resiliencia. |
| **API Documenter** | `api-documenter.md` | Especificaciones tecnicas OpenAPI 3.1, contratos de integracion y catalogos estandarizados de errores. |

### Bases de Datos (`packages/database/`)
| Agente | Archivo | Ambito de aplicacion |
| :--- | :--- | :--- |
| **Database Architect** | `database-architect.md` | Modelado relacional y documental, persistencia poliglota, particionamiento y migraciones sin caida. |
| **SQL Pro** | `sql-pro.md` | Optimizacion de consultas SQL, analisis de planes de ejecucion e indices estrategicos (SQL Server / MySQL). |
| **Database Admin** | `database-admin.md` | Operaciones DBA, alta disponibilidad, recuperacion ante desastres (RPO/RTO) y mantenimiento (SQL Server, MySQL, Mongo, Redis). |

---

## 2. Instrucciones de Instalacion por Plataforma (pnpm dlx)

Seleccione su entorno de desarrollo y copie directamente el comando del paquete que necesita:

### Kiro (`.kiro/agents/`)

Instalar **Backend**:
```bash
pnpm dlx @black-jaguar-1/agentes-ias --package backend --platform kiro
```

Instalar **Bases de Datos**:
```bash
pnpm dlx @black-jaguar-1/agentes-ias --package database --platform kiro
```

Instalar **Calidad y QA**:
```bash
pnpm dlx @black-jaguar-1/agentes-ias --package qa-automation --platform kiro
```

Instalar **Rendimiento**:
```bash
pnpm dlx @black-jaguar-1/agentes-ias --package performance --platform kiro
```

Instalar **Desarrollo**:
```bash
pnpm dlx @black-jaguar-1/agentes-ias --package development --platform kiro
```

Instalar agente individual (Code Reviewer):
```bash
pnpm dlx @black-jaguar-1/agentes-ias --agent code-reviewer --platform kiro
```

---

### Google Antigravity (`.antigravity/agents/`)

Instalar **Backend**:
```bash
pnpm dlx @black-jaguar-1/agentes-ias --package backend --platform antigravity
```

Instalar **Bases de Datos**:
```bash
pnpm dlx @black-jaguar-1/agentes-ias --package database --platform antigravity
```

Instalar **Calidad y QA**:
```bash
pnpm dlx @black-jaguar-1/agentes-ias --package qa-automation --platform antigravity
```

Instalar **Rendimiento**:
```bash
pnpm dlx @black-jaguar-1/agentes-ias --package performance --platform antigravity
```

Instalar **Desarrollo**:
```bash
pnpm dlx @black-jaguar-1/agentes-ias --package development --platform antigravity
```

Instalar agente individual (Code Reviewer):
```bash
pnpm dlx @black-jaguar-1/agentes-ias --agent code-reviewer --platform antigravity
```

---

### Claude Code (`.claude/agents/`)

Instalar **Backend**:
```bash
pnpm dlx @black-jaguar-1/agentes-ias --package backend --platform claude
```

Instalar **Bases de Datos**:
```bash
pnpm dlx @black-jaguar-1/agentes-ias --package database --platform claude
```

Instalar **Calidad y QA**:
```bash
pnpm dlx @black-jaguar-1/agentes-ias --package qa-automation --platform claude
```

Instalar **Rendimiento**:
```bash
pnpm dlx @black-jaguar-1/agentes-ias --package performance --platform claude
```

Instalar **Desarrollo**:
```bash
pnpm dlx @black-jaguar-1/agentes-ias --package development --platform claude
```

Instalar agente individual (Code Reviewer):
```bash
pnpm dlx @black-jaguar-1/agentes-ias --agent code-reviewer --platform claude
```

---

### Codex (`.codex/agents/`)

Instalar **Backend**:
```bash
pnpm dlx @black-jaguar-1/agentes-ias --package backend --platform codex
```

Instalar **Bases de Datos**:
```bash
pnpm dlx @black-jaguar-1/agentes-ias --package database --platform codex
```

Instalar **Calidad y QA**:
```bash
pnpm dlx @black-jaguar-1/agentes-ias --package qa-automation --platform codex
```

Instalar **Rendimiento**:
```bash
pnpm dlx @black-jaguar-1/agentes-ias --package performance --platform codex
```

Instalar **Desarrollo**:
```bash
pnpm dlx @black-jaguar-1/agentes-ias --package development --platform codex
```

Instalar agente individual (Code Reviewer):
```bash
pnpm dlx @black-jaguar-1/agentes-ias --agent code-reviewer --platform codex
```

---

## 3. Alternativas con Scripts Nativos

### PowerShell (Windows)

Instalar paquete de **Backend**:
```powershell
& ([scriptblock]::Create((Invoke-RestMethod -Uri "[https://raw.githubusercontent.com/BLACK-JAGUAR-1/agentes-ias/main/install.ps1](https://raw.githubusercontent.com/BLACK-JAGUAR-1/agentes-ias/main/install.ps1)"))) -Package "backend" -Platform "kiro"
```

Instalar paquete de **Bases de Datos**:
```powershell
& ([scriptblock]::Create((Invoke-RestMethod -Uri "[https://raw.githubusercontent.com/BLACK-JAGUAR-1/agentes-ias/main/install.ps1](https://raw.githubusercontent.com/BLACK-JAGUAR-1/agentes-ias/main/install.ps1)"))) -Package "database" -Platform "kiro"
```

Instalar paquete de **Calidad y QA**:
```powershell
& ([scriptblock]::Create((Invoke-RestMethod -Uri "[https://raw.githubusercontent.com/BLACK-JAGUAR-1/agentes-ias/main/install.ps1](https://raw.githubusercontent.com/BLACK-JAGUAR-1/agentes-ias/main/install.ps1)"))) -Package "qa-automation" -Platform "kiro"
```

Instalar paquete de **Rendimiento**:
```powershell
& ([scriptblock]::Create((Invoke-RestMethod -Uri "[https://raw.githubusercontent.com/BLACK-JAGUAR-1/agentes-ias/main/install.ps1](https://raw.githubusercontent.com/BLACK-JAGUAR-1/agentes-ias/main/install.ps1)"))) -Package "performance" -Platform "kiro"
```

Instalar paquete de **Desarrollo**:
```powershell
& ([scriptblock]::Create((Invoke-RestMethod -Uri "[https://raw.githubusercontent.com/BLACK-JAGUAR-1/agentes-ias/main/install.ps1](https://raw.githubusercontent.com/BLACK-JAGUAR-1/agentes-ias/main/install.ps1)"))) -Package "development" -Platform "kiro"
```

---

### Bash (Linux / macOS / WSL)

Instalar paquete de **Backend**:
```bash
curl -fsSL [https://raw.githubusercontent.com/BLACK-JAGUAR-1/agentes-ias/main/install.sh](https://raw.githubusercontent.com/BLACK-JAGUAR-1/agentes-ias/main/install.sh) | bash -s -- --package backend --platform kiro
```

Instalar paquete de **Bases de Datos**:
```bash
curl -fsSL [https://raw.githubusercontent.com/BLACK-JAGUAR-1/agentes-ias/main/install.sh](https://raw.githubusercontent.com/BLACK-JAGUAR-1/agentes-ias/main/install.sh) | bash -s -- --package database --platform kiro
```

Instalar paquete de **Calidad y QA**:
```bash
curl -fsSL [https://raw.githubusercontent.com/BLACK-JAGUAR-1/agentes-ias/main/install.sh](https://raw.githubusercontent.com/BLACK-JAGUAR-1/agentes-ias/main/install.sh) | bash -s -- --package qa-automation --platform kiro
```

Instalar paquete de **Rendimiento**:
```bash
curl -fsSL [https://raw.githubusercontent.com/BLACK-JAGUAR-1/agentes-ias/main/install.sh](https://raw.githubusercontent.com/BLACK-JAGUAR-1/agentes-ias/main/install.sh) | bash -s -- --package performance --platform kiro
```

Instalar paquete de **Desarrollo**:
```bash
curl -fsSL [https://raw.githubusercontent.com/BLACK-JAGUAR-1/agentes-ias/main/install.sh](https://raw.githubusercontent.com/BLACK-JAGUAR-1/agentes-ias/main/install.sh) | bash -s -- --package development --platform kiro
```

---

## 4. Rutas de Destino por Plataforma

El instalador detecta el parametro `--platform` y deposita los archivos `.md` en la ruta esperada por cada entorno:

| Plataforma | Parametro | Directorio donde se instalan |
| :--- | :--- | :--- |
| **Kiro** | `--platform kiro` | `.kiro/agents/` |
| **Antigravity** | `--platform antigravity` | `.antigravity/agents/` |
| **Claude** | `--platform claude` | `.claude/agents/` |
| **Codex** | `--platform codex` | `.codex/agents/` |
| **Generico** | `--platform generic` | `.ai/agents/` |