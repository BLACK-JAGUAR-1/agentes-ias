#!/usr/bin/env node

const fs = require('fs');
const path = require('path');
const https = require('https');

const args = process.argv.slice(2);

function getParam(param) {
    const index = args.indexOf(param);
    return (index !== -1 && args[index + 1]) ? args[index + 1] : null;
}

// Soporta tanto --target como --platform
const targetPlatform = (getParam('--target') || getParam('--platform') || 'antigravity').toLowerCase();
const requestedPackage = getParam('--package');
const requestedAgent = getParam('--agent') || (!args[0]?.startsWith('--') ? args[0] : null);

// Rutas de instalacion segun el entorno de IA
const TARGET_DIRS = {
    antigravity: path.join('.antigravity', 'agents'),
    kiro: path.join('.kiro', 'agents'),
    claude: path.join('.claude', 'agents'),
    codex: path.join('.codex', 'agents'),
    generic: path.join('.ai', 'agents')
};

const destinationDir = path.join(process.cwd(), TARGET_DIRS[targetPlatform] || TARGET_DIRS.antigravity);

// Catalogo oficial con los 14 agentes reales agrupados por paquete
const CATALOG = {
    'development': [
        { name: 'code-reviewer', file: 'development/code-reviewer.md' }
    ],
    'qa-automation': [
        { name: 'test-automator', file: 'qa-automation/test-automator.md' },
        { name: 'load-testing-specialist', file: 'qa-automation/load-testing-specialist.md' },
        { name: 'test-engineer', file: 'qa-automation/test-engineer.md' },
        { name: 'debugger', file: 'qa-automation/debugger.md' }
    ],
    'performance': [
        { name: 'performance-engineer', file: 'performance/performance-engineer.md' },
        { name: 'performance-profiler', file: 'performance/performance-profiler.md' },
        { name: 'frontend-performance-optimizer', file: 'performance/frontend-performance-optimizer.md' }
    ],
    'backend': [
        { name: 'backend-architect', file: 'backend/backend-architect.md' },
        { name: 'backend-developer', file: 'backend/backend-developer.md' },
        { name: 'api-documenter', file: 'backend/api-documenter.md' }
    ],
    'database': [
        { name: 'database-architect', file: 'database/database-architect.md' },
        { name: 'sql-pro', file: 'database/sql-pro.md' },
        { name: 'database-admin', file: 'database/database-admin.md' }
    ]
};

const REPO_OWNER = 'BLACK-JAGUAR-1';
const REPO_NAME = 'agentes-ias';
const BASE_RAW_URL = `https://raw.githubusercontent.com/${REPO_OWNER}/${REPO_NAME}/main/packages`;

function downloadOrCopyFile(relPath, destFile) {
    return new Promise((resolve, reject) => {
        // Si se ejecuta en local y la carpeta packages existe en la raiz, copiar directo
        const localPath = path.join(__dirname, '..', 'packages', relPath);
        if (fs.existsSync(localPath)) {
            try {
                fs.copyFileSync(localPath, destFile);
                return resolve();
            } catch (err) {
                return reject(err);
            }
        }

        // Descarga remota desde GitHub
        const url = `${BASE_RAW_URL}/${relPath}`;
        https.get(url, (res) => {
            if (res.statusCode === 404) {
                return reject(new Error(`Archivo no encontrado en el repositorio: ${relPath}`));
            }
            if (res.statusCode !== 200) {
                return reject(new Error(`Fallo en la descarga (Codigo HTTP: ${res.statusCode})`));
            }

            const stream = fs.createWriteStream(destFile);
            res.pipe(stream);
            stream.on('finish', () => {
                stream.close();
                resolve();
            });
            stream.on('error', reject);
        }).on('error', reject);
    });
}

async function main() {
    if (!requestedAgent && !requestedPackage) {
        console.error('\x1b[31m[ERROR]\x1b[0m Debe especificar un paquete (--package <nombre>) o un agente (--agent <nombre>).');
        console.log('\nUso con pnpm dlx:');
        console.log('  pnpm dlx @black-jaguar-1/agentes-ias --agent <nombre> [--target <kiro|antigravity|claude>]');
        console.log('  pnpm dlx @black-jaguar-1/agentes-ias --package <categoria> [--target <kiro|antigravity|claude>]\n');
        console.log(`Paquetes disponibles: ${Object.keys(CATALOG).join(', ')}`);
        process.exit(1);
    }

    let itemsToInstall = [];

    if (requestedPackage) {
        if (!CATALOG[requestedPackage]) {
            console.error(`\x1b[31m[ERROR]\x1b[0m El paquete '${requestedPackage}' no existe en el catalogo.`);
            console.log(`Paquetes disponibles: ${Object.keys(CATALOG).join(', ')}`);
            process.exit(1);
        }
        itemsToInstall = CATALOG[requestedPackage];
    } else if (requestedAgent) {
        for (const pkg of Object.values(CATALOG)) {
            const found = pkg.find(a => a.name === requestedAgent);
            if (found) {
                itemsToInstall.push(found);
                break;
            }
        }
        if (itemsToInstall.length === 0) {
            console.error(`\x1b[31m[ERROR]\x1b[0m No se encontro el agente '${requestedAgent}' en el catalogo.`);
            process.exit(1);
        }
    }

    if (!fs.existsSync(destinationDir)) {
        fs.mkdirSync(destinationDir, { recursive: true });
    }

    console.log(`\x1b[36m[INFO]\x1b[0m Plataforma seleccionada: [${targetPlatform.toUpperCase()}] -> ${destinationDir}`);

    for (const item of itemsToInstall) {
        const destFile = path.join(destinationDir, `${item.name}.md`);
        try {
            await downloadOrCopyFile(item.file, destFile);
            console.log(`\x1b[32m[OK]\x1b[0m Agente '${item.name}' instalado con exito en ${destFile}`);
        } catch (err) {
            console.error(`\x1b[31m[ERROR]\x1b[0m Fallo al instalar '${item.name}': ${err.message}`);
        }
    }
}

main();