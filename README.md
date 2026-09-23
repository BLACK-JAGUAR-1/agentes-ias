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

## 2. Instrucciones de Instalacion

Abra una consola en la raiz del proyecto donde desee incorporar los agentes y ejecute el metodo correspondiente:

### Con pnpm dlx (Recomendado)

```bash
# Instalar un agente individual en Kiro
pnpm dlx @black-jaguar-1/agentes-ias --agent code-reviewer --platform kiro

# Instalar un agente en Antigravity (por defecto)
pnpm dlx @black-jaguar-1/agentes-ias --agent backend-architect

# Instalar un paquete completo en Kiro
pnpm dlx @black-jaguar-1/agentes-ias --package database --platform kiro

# Instalar un paquete completo en Claude
pnpm dlx @black-jaguar-1/agentes-ias --package backend --platform claude