# Architektur des Buchsystems „The PDD Manifesto“

Dieses Dokument beschreibt die Architektur des Repositorys, das zur Erstellung des Buches „The PDD Manifesto“ verwendet wird.  
Das Repo selbst ist ein praktisches Beispiel für Prompt‑Driven Development (PDD):  
strukturierte Artefakte, reproduzierbare Prozesse, versionierte Prompts, explizite Regeln.

---

# 1. Ziele der Architektur

Die Architektur des Repos verfolgt vier Kernziele:

1. **Reproduzierbarkeit**  
   Jeder Build des Buches muss deterministisch aus den Quellen erzeugbar sein.

2. **Transparenz**  
   Alle Entscheidungen, Prompts, Quellen und Änderungen sind nachvollziehbar.

3. **Trennung von Quelle und Artefakt**  
   Schreiben (Markdown) und Veröffentlichen (HTML) sind strikt getrennt.

4. **PDD‑Konformität**  
   Das Repo demonstriert die Prinzipien, die das Buch beschreibt.

---

# 2. High-Level-Architektur

```txt
pdd-manifesto/
├── manuscript/     # Source of Truth (Markdown)
├── docs/           # Build Output (HTML)
├── templates/      # HTML-Templates
└── scripts/        # Build- und Check-Tools
```

**manuscript/** ist das Herzstück des Systems.  
**docs/** ist ein reines Artefakt und wird aus manuscript generiert.  
**templates/** definiert das Layout der HTML-Ausgabe.  
**scripts/** enthält die minimalen Tools für Build und Checks.

---

# 3. Artefakt-Typen

## 3.1 Manuskript (Markdown)
Alle Inhalte des Buches liegen in `manuscript/`:

- Kapitel
- Frontmatter
- Backmatter
- Blueprints
- Prompts
- Research
- Glossar
- Worklog
- Metadaten

Markdown ist bewusst gewählt:  
leichtgewichtig, diffbar, versionierbar.

---

## 3.2 Metadaten
`manuscript/_meta/` enthält:

- **book.yml** – Titel, Untertitel, Edition, Autor
- **toc.yml** – *Single Source of Truth* für Kapitelreihenfolge
- **style-guide.md** – Ton, Regeln, Begriffe
- **glossary.md** – definierte Fachbegriffe
- **positioning.md** – Zielgruppe, USP
- **architecture.md** – dieses Dokument
- **changelog.md** – menschlich lesbare Änderungen

**Wichtig:**  
`toc.yml` ist die einzige gültige Quelle für die Struktur des Buches.

---

## 3.3 Blueprints
`manuscript/_blueprints/` enthält strukturelle Vorlagen:

- chapter.blueprint.md
- pattern.blueprint.md
- case-study.blueprint.md
- scene.blueprint.md

Blueprints definieren **Intent vor Text**.  
Kein Kapitel darf ohne Blueprint begonnen werden.

---

## 3.4 Prompts
`manuscript/_prompts/` enthält versionierte Prompts:

- chapter-draft
- critic
- style-enforcer
- schema

Prompts sind **First-Class-Artifacts**.  
Sie werden versioniert, reviewed und wie Code behandelt.

---

## 3.5 Research & Claims
`manuscript/_research/` enthält:

- **claims.md** – Behauptungen, die Quellen benötigen
- **sources.md** – Quellen mit Datum und Relevanz
- **market-notes.md** – Marktbeobachtungen

Regel:  
Wenn etwas wie ein Fakt klingt → Claim anlegen.

---

## 3.6 Worklog
`manuscript/_worklog/` dokumentiert jede Session.  
Es dient als:

- Transparenzinstrument
- Fortschrittsprotokoll
- Selbstdisziplin

---

# 4. Build-Architektur

Der Build ist bewusst minimalistisch:

```txt
manuscript/*.md
    ↓ (scripts/build.js)
templates/page.html
    ↓
docs/ (HTML)
```

**scripts/build.js** übernimmt:

- Markdown → HTML
- Einbettung der Templates
- Kopieren von Assets
- Generieren der Navigation aus `toc.yml`

**docs/** wird committed und von GitHub Pages ausgeliefert.

---

# 5. Workflow-Architektur

Der Workflow folgt PDD-Prinzipien:

## 5.1 Branching
- `main` → veröffentlichter Stand
- `feat/<kapitel-id>-<task>` → jede Schreibeinheit

## 5.2 Status pro Kapitel
- `draft`
- `review`
- `final`

Status steht im Frontmatter und steuert den Workflow.

## 5.3 Definition of Done
Ein Kapitel ist „draft done“, wenn:

- Frontmatter vollständig
- TL;DR
- Kernthese
- Beispiel
- Checkliste
- Takeaways
- Claims notiert

---

# 6. Designentscheidungen

## 6.1 Kein Jekyll, kein CMS
Begründung:

- volle Kontrolle
- reproduzierbare Builds
- keine versteckte Magie
- minimaler Overhead

## 6.2 Markdown als Source of Truth
Begründung:

- diffbar
- portabel
- langlebig
- LLM‑freundlich

## 6.3 Prompts als Artefakte
Begründung:

- PDD-Demonstration
- Reproduzierbarkeit
- Auditierbarkeit

## 6.4 TOC als Single Source of Truth
Begründung:

- klare Struktur
- deterministische Builds
- keine Drift zwischen Kapiteln und Navigation

---

# 7. Prinzipien der Systemarchitektur

1. **Explizit vor implizit**
2. **Struktur vor Inhalt**
3. **Blueprint vor Prosa**
4. **Kleine Schritte vor großen Sprüngen**
5. **Versionierung vor Perfektion**
6. **Reproduzierbarkeit vor Geschwindigkeit**
7. **Transparenz vor Komfort**

---

# 8. Erweiterbarkeit

Die Architektur erlaubt:

- PDF/EPUB‑Export
- Suche
- Dark Mode
- automatisierte Tests für Prompts
- CI‑Builds
- Editionsverwaltung

Ohne die Grundstruktur zu verändern.

---

# 9. Fazit

Dieses Repository ist nicht nur ein Ort, an dem ein Buch entsteht.  
Es ist ein **PDD‑System**, das zeigt, wie man:

- mit Prompts arbeitet
- mit Artefakten denkt
- mit Versionierung schreibt
- mit Architektur publiziert

Das Buch entsteht nicht *trotz* dieser Struktur –  
es entsteht **durch** sie.
es entsteht **durch** sie.