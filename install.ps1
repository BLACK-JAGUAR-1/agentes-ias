param (
    [string]$Agent,
    [string]$Package,
    [string]$Platform = "antigravity",
    [string]$Target,
    [string]$RepoUser = "BLACK-JAGUAR-1",
    [string]$RepoName = "agentes-ias"
)

# Sincronizar parametro de plataforma
if ($Target) {
    $Platform = $Target
}

if (-not $Agent -and -not $Package) {
    Write-Host "[ERROR] Debe especificar un agente (-Agent <nombre>) o un paquete (-Package <nombre>)." -ForegroundColor Red
    Write-Host "Uso:"
    Write-Host "  .\install.ps1 -Agent code-reviewer -Platform kiro"
    Write-Host "  .\install.ps1 -Package backend -Platform claude"
    exit 1
}

# Rutas de instalacion por entorno
$platformMap = @{
    "antigravity" = ".antigravity/agents"
    "kiro"        = ".kiro/agents"
    "claude"      = ".claude/agents"
    "codex"       = ".codex/agents"
    "generic"     = ".ai/agents"
}

$targetDir = $platformMap[$Platform.ToLower()]
if (-not $targetDir) {
    $targetDir = ".ai/agents"
}

if (!(Test-Path $targetDir)) {
    New-Item -ItemType Directory -Force -Path $targetDir | Out-Null
}

# Catalogo oficial de los 14 agentes
$registry = @{
    "code-reviewer"                  = "development/code-reviewer.md"
    "test-automator"                 = "qa-automation/test-automator.md"
    "load-testing-specialist"        = "qa-automation/load-testing-specialist.md"
    "test-engineer"                  = "qa-automation/test-engineer.md"
    "debugger"                       = "qa-automation/debugger.md"
    "performance-engineer"           = "performance/performance-engineer.md"
    "performance-profiler"           = "performance/performance-profiler.md"
    "frontend-performance-optimizer" = "performance/frontend-performance-optimizer.md"
    "backend-architect"              = "backend/backend-architect.md"
    "backend-developer"              = "backend/backend-developer.md"
    "api-documenter"                 = "backend/api-documenter.md"
    "database-architect"             = "database/database-architect.md"
    "sql-pro"                        = "database/sql-pro.md"
    "database-admin"                 = "database/database-admin.md"
}

$baseUrl = "https://raw.githubusercontent.com/$RepoUser/$RepoName/main/packages"

Write-Host "[INFO] Plataforma destino: [$($Platform.ToUpper())] -> $targetDir" -ForegroundColor Cyan

if ($Agent) {
    $relPath = $registry[$Agent]
    if (-not $relPath) {
        Write-Host "[ERROR] El agente '$Agent' no existe en el catalogo." -ForegroundColor Red
        exit 1
    }

    $dest = "$targetDir/$Agent.md"
    $url = "$baseUrl/$relPath"
    try {
        Invoke-WebRequest -Uri $url -OutFile $dest -UseBasicParsing
        Write-Host "[OK] Agente '$Agent' instalado con exito en $dest" -ForegroundColor Green
    }
    catch {
        Write-Host "[ERROR] Fallo al descargar '$Agent'. Verifique la conexion o permisos." -ForegroundColor Red
        exit 1
    }
}
elseif ($Package) {
    $matched = $registry.GetEnumerator() | Where-Object { $_.Value -like "$Package/*" }
    if (-not $matched) {
        Write-Host "[ERROR] El paquete '$Package' no existe o esta vacio." -ForegroundColor Red
        exit 1
    }

    Write-Host "[INFO] Instalando paquete '$Package'..." -ForegroundColor Cyan
    $matched | ForEach-Object {
        $aName = $_.Key
        $relPath = $_.Value
        $dest = "$targetDir/$aName.md"
        $url = "$baseUrl/$relPath"
        try {
            Invoke-WebRequest -Uri $url -OutFile $dest -UseBasicParsing
            Write-Host "  [OK] $aName instalado en $dest" -ForegroundColor Green
        }
        catch {
            Write-Host "  [ERROR] Fallo al descargar $($aName): $_" -ForegroundColor Red
        }
    }
    Write-Host "[OK] Paquete '$Package' completado." -ForegroundColor Green
}