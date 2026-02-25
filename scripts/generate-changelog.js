// scripts/generate-changelog.js
const { execSync } = require('child_process');
const fs = require('fs');

function getCommitsSinceLastTag() {
    try {
        const lastTag = execSync('git describe --tags --abbrev=0').toString().trim();
        const commits = execSync(`git log ${lastTag}..HEAD --pretty=format:"%s|%h|%ad" --date=short`)
            .toString()
            .split('\n')
            .filter(Boolean)
            .map(line => {
                const [message, hash, date] = line.split('|');
                return { message, hash, date };
            });
        return commits;
    } catch {
        // Keine Tags vorhanden, hole alle Commits
        const commits = execSync('git log --pretty=format:"%s|%h|%ad" --date=short')
            .toString()
            .split('\n')
            .filter(Boolean)
            .map(line => {
                const [message, hash, date] = line.split('|');
                return { message, hash, date };
            });
        return commits;
    }
}

function categorizeCommits(commits) {
    const categories = {
        feat: [],
        fix: [],
        docs: [],
        chore: [],
        other: []
    };

    commits.forEach(commit => {
        const type = commit.message.match(/^(feat|fix|docs|chore):/)?.[1] || 'other';
        categories[type].push(commit);
    });

    return categories;
}

function generateChangelog() {
    const commits = getCommitsSinceLastTag();
    const categorized = categorizeCommits(commits);

    let changelog = `# Changelog (Book)\n\n`;
    changelog += `Dieses Changelog beschreibt **inhaltliche** Änderungen am Buch (nicht jeden Commit).\n\n`;
    changelog += `## [Unreleased]\n\n`;

    if (categorized.feat.length > 0) {
        changelog += `### ✨ Features\n`;
        categorized.feat.forEach(c => {
            changelog += `- ${c.message.replace(/^feat:\s*/, '')} (\`${c.hash}\`)\n`;
        });
        changelog += `\n`;
    }

    if (categorized.fix.length > 0) {
        changelog += `### 🐛 Fixes\n`;
        categorized.fix.forEach(c => {
            changelog += `- ${c.message.replace(/^fix:\s*/, '')} (\`${c.hash}\`)\n`;
        });
        changelog += `\n`;
    }

    if (categorized.docs.length > 0) {
        changelog += `### 📚 Documentation\n`;
        categorized.docs.forEach(c => {
            changelog += `- ${c.message.replace(/^docs:\s*/, '')} (\`${c.hash}\`)\n`;
        });
        changelog += `\n`;
    }

    // Alte Einträge anhängen
    const existingChangelog = fs.readFileSync('manuscript/_meta/changelog.md', 'utf8');
    const oldEntries = existingChangelog.split('## [Unreleased]')[1]?.split('##').slice(1).join('##') || '';

    if (oldEntries) {
        changelog += `##${oldEntries}`;
    }

    fs.writeFileSync('manuscript/_meta/changelog.md', changelog);
    console.log('✅ Changelog generiert');
}

generateChangelog();