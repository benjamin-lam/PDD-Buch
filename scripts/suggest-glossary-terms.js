// scripts/suggest-glossary-terms.js
const fs = require('fs');
const path = require('path');

function extractCapitalizedTerms(text) {
    // Finde kapitalisierte Begriffe (z.B. "Prompt-Driven Development", "API Contract")
    const pattern = /\b[A-Z][a-z]+(?:\s+[A-Z][a-z]+)*\b/g;
    return text.match(pattern) || [];
}

function suggestGlossaryTerms() {
    const manuscriptDir = 'manuscript';
    const glossary = fs.readFileSync('manuscript/_meta/glossary.md', 'utf8');
    const existingTerms = new Set();

    // Extrahiere existierende Begriffe aus Glossar
    glossary.split('\n').forEach(line => {
        const match = line.match(/^-\s\*\*(.+?)\*\*/);
        if (match) existingTerms.add(match[1]);
    });

    // Scanne alle Kapitel
    const suggestions = new Set();

    function scanDir(dir) {
        fs.readdirSync(dir).forEach(file => {
            const filePath = path.join(dir, file);
            if (fs.statSync(filePath).isDirectory()) {
                scanDir(filePath);
            } else if (file.endsWith('.md')) {
                const content = fs.readFileSync(filePath, 'utf8');
                const terms = extractCapitalizedTerms(content);
                terms.forEach(term => {
                    if (!existingTerms.has(term) && term.length > 3) {
                        suggestions.add(term);
                    }
                });
            }
        });
    }

    scanDir(manuscriptDir);

    console.log('🔍 Vorgeschlagene neue Glossar-Begriffe:');
    Array.from(suggestions).sort().slice(0, 20).forEach(term => {
        console.log(`- **${term}**: [TODO: Definition]`);
    });
}

suggestGlossaryTerms();