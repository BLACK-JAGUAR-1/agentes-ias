#!/usr/bin/env node

const fs = require('fs');
const path = require('path');
const https = require('https');

const args = process.argv.slice(2);
let agentName = null;

const agentFlagIndex = args.indexOf('--agent');
if (agentFlagIndex !== -1 && args[agentFlagIndex + 1]) {
    agentName = args[agentFlagIndex + 1];
} else if (args[0] && !args[0].startsWith('--')) {
    agentName = args[0];
}

if (!agentName) {
    console.error('\x1b[31m[ERROR]\x1b[0m Debe especificar el nombre del subagente.');
    console.log('\nUso:');
    console.log('  pnpm dlx @black-jaguar-1/antigravity-agents --agent <nombre-del-agente>\n');
    process.exit(1);
}

const targetDirectory = path.join(process.cwd(), '.antigravity', 'agents');
const targetFile = path.join(targetDirectory, `${agentName}.md`);
const repoUrl = `https://raw.githubusercontent.com/BLACK-JAGUAR-1/antigravity-agents/main/agents/${agentName}.md`;

if (!fs.existsSync(targetDirectory)) {
    fs.mkdirSync(targetDirectory, { recursive: true });
}

console.log(`\x1b[36m[INFO]\x1b[0m Instalando subagente: \x1b[1m${agentName}\x1b[0m`);
console.log('\x1b[36m[INFO]\x1b[0m Descargando desde el repositorio...');

https.get(repoUrl, (response) => {
    if (response.statusCode === 404) {
        console.error(`\x1b[31m[ERROR]\x1b[0m No se encontro el subagente '${agentName}' en el catalogo.`);
        process.exit(1);
    }

    if (response.statusCode !== 200) {
        console.error(`\x1b[31m[ERROR]\x1b[0m Error en la descarga (Codigo HTTP: ${response.statusCode}).`);
        process.exit(1);
    }

    const fileStream = fs.createWriteStream(targetFile);
    response.pipe(fileStream);

    fileStream.on('finish', () => {
        fileStream.close();
        console.log(`\x1b[32m[OK]\x1b[0m Subagente '${agentName}' instalado correctamente.`);
        console.log(`\x1b[34m[INFO]\x1b[0m Ubicacion: .antigravity/agents/${agentName}.md`);
    });
}).on('error', (error) => {
    console.error(`\x1b[31m[ERROR]\x1b[0m Fallo en la conexion de red: ${error.message}`);
    process.exit(1);
});