// scripts/generate-pattern-index.js
const fs = require('fs');
const path = require('path');
const yaml = require('js-yaml'); // npm install js-yaml

function extractFrontmatter(content) {
    const match = content.match(/^---\n([\s\S]*?)\n---/);
    if (!match) return null;
    return yaml.load(match[1]);
}

function extractPatternMeta(filePath) {
    const content = fs.readFileSync(filePath, 'utf8');
    const lines = content.split('\n');

    let name, status, chapter, related;

    lines.forEach(line => {
        if (line.includes('**Pattern-Name:**')) {
            name = line.split('**Pattern-Name:**')[1].trim().replace(/^_|_$/g, '');
        }
        if (line.includes('**Status:**')) {
            status = line.split('**Status:**')[1].trim().split(' ')[0];
        }
        if (line.includes('**Relevante Kapitel:**')) {
            chapter = line.split('**Relevante Kapitel:**')[1].trim().replace(/^_|_$/g, '');
        }
        if (line.includes('**Verwandte Patterns:**')) {
            related = line.split('**Verwandte Patterns:**')[1].trim().replace(/^_|_$/g, '');
        }
    });

    return { name: name || path.basename(filePath, '.blueprint.md'), status, chapter, related };
}

function generatePatternIndex() {
    const blueprintsDir = 'manuscript/_blueprints';
    const files = fs.readdirSync(blueprintsDir)
        .filter(f => f.includes('pattern') && f.endsWith('.blueprint.md'));

    let index = `# Pattern Index\n\n`;
    index += `Dieser Index wird **automatisch generiert** aus \`manuscript/_blueprints/*pattern*.blueprint.md\`.\n\n`;
    index += `**Letzte Aktualisierung:** ${new Date().toISOString().split('T')[0]}\n\n`;
    index += `---\n\n`;
    index += `## Patterns\n\n`;

    files.forEach((file, i) => {
        const filePath = path.join(blueprintsDir, file);
        const meta = extractPatternMeta(filePath);

        index += `### ${i + 1}) ${meta.name}\n`;
        index += `- **Status:** ${meta.status || 'draft'}\n`;
        if (meta.chapter) index += `- **Kapitel:** ${meta.chapter}\n`;
        if (meta.related) index += `- **Verwandte Patterns:** ${meta.related}\n`;
        index += `- **Blueprint:** \`${file}\`\n\n`;
        index += `---\n\n`;
    });

    fs.writeFileSync('manuscript/_meta/pattern-index.md', index);
    console.log('✅ Pattern-Index generiert');
}

generatePatternIndex();