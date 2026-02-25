// scripts/update-book-meta.js
const fs = require('fs');
const yaml = require('js-yaml');
const { execSync } = require('child_process');

function updateBookMeta() {
    const bookYml = yaml.load(fs.readFileSync('manuscript/_meta/book.yml', 'utf8'));

    // Edition aus letztem Git-Tag
    try {
        const latestTag = execSync('git describe --tags --abbrev=0').toString().trim();
        bookYml.edition = latestTag;
    } catch {
        // Kein Tag vorhanden
    }

    // Repository-URL aus Git
    try {
        const remoteUrl = execSync('git config --get remote.origin.url').toString().trim();
        bookYml.repository = remoteUrl.replace('.git', '');
    } catch {}

    // Created-Datum aus erstem Commit
    try {
        const firstCommit = execSync('git log --reverse --pretty=format:"%ad" --date=short | head -1')
            .toString().trim();
        if (!bookYml.created) bookYml.created = firstCommit;
    } catch {}

    fs.writeFileSync('manuscript/_meta/book.yml', yaml.dump(bookYml));
    console.log('✅ book.yml aktualisiert');
}

updateBookMeta();