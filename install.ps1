param (
    [Parameter(Mandatory = $true)]
    [string]$Agent,
    [string]$RepoUser = "BLACK-JAGUAR-1"
)

$targetDir = ".antigravity/agents"
if (!(Test-Path $targetDir)) {
    New-Item -ItemType Directory -Force -Path $targetDir | Out-Null
}

$url = "https://raw.githubusercontent.com/$RepoUser/antigravity-agents/main/agents/$Agent.md"
$destination = "$targetDir/$Agent.md"

try {
    Invoke-WebRequest -Uri $url -OutFile $destination -UseBasicParsing
    Write-Host "[OK] Subagente '$Agent' instalado en $destination" -ForegroundColor Green
}
catch {
    Write-Host "[ERROR] Fallo al descargar el subagente '$Agent'. Verifique el nombre del archivo o los permisos del repositorio." -ForegroundColor Red
    exit 1
}