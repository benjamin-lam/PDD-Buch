#!/usr/bin/env bash
set -euo pipefail

# PDD Manifesto – Repo Bootstrap
# Creates folder structure + initial skeleton files for a Git + Markdown book published via GitHub Pages (/docs).
# Usage:
#   chmod +x bootstrap.sh
#   ./bootstrap.sh
#
# Safe to re-run: it won't overwrite existing files (unless you delete them).

PROJECT_ROOT="pdd-manifesto"

# Helpers
mkdirp() { mkdir -p "$1"; }
write_if_missing() {
  local path="$1"
  shift
  local content="$*"
  if [[ -e "$path" ]]; then
    echo "skip  $path (exists)"
  else
    mkdir -p "$(dirname "$path")"
    printf "%s\n" "$content" > "$path"
    echo "write $path"
  fi
}

# --- Directories ---
mkdirp "$PROJECT_ROOT"

# Root files
write_if_missing "$PROJECT_ROOT/.gitignore" \
'# Build output + local tooling
node_modules/
.DS_Store
*.log
.tmp/
dist/
.cache/

# Optional: if you later generate artifacts elsewhere
# out/
'

write_if_missing "$PROJECT_ROOT/LICENSE" \
'Copyright (c) 2026

TODO: Choose a license.
Options:
- CC BY 4.0 (recommended for an open book)
- CC BY-NC 4.0 (non-commercial)
- All rights reserved

Until chosen: treat as "All rights reserved".
'

write_if_missing "$PROJECT_ROOT/CONTRIBUTING.md" \
'# Contributing

This repository is primarily a book manuscript.
Feedback is welcome, but the workflow is intentionally strict.

## Preferred contribution types
- Typos and clarity improvements
- Broken links
- Suggestions (issues/discussions)

## How to contribute
1. Open an Issue with context (chapter, section, quote).
2. If proposing text changes, open a Pull Request.
3. Keep changes focused (one topic per PR).

## Editorial constraints
- Preserve the author voice. Do not "smooth" aggressively.
- Keep structure intact (TL;DR, thesis, case, checklist, takeaways).
- Avoid adding tool hype; focus on architecture & governance.
'

# Manuscript directories
mkdirp "$PROJECT_ROOT/manuscript/_meta"
mkdirp "$PROJECT_ROOT/manuscript/_blueprints"
mkdirp "$PROJECT_ROOT/manuscript/_research"
mkdirp "$PROJECT_ROOT/manuscript/_prompts"
mkdirp "$PROJECT_ROOT/manuscript/_worklog"
mkdirp "$PROJECT_ROOT/manuscript/00-frontmatter"
mkdirp "$PROJECT_ROOT/manuscript/01-krise-klassik"
mkdirp "$PROJECT_ROOT/manuscript/02-pdd-framework"
mkdirp "$PROJECT_ROOT/manuscript/03-architektur-patterns"
mkdirp "$PROJECT_ROOT/manuscript/04-mensch-im-loop"
mkdirp "$PROJECT_ROOT/manuscript/05-praxis-ausblick"
mkdirp "$PROJECT_ROOT/manuscript/_backmatter"

# Pages build output dirs
mkdirp "$PROJECT_ROOT/docs/chapters"
mkdirp "$PROJECT_ROOT/docs/assets"

# Templates + scripts
mkdirp "$PROJECT_ROOT/templates"
mkdirp "$PROJECT_ROOT/scripts"

# --- Root README ---
write_if_missing "$PROJECT_ROOT/README.md" \
'# The PDD Manifesto

**Software-Architektur in der Ära generativer KI**

> Warum Prompts der neue Quellcode sind –  
> und wie wir Systeme entwerfen, die nicht altern.

## Was ist dieses Repository?

Dieses Repository ist ein **Buchprojekt**, geschrieben in **Markdown**, versioniert mit **Git** und veröffentlicht als **statisches HTML** über GitHub Pages.

- **/manuscript** = Source of Truth (hier wird geschrieben)
- **/docs** = Build Output (hier wird veröffentlicht)

Kein Jekyll. Kein CMS. Kein Magic.

## Prinzipien (Workflow)

1. **One Chapter = One Feature Branch**  
   Nicht optional. Das ist dein Redaktionssystem.

2. **Blueprint first**  
   Kein Kapitel ohne Blueprint. Das ist dein Architekturvertrag.

3. **Status-driven writing**  
   `draft → review → final`  
   Perfektion ist kein Ziel.

4. **TOC ist die einzige Wahrheit**  
   Alles andere ist abgeleitet.

5. **Prompts versionieren wie Code**  
   Du beweist damit deine eigene These.

## Veröffentlichung

GitHub Pages dient `/docs` aus.  
Editionen werden über Git Tags markiert (`v0.1.0`, `v0.2.0`, `v1.0.0`, …).

## Quick Start

1) Struktur erzeugen (optional, wenn du dieses Repo frisch bootstrappst):
- `./bootstrap.sh`

2) Schreibstart:
- `manuscript/_meta/toc.yml` pflegen
- Blueprint für Kapitel erstellen
- Kapitel schreiben (Markdown, Status `draft`)
- Build-Skript (später) erzeugt HTML in `/docs`

## Lizenz

Siehe `LICENSE`.
'

# --- Manuscript README ---
write_if_missing "$PROJECT_ROOT/manuscript/README.md" \
'# Manuscript (Source of Truth)

Hier entsteht das Buch.

## Regeln
- Schreibe in Markdown.
- Jedes Kapitel hat Frontmatter (id, title, part, status).
- Status: `draft`, `review`, `final`.
- Kein Kapitel ohne Blueprint.

## Wo ist was?
- `_meta/` – Buch-Metadaten, TOC, Glossar, Regeln
- `_blueprints/` – Vorlagen (Kapitel, Pattern, Case Study, Szene)
- `_research/` – Quellen & Behauptungen (Claims)
- `_prompts/` – LLM Prompts als versionierte Artefakte
- `_worklog/` – Sessions / work.log
- `00-..` bis `05-..` – der eigentliche Buchtext (Kapitel)
- `_backmatter/` – Blurb, Pitch, About, Ressourcen

## Minimaler Definition of Done (Draft) pro Kapitel
- TL;DR (3–6 Bulletpoints)
- Kernthese (2–5 Sätze)
- 1 Fallstudie (fiktiv reicht, als solche markiert)
- 1 Checkliste (5–8 Punkte)
- Takeaways (3–7 Bulletpoints)
- maximal 2–3 Snippets (Prompt/Code), klar markiert
'

# --- _meta files ---
write_if_missing "$PROJECT_ROOT/manuscript/_meta/book.yml" \
'title: "The PDD Manifesto"
subtitle: "Warum Prompts der neue Quellcode sind – und wie wir Systeme entwerfen, die nicht altern."
author: "Benjamin Lam"
language: "de"
edition: "v0.1.0"
repository: ""
pages_url: ""
license: ""
created: "2026-02-25"
'

write_if_missing "$PROJECT_ROOT/manuscript/_meta/toc.yml" \
'title: "The PDD Manifesto"
parts:
  - id: "teil-1"
    title: "Teil I: Die Krise der klassischen Entwicklung"
    chapters:
      - manuscript/01-krise-klassik/01-ende-der-tippgeschwindigkeit.md
      - manuscript/01-krise-klassik/02-technical-debt-bitrot.md
      - manuscript/01-krise-klassik/03-vibe-coding-vs-engineering.md

  - id: "teil-2"
    title: "Teil II: Das PDD-Framework (Die Methode)"
    chapters:
      - manuscript/02-pdd-framework/01-prompt-als-spezifikation.md
      - manuscript/02-pdd-framework/02-prompt-architektur.md
      - manuscript/02-pdd-framework/03-der-pdd-loop.md

  - id: "teil-3"
    title: "Teil III: Architektur & Patterns"
    chapters:
      - manuscript/03-architektur-patterns/01-disposable-code.md
      - manuscript/03-architektur-patterns/02-decoupling-by-intent.md
      - manuscript/03-architektur-patterns/03-prompt-versionierung.md

  - id: "teil-4"
    title: "Teil IV: Der Mensch im Loop (New Work)"
    chapters:
      - manuscript/04-mensch-im-loop/01-architect-of-intent.md
      - manuscript/04-mensch-im-loop/02-qs-2-0.md
      - manuscript/04-mensch-im-loop/03-effizienz-metriken.md

  - id: "teil-5"
    title: "Teil V: Praxisfälle & Ausblick"
    chapters:
      - manuscript/05-praxis-ausblick/01-legacy-migration.md
      - manuscript/05-praxis-ausblick/02-zukunft-der-programmierung.md
      - manuscript/05-praxis-ausblick/03-ethik-verantwortung.md
'

write_if_missing "$PROJECT_ROOT/manuscript/_meta/positioning.md" \
'# Positioning

## Primary audience
- Senior Software Architects
- Engineering Managers / Tech Leads
- Senior Entwickler:innen (DACH, Enterprise/Agency)

## Secondary audience
- CTOs, DevOps, Product/Platform
- Hochschulkurse zu AI-Engineering / Software Architecture

## Promise / Outcome
- Prompt Engineering auf Systemebene: Methode, Patterns, Governance.
- Reproduzierbarkeit statt „Prompt-Magie“.
- Architekturen, die sich regenerieren lassen statt zu verrotten.

## Differentiation
- Fokus auf Architektur & Governance, nicht auf Tool-Hype.
- Prompts als versionierte Artefakte (Git).
- Claims/Belege getrennt, auditierbar.
- Das Buchsystem ist selbst ein PDD-System.
'

write_if_missing "$PROJECT_ROOT/manuscript/_meta/style-guide.md" \
'# Style Guide

## Stimme
- Klar, präzise, pragmatisch.
- Ironie ist erlaubt, aber nicht auf Kosten der Lesbarkeit.
- Keine „Marketing-Glätte“. Lieber kantig und ehrlich.

## Struktur pro Kapitel
1. TL;DR
2. Kernthese
3. Beispiel / Szene oder Case Study
4. Snippets (max 2–3, klar markiert)
5. Checkliste (5–8 Punkte)
6. Takeaways (3–7 Punkte)
7. Offene Fragen (optional)

## Sprache
- Deutsch, technisch sauber, ohne Buzzword-Salat.
- Gendergerecht: standardmäßig „Entwickler:innen“.
- Begriffe konsequent: Glossar ist Quelle der Wahrheit.

## Zitate & Fakten
- Wenn es wie ein Fakt klingt: in `/_research/claims.md` erfassen.
- Quellen in `/_research/sources.md` pflegen (mit Abrufdatum).
'

write_if_missing "$PROJECT_ROOT/manuscript/_meta/glossary.md" \
'# Glossar

> Quelle der Wahrheit für Begriffe und Abkürzungen.
> Wenn ein Begriff im Text auftaucht und hier fehlt: ergänzen.

- **PDD (Prompt-Driven Development)**: Entwicklungsmethode, bei der Prompts als Spezifikationen/Contracts behandelt und versioniert werden.
- **Intent**: Die beabsichtigte Wirkung / das „Warum“ hinter einer Änderung oder Spezifikation.
- **Prompt Contract**: Ein Prompt mit expliziten Constraints, Output-Schema und Qualitätskriterien.
- **Prompt Drift**: Qualitätsverlust/Veränderung von Outputs bei gleichen Inputs über Zeit/Modelle hinweg.
- **Disposable Code**: Code als regenerierbares Artefakt statt langlebiges Handwerk.
'

write_if_missing "$PROJECT_ROOT/manuscript/_meta/architecture.md" \
'# Architektur des Buchsystems

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
'

write_if_missing "$PROJECT_ROOT/manuscript/_meta/changelog.md" \
'# Changelog (Book)

Dieses Changelog beschreibt **inhaltliche** Änderungen am Buch (nicht jeden Commit).

## [Unreleased]
- Initiales Skeleton erstellt.

## [v0.1.0] - 2026-02-25
- Repository-Struktur angelegt (manuscript/docs/templates/scripts).
- Blueprints, Research- und Prompt-Artefakte ergänzt.
'

# --- Blueprints ---
write_if_missing "$PROJECT_ROOT/manuscript/_blueprints/chapter.blueprint.md" \
'---
type: chapter-blueprint
id: ""
title: ""
part: ""
status: blueprint
---

# Ziel
- Was soll die/der Leser:in nach dem Kapitel können/verstehen?

# TL;DR (3–6 Bulletpoints)
- ...

# Kernthese (2–5 Sätze)
...

# Begriffe (Glossar-Check)
- Begriff A
- Begriff B

# Struktur (Abschnitte)
1. ...
2. ...
3. ...

# Fallstudie / Szene (Kurz)
- Setup:
- Konflikt:
- Auflösung / Lernpunkt:

# Snippets (max 2–3)
- [ ] Prompt
- [ ] Code
- [ ] Diagramm (optional)

# Checkliste (5–8 Punkte)
- [ ] ...
- [ ] ...

# Takeaways (3–7)
- ...

# Claims (Fakten, die Belege brauchen)
- Claim: ...
  - Quelle: (siehe manuscript/_research/claims.md)
'

write_if_missing "$PROJECT_ROOT/manuscript/_blueprints/pattern.blueprint.md" \
'---
type: pattern-blueprint
id: ""
name: ""
status: blueprint
---

# Pattern Name
...

## Intent
- Welches Problem löst das Pattern?

## Context
- In welchen Situationen passt es?

## Forces / Trade-offs
- Welche Spannungen gibt es?

## Solution
- Lösung in klaren Schritten.

## Constraints
- Was muss gelten, damit es funktioniert?

## Implementation Notes
- Hinweise, Anti-Patterns, typische Fehler.

## Example (minimal)
- Prompt/Schema/Interface – so klein wie möglich.

## Checklist
- [ ] ...
- [ ] ...

## Consequences
- Positive
- Negative
'

write_if_missing "$PROJECT_ROOT/manuscript/_blueprints/case-study.blueprint.md" \
'---
type: case-study-blueprint
id: ""
title: ""
status: blueprint
---

# Kontext
- Branche/Teamgröße/System (fiktiv oder anonymisiert)

# Problem
- Was ist kaputt / teuer / riskant?

# Ziel
- Welche Outcome-Metrik zählt?

# Ansatz (PDD)
1. ...
2. ...
3. ...

# Artefakte
- Prompts:
- Contracts:
- Tests:

# Ergebnis
- Was hat sich verbessert?

# Lessons Learned
- 3–7 Punkte

# Checklist
- [ ] ...
- [ ] ...
'

write_if_missing "$PROJECT_ROOT/manuscript/_blueprints/scene.blueprint.md" \
'---
type: scene-blueprint
id: ""
title: ""
status: blueprint
---

# Zweck der Szene
- Warum existiert sie im Buch? (Erklärung, Emotion, Kontrast, Humor, Verdichtung)

# Figuren / Rollen (optional)
- ...

# Setting
- Ort / Zeitpunkt / Atmosphäre

# Konflikt
- Was steht auf dem Spiel?

# Beat Sheet (kurz)
1. Einstieg
2. Eskalation
3. Erkenntnis
4. Abschluss

# Technischer Kern (1 Satz)
- Welche Idee/These soll hängen bleiben?

# Takeaway
- 1–3 Bulletpoints
'

# --- Research ---
write_if_missing "$PROJECT_ROOT/manuscript/_research/sources.md" \
'# Sources

Format:
- Titel
- Link
- Abrufdatum
- Notiz (warum relevant)

## Seed
- (TBD)
'

write_if_missing "$PROJECT_ROOT/manuscript/_research/claims.md" \
'# Claims (Behauptungen + Belege)

Ziel: Trenne These/Meinung von nachprüfbaren Behauptungen.

Format:
- ID: CLAIM-0001
- Statement:
- Kategorie: (Fakt / Markt / Historie / Recht / Metrik)
- Relevante Kapitel:
- Quelle(n):
- Abrufdatum:
- Notes:

## Claims
- CLAIM-0001
  - Statement: "..."
  - Kategorie: Fakt
  - Kapitel: ...
  - Quellen: ...
  - Abrufdatum: ...
  - Notes: ...
'

write_if_missing "$PROJECT_ROOT/manuscript/_research/market-notes.md" \
'# Market Notes

Ziel: Abgrenzung, Begriffe, Konkurrenz, Positionierung.

## Begriffe
- PDD
- Prompt Engineering
- AI-assisted development
- Governance, Audit Trails

## Differenzierung (Arbeitsnotizen)
- Fokus auf Architektur & Governance
- Buchsystem als PDD-Beweis
'

# --- Prompts ---
write_if_missing "$PROJECT_ROOT/manuscript/_prompts/chapter-draft.prompt.md" \
'# Prompt: Chapter Draft

## Intent
Erzeuge einen **ersten Rohentwurf** für ein Kapitel basierend auf einem Blueprint.
Nicht glätten, nicht marketen. Struktur strikt einhalten.

## Input
- Chapter Blueprint (manuscript/_blueprints/chapter.blueprint.md ausgefüllt)
- Optional: relevante Claims + Glossar-Auszüge

## Output (strict)
1) Frontmatter (id/title/part/status)
2) Kapiteltext mit:
   - TL;DR
   - Kernthese
   - Beispiel/Case/Szene
   - Snippets (max 2–3)
   - Checkliste (5–8)
   - Takeaways (3–7)
   - Offene Fragen (optional)

## Rules
- Keine Tools bewerben.
- Keine erfundenen Fakten. Unklare Fakten als TODO markieren + Claim erzeugen.
- Ton: klar, pragmatisch, nicht glatt.
'

write_if_missing "$PROJECT_ROOT/manuscript/_prompts/critic.prompt.md" \
'# Prompt: Critic / Reviewer

## Intent
Bewerte einen Kapitel-Entwurf gegen:
- Blueprint
- Style Guide
- Kapitel-DoD
- Claims/Quellen-Disziplin

## Output
- Score (0–10)
- Top 5 Probleme (priorisiert)
- Konkrete Fix-Vorschläge (so klein wie möglich)
- Liste fehlender Claims/Quellen
- Hinweise auf Widersprüche zum Glossar
'

write_if_missing "$PROJECT_ROOT/manuscript/_prompts/style-enforcer.prompt.md" \
'# Prompt: Style Enforcer

## Intent
Korrigiere nur:
- Orthografie
- Interpunktion
- minimale Grammatikfehler

Wichtig:
- Stimme nicht glätten.
- Satzrhythmus nicht „perfektionieren“.
- Keine Umformulierungen, wenn nicht nötig.

## Output
- Der gleiche Text, nur korrigiert.
- Optional: Liste der wichtigsten Korrekturen (kurz).
'

write_if_missing "$PROJECT_ROOT/manuscript/_prompts/schema.prompt.md" \
'# Prompt: Schema Prompt (Contracts)

## Intent
Erzeuge ein **Prompt-Contract-Schema** für wiederholbare Aufgaben im PDD-Kontext.

## Required fields (output)
- intent
- context
- constraints (must / must not)
- inputs
- outputs (schema)
- validation (tests / checks)
- examples (minimal)
- anti-patterns

## Rules
- So wenig wie möglich, so präzise wie nötig.
- Keine tool-spezifischen Annahmen.
'

# --- Worklog ---
write_if_missing "$PROJECT_ROOT/manuscript/_worklog/2026-02-25.md" \
'# work.log – 2026-02-25

## Session Goal
- Repo-Skeleton anlegen
- Meta/Blueprints/Prompts initialisieren

## Notes
- ...

## Decisions
- Source: /manuscript
- Publish: /docs (GitHub Pages)
- TOC as single source of truth
'

# --- Frontmatter skeletons ---
write_if_missing "$PROJECT_ROOT/manuscript/00-frontmatter/00-title.md" \
'---
id: 00-title
title: "The PDD Manifesto"
part: "Frontmatter"
status: draft
---

# The PDD Manifesto

**Software-Architektur in der Ära generativer KI**

> Warum Prompts der neue Quellcode sind –  
> und wie wir Systeme entwerfen, die nicht altern.
'

write_if_missing "$PROJECT_ROOT/manuscript/00-frontmatter/01-preface.md" \
'---
id: 01-preface
title: "Vorwort"
part: "Frontmatter"
status: draft
---

# Vorwort

Warum dieses Buch existiert.
- Kontext
- Motivation
- Versprechen an die Leser:innen
'

write_if_missing "$PROJECT_ROOT/manuscript/00-frontmatter/02-how-to-read.md" \
'---
id: 02-how-to-read
title: "Wie du dieses Buch liest"
part: "Frontmatter"
status: draft
---

# Wie du dieses Buch liest

- Für wen ist es?
- Was ist es nicht?
- Konventionen (Status, Snippets, Checklisten, Claims)
'

# --- Chapter skeletons (empty but structured) ---
chapter_stub() {
  local path="$1"
  local id="$2"
  local title="$3"
  local part="$4"
  write_if_missing "$path" \
"---
id: $id
title: \"$title\"
part: \"$part\"
status: draft
---

# $title

## TL;DR
- ...

## Kernthese
...

## Beispiel / Szene / Case Study
...

## Snippets (max 2–3)
- ...

## Checkliste
- [ ] ...
- [ ] ...

## Takeaways
- ...

## Offene Fragen (optional)
- ...
"
}

chapter_stub "$PROJECT_ROOT/manuscript/01-krise-klassik/01-ende-der-tippgeschwindigkeit.md" \
"01-ende-der-tippgeschwindigkeit" \
"Das Ende der Tipp-Geschwindigkeit" \
"Teil I: Die Krise der klassischen Entwicklung"

chapter_stub "$PROJECT_ROOT/manuscript/01-krise-klassik/02-technical-debt-bitrot.md" \
"02-technical-debt-bitrot" \
"Technical Debt & Bit Rot" \
"Teil I: Die Krise der klassischen Entwicklung"

chapter_stub "$PROJECT_ROOT/manuscript/01-krise-klassik/03-vibe-coding-vs-engineering.md" \
"03-vibe-coding-vs-engineering" \
"Vibe Coding vs. Engineering" \
"Teil I: Die Krise der klassischen Entwicklung"

chapter_stub "$PROJECT_ROOT/manuscript/02-pdd-framework/01-prompt-als-spezifikation.md" \
"01-prompt-als-spezifikation" \
"Der Prompt als Spezifikation" \
"Teil II: Das PDD-Framework (Die Methode)"

chapter_stub "$PROJECT_ROOT/manuscript/02-pdd-framework/02-prompt-architektur.md" \
"02-prompt-architektur" \
"Strukturierte Prompt-Architektur" \
"Teil II: Das PDD-Framework (Die Methode)"

chapter_stub "$PROJECT_ROOT/manuscript/02-pdd-framework/03-der-pdd-loop.md" \
"03-der-pdd-loop" \
"Der PDD-Loop" \
"Teil II: Das PDD-Framework (Die Methode)"

chapter_stub "$PROJECT_ROOT/manuscript/03-architektur-patterns/01-disposable-code.md" \
"01-disposable-code" \
"Disposable Code (Wegwerf-Code)" \
"Teil III: Architektur & Patterns"

chapter_stub "$PROJECT_ROOT/manuscript/03-architektur-patterns/02-decoupling-by-intent.md" \
"02-decoupling-by-intent" \
"Decoupling by Intent" \
"Teil III: Architektur & Patterns"

chapter_stub "$PROJECT_ROOT/manuscript/03-architektur-patterns/03-prompt-versionierung.md" \
"03-prompt-versionierung" \
"Prompt-Versionierung" \
"Teil III: Architektur & Patterns"

chapter_stub "$PROJECT_ROOT/manuscript/04-mensch-im-loop/01-architect-of-intent.md" \
"01-architect-of-intent" \
"Vom Coder zum Architect of Intent" \
"Teil IV: Der Mensch im Loop (New Work)"

chapter_stub "$PROJECT_ROOT/manuscript/04-mensch-im-loop/02-qs-2-0.md" \
"02-qs-2-0" \
"Qualitätssicherung 2.0" \
"Teil IV: Der Mensch im Loop (New Work)"

chapter_stub "$PROJECT_ROOT/manuscript/04-mensch-im-loop/03-effizienz-metriken.md" \
"03-effizienz-metriken" \
"Effizienz-Metriken" \
"Teil IV: Der Mensch im Loop (New Work)"

chapter_stub "$PROJECT_ROOT/manuscript/05-praxis-ausblick/01-legacy-migration.md" \
"01-legacy-migration" \
"Legacy-Migration" \
"Teil V: Praxisfälle & Ausblick"

chapter_stub "$PROJECT_ROOT/manuscript/05-praxis-ausblick/02-zukunft-der-programmierung.md" \
"02-zukunft-der-programmierung" \
"Die Zukunft der Programmierung" \
"Teil V: Praxisfälle & Ausblick"

chapter_stub "$PROJECT_ROOT/manuscript/05-praxis-ausblick/03-ethik-verantwortung.md" \
"03-ethik-verantwortung" \
"Ethik & Verantwortung" \
"Teil V: Praxisfälle & Ausblick"

# --- Backmatter skeletons ---
write_if_missing "$PROJECT_ROOT/manuscript/_backmatter/backcover-blurb.md" \
'# Backcover Blurb (Draft)

Die Ära generativer KI verändert nicht nur Tools — sie verändert, wie wir Software denken.
In *The PDD Manifesto* zeigt Benjamin, warum Prompts zum neuen Quellcode werden und wie Teams Systeme bauen, die sich regenerieren lassen statt zu verrotten.
Mit Patterns, Checklisten und Fallstudien ist dieses Buch ein Leitfaden für Architekt:innen, die langlebige KI-Systeme entwerfen wollen.
'

write_if_missing "$PROJECT_ROOT/manuscript/_backmatter/elevator-pitch.md" \
'# Elevator Pitch (Draft)

Ein pragmatischer Architektur-Leitfaden, der Prompt Engineering auf Systemebene bringt:
Methoden, Patterns und Governance, damit Teams KI-gestützte Software sicher, reproduzierbar und wartungsarm betreiben können.
'

write_if_missing "$PROJECT_ROOT/manuscript/_backmatter/about-the-author.md" \
'# About the Author (Draft)

Kurzbio (1–2 Absätze).
- Hintergrund
- Fokus
- Warum dieses Thema
'

write_if_missing "$PROJECT_ROOT/manuscript/_backmatter/resources.md" \
'# Resources (Draft)

- Papers / Essays
- Tools (nur wenn wirklich nötig)
- Communities
- Further reading
'

# --- docs skeleton ---
write_if_missing "$PROJECT_ROOT/docs/index.html" \
'<!doctype html>
<html lang="de">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <title>The PDD Manifesto</title>
  <link rel="stylesheet" href="./assets/book.css" />
</head>
<body>
  <main>
    <h1>The PDD Manifesto</h1>
    <p>Build Output. Quelle: <code>/manuscript</code>. Diese Seite wird später vom Build-Skript erzeugt.</p>
  </main>
</body>
</html>
'

write_if_missing "$PROJECT_ROOT/docs/assets/book.css" \
'/* Minimal placeholder. Keep it boring until content exists. */
:root { color-scheme: light dark; }
body { font-family: system-ui, -apple-system, Segoe UI, Roboto, sans-serif; line-height: 1.5; margin: 2rem; }
code { font-family: ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas, "Liberation Mono", monospace; }
'

# --- templates skeleton ---
write_if_missing "$PROJECT_ROOT/templates/page.html" \
'<!doctype html>
<html lang="{{lang}}">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <title>{{title}} — {{book_title}}</title>
  <link rel="stylesheet" href="{{base}}assets/book.css" />
</head>
<body>
  <header>
    <a href="{{base}}index.html">{{book_title}}</a>
  </header>

  <main>
    {{content}}
  </main>

  <footer>
    <small>Generated from Markdown. Source of Truth: /manuscript</small>
  </footer>
</body>
</html>
'

write_if_missing "$PROJECT_ROOT/templates/index.html" \
'<!doctype html>
<html lang="{{lang}}">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <title>{{book_title}}</title>
  <link rel="stylesheet" href="./assets/book.css" />
</head>
<body>
  <main>
    <h1>{{book_title}}</h1>
    <p>{{subtitle}}</p>
    <nav>
      <ul>
        {{toc}}
      </ul>
    </nav>
  </main>
</body>
</html>
'

# --- scripts skeleton ---
write_if_missing "$PROJECT_ROOT/scripts/build.js" \
'/**
 * build.js (placeholder)
 * Goal: Render /manuscript Markdown to /docs static HTML WITHOUT Jekyll.
 *
 * Planned steps:
 * - Read manuscript/_meta/book.yml + toc.yml
 * - For each chapter: render Markdown -> HTML
 * - Wrap with templates/page.html
 * - Write to docs/chapters/...
 * - Generate docs/index.html from templates/index.html
 *
 * Keep it simple. Reproducible > fancy.
 */
console.log("build.js placeholder. Implement when ready.");
'

write_if_missing "$PROJECT_ROOT/scripts/serve.js" \
'/**
 * serve.js (placeholder)
 * Minimal static server for /docs preview.
 */
console.log("serve.js placeholder. Use any static server for now (python -m http.server).");
'

write_if_missing "$PROJECT_ROOT/scripts/check.js" \
'/**
 * check.js (placeholder)
 * Linting for books:
 * - Ensure every chapter in toc exists
 * - Ensure chapter frontmatter includes status
 * - Ensure blueprint exists before marking review/final
 * - Optionally check glossary usage, claims referencing, link validity
 */
console.log("check.js placeholder. Implement quality gates when ready.");
'

# --- llms.txt ---
write_if_missing "$PROJECT_ROOT/llms.txt" \
'Project: The PDD Manifesto (Book Repository)
Language: German (de)
Format: Markdown source -> static HTML output (GitHub Pages /docs)
No Jekyll. No CMS. No magic.

# 1) Intent
This repository is a book project about Prompt-Driven Development (PDD):
- Prompts as specifications/contracts (not vibes)
- Architecture & patterns for AI-assisted systems
- Governance, reproducibility, validation, responsibility
The repository itself must demonstrate these principles: structured artifacts, versioned prompts, explicit constraints, auditable claims.

# 2) Repository Architecture (Source vs Publish)
- /manuscript = SOURCE OF TRUTH (Markdown, blueprints, prompts, research, worklog)
- /docs       = BUILD OUTPUT (static HTML served by GitHub Pages)
- /templates  = HTML templates for rendering
- /scripts    = build/check tooling (simple, reproducible)

Never edit /docs manually (except initial placeholders). It is generated.

# 3) Single Source of Truth: TOC
- manuscript/_meta/toc.yml defines the only valid chapter order and navigation.
- Anything else (index, nav, chapter links) is derived.

# 4) Workflow Rules (Non-negotiable)
1) One chapter = one feature branch.
2) Blueprint first: no chapter writing without a blueprint.
3) Status-driven writing: draft -> review -> final (per chapter frontmatter).
4) Prompts are versioned like code (diffable, reviewable).
5) If something sounds like a fact, create a Claim.

# 5) Chapter Format (Expected Structure)
Each chapter file must start with YAML frontmatter:
- id, title, part, status

Then the body must contain:
- TL;DR (3–6 bullets)
- Kernthese (2–5 sentences)
- Example/Scene/Case Study
- Snippets (max 2–3)
- Checklist (5–8 items)
- Takeaways (3–7 bullets)
- Optional: Offene Fragen

Do not over-polish. Preserve author voice. Avoid marketing language.

# 6) Blueprints (Planning Artifacts)
Blueprints live in manuscript/_blueprints:
- chapter.blueprint.md
- pattern.blueprint.md
- case-study.blueprint.md
- scene.blueprint.md

Blueprints define intent, structure, checklist, takeaways, and claims before prose.

# 7) Research & Claims Discipline
- manuscript/_research/claims.md stores factual statements that require sources.
- manuscript/_research/sources.md stores sources with retrieval date and relevance notes.
Rule: Do not invent facts. If unsure, mark TODO and add a claim entry.

# 8) Prompts (First-Class Artifacts)
Prompts live in manuscript/_prompts and are part of the book system.
They must follow the style guide and repository rules.
Key prompts:
- chapter-draft.prompt.md
- critic.prompt.md
- style-enforcer.prompt.md
- schema.prompt.md

# 9) Voice / Style Constraints
- Clear, pragmatic, sometimes dry/humorous, but not glossy.
- German, technical, no buzzword soup.
- Gendered language: default to Entwickler:innen.
- Preserve sentence rhythm; only correct typos if asked (style-enforcer prompt exists).

# 10) What an LLM should do when asked for help
- Ask for the relevant artifact (blueprint, chapter draft, claims list) and operate on it.
- Produce small, testable improvements aligned with the Definition of Done.
- Prefer minimal steps: what is the smallest next deliverable?
- If resetting: start by reading /manuscript/_meta/* and /llms.txt, then proceed with toc -> blueprint -> chapter.

# 11) Non-goals
- Do not introduce a site generator framework.
- Do not redesign CSS/themes early.
- Do not expand scope with marketing plans unless explicitly requested.
'

echo ""
echo "✅ Bootstrap completed in: $PROJECT_ROOT"
echo "Next suggested steps:"
echo "  1) cd $PROJECT_ROOT"
echo "  2) git init && git add . && git commit -m 'chore: bootstrap manuscript skeleton'"
echo "  3) Create first chapter blueprint, then draft Chapter 1."