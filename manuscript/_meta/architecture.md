# Architektur des Buchsystems

Dieses Dokument beschreibt die Architektur des **Buchprojekts als System**.

## Ziel
- Schreibprozess stabilisieren
- Reproduzierbarkeit sichern (Inhalt + Prompts + Struktur)
- Veröffentlichung als statisches HTML über GitHub Pages

## Kernprinzipien
- **/manuscript** ist Source of Truth.
- **/docs** ist Build Output.
- **toc.yml** ist die einzige Wahrheit für Navigation/Reihenfolge.
- **Blueprint-first**: Planung vor Text.
- **Status-driven**: `draft → review → final`.
- **Prompts sind Code**: versioniert, reviewbar, diffbar.

## Artefakt-Typen
- Kapitel (chapter)
- Pattern
- Case Study
- Szene (Scene)
- Claims (Behauptungen + Quellen)
- Prompts (LLM Instructions)
- Worklog (Sessions)

## Build-Konzept (ohne Jekyll)
- Ein Skript rendert Markdown → HTML.
- Templates liegen in `/templates`.
- Output geht nach `/docs` (GitHub Pages).

## Quality Gates (später, via scripts/check.js)
Beispiele:
- Kapitel hat Frontmatter + status?
- Blueprint existiert?
- TL;DR vorhanden?
- Begriffe im Glossar?
- Claims referenziert?
- Links gültig?

## Bewusste Nicht-Entscheidungen
- Kein Jekyll, kein CMS, kein WYSIWYG.
- Kein Overdesign: Inhalt vor Theme.
- Keine Tool-Abhängigkeit in Kapiteln (Tooling als Beispiele, nicht als Fundament).

