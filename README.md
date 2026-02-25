# The PDD Manifesto
**Software-Architektur in der Ära generativer KI**

> Warum Prompts der neue Quellcode sind –  
> und wie wir Systeme entwerfen, die nicht altern.

---

## 📘 Was ist dieses Repository?

Dies ist das öffentliche Buchprojekt **„The PDD Manifesto“**.  
Das Buch entsteht wie Software:

- geschrieben in **Markdown**
- versioniert mit **Git**
- strukturiert durch **Blueprints**
- unterstützt durch **Prompts als Artefakte**
- veröffentlicht als **statisches HTML** über GitHub Pages

**Kein Jekyll. Kein CMS. Keine Magie.**  
Nur klare Architektur und reproduzierbare Prozesse.

---

## 🧱 Repository-Architektur

| Ordner | Bedeutung |
|--------|-----------|
| `/manuscript` | **Source of Truth** – Kapitel, Blueprints, Prompts, Research, Worklog |
| `/docs` | **Build Output** – generiertes HTML (GitHub Pages) |
| `/templates` | HTML-Templates für den Build |
| `/scripts` | Build- und Check-Tools |

**Regel:** `/docs` wird niemals manuell editiert.

---

## 🧭 Prinzipien (Workflow)

1. **One Chapter = One Feature Branch**  
   Jede Schreibeinheit ist ein Branch. Keine Ausnahmen.

2. **Blueprint first**  
   Kein Kapitel ohne strukturellen Plan. Architektur vor Prosa.

3. **Status-driven writing**  
   `draft → review → final`  
   Perfektion ist kein Kriterium für Veröffentlichung.

4. **TOC ist die einzige Wahrheit**  
   `manuscript/_meta/toc.yml` definiert die Struktur des Buches.

5. **Prompts sind First-Class-Artifacts**  
   Versioniert, diffbar, überprüfbar — wie Code.

---

## 🚀 Quick Start

### 1) Überblick verschaffen
- `manuscript/_meta/toc.yml` → Kapitelstruktur
- `manuscript/README.md` → Schreib-Workflow
- `CONTRIBUTING.md` → Regeln für Beiträge

### 2) Schreiben
- Blueprint öffnen oder erstellen (`manuscript/_blueprints/`)
- Feature-Branch anlegen:  
  `feat/<kapitel-id>-<task>`
- Kapitel in Markdown schreiben (`status: draft`)

### 3) Build & Publish
- `scripts/build.js` ausführen
- HTML landet in `/docs`
- Commit & Push → GitHub Pages aktualisiert sich automatisch

---

## 📚 Veröffentlichung & Editionen

- GitHub Pages dient `/docs` aus
- Editionen werden über Git Tags markiert:  
  `v0.1.0`, `v0.2.0`, `v1.0.0`, …

---

## 🤝 Beiträge

Beiträge sind willkommen — bitte lies vorher:  
👉 `CONTRIBUTING.md`  
👉 `llms.txt` (für LLM-Verhalten)

---

## 📄 Lizenz

Siehe `LICENSE`.

---

## 🧩 Hinweis

Dieses Buch ist ein **offenes Denk- und Architekturprojekt**.  
Transparenz, Iteration und Kritik sind ausdrücklich erwünscht.
