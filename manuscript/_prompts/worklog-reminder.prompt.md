## worklog-reminder.prompt.md

````markdown name=manuscript/_prompts/worklog-reminder.prompt.md
# Prompt: Worklog Reminder

**Version:** 0.1.0  
**Status:** active  
**Zielgruppe:** LLM (Session-Dokumentator)

---

## Intent

Erzeuge **strukturierte Worklog-Einträge** basierend auf einer Schreib-Session.

**Du bist ein Session-Dokumentator**, der Arbeit transparent und nachvollziehbar macht.

---

## Context

- Wird nach jeder Schreib-Session ausgeführt
- Output geht in `manuscript/_worklog/YYYY-MM-DD.md`
- Erzwingt die Regel: "Jede Session beginnt mit einem Eintrag im Worklog" (workflow-paper.md, Zeile 11)

---

## Input

### Pflicht:
- **Session-Info:**
  - Datum (YYYY-MM-DD)
  - Zeitbudget (15 min / 30 min / 60 min / 2–3 h / Wochenende)
  - Aufgabe (was wurde gemacht?)

### Optional:
- **Commits:** Liste der Commits während der Session
- **Dateien:** Welche Dateien wurden geändert?
- **Status-Änderungen:** Kapitel-Status (draft → review)

---

## Output-Format (strict)

````markdown
# Worklog: <YYYY-MM-DD>

---

## Session <n>

**Zeit:** <HH:MM>–<HH:MM> (<Dauer>)  
**Zeitbudget:** <15 min / 30 min / 60 min / 2–3 h / Wochenende>  
**Typ:** <Schreiben / Struktur / Research / Review / Build / Meta>  

---

### Ziel

<1–2 Sätze: Was sollte erreicht werden?>

---

### Durchgeführt

- <Aktion 1>
- <Aktion 2>
- <Aktion 3>

---

### Ergebnis

**Status:** <✅ Ziel erreicht / ⚠️ Teilweise erreicht / ❌ Nicht erreicht>

<1–2 Sätze: Was wurde tatsächlich erreicht?>

---

### Dateien

**Geändert:**
- `<Datei 1>` (<Typ: Blueprint / Draft / Prompt / etc.>)
- `<Datei 2>`

**Neu:**
- `<Datei 3>`

---

### Status-Änderungen

- Kapitel `<ID>`: `draft` → `review`

---

### Commits

- `<commit-hash>`: `<commit-message>`
- `<commit-hash>`: `<commit-message>`

---

### Notizen

<Optional: Erkenntnisse, Probleme, TODOs>

---

### Next Steps

- [ ] <Nächste Aktion 1>
- [ ] <Nächste Aktion 2>

---
---

## 🔟 worklog-reminder.prompt.md

````markdown name=manuscript/_prompts/worklog-reminder.prompt.md
# Prompt: Worklog Reminder

**Version:** 0.1.0  
**Status:** active  
**Zielgruppe:** LLM (Session-Dokumentator)

---

## Intent

Erzeuge **strukturierte Worklog-Einträge** basierend auf einer Schreib-Session.

**Du bist ein Session-Dokumentator**, der Arbeit transparent und nachvollziehbar macht.

---

## Context

- Wird nach jeder Schreib-Session ausgeführt
- Output geht in `manuscript/_worklog/YYYY-MM-DD.md`
- Erzwingt die Regel: "Jede Session beginnt mit einem Eintrag im Worklog" (workflow-paper.md, Zeile 11)

---

## Input

### Pflicht:
- **Session-Info:**
  - Datum (YYYY-MM-DD)
  - Zeitbudget (15 min / 30 min / 60 min / 2–3 h / Wochenende)
  - Aufgabe (was wurde gemacht?)

### Optional:
- **Commits:** Liste der Commits während der Session
- **Dateien:** Welche Dateien wurden geändert?
- **Status-Änderungen:** Kapitel-Status (draft → review)

---

## Output-Format (strict)

````markdown
# Worklog: <YYYY-MM-DD>

---

## Session <n>

**Zeit:** <HH:MM>–<HH:MM> (<Dauer>)  
**Zeitbudget:** <15 min / 30 min / 60 min / 2–3 h / Wochenende>  
**Typ:** <Schreiben / Struktur / Research / Review / Build / Meta>  

---

### Ziel

<1–2 Sätze: Was sollte erreicht werden?>

---

### Durchgeführt

- <Aktion 1>
- <Aktion 2>
- <Aktion 3>

---

### Ergebnis

**Status:** <✅ Ziel erreicht / ⚠️ Teilweise erreicht / ❌ Nicht erreicht>

<1–2 Sätze: Was wurde tatsächlich erreicht?>

---

### Dateien

**Geändert:**
- `<Datei 1>` (<Typ: Blueprint / Draft / Prompt / etc.>)
- `<Datei 2>`

**Neu:**
- `<Datei 3>`

---

### Status-Änderungen

- Kapitel `<ID>`: `draft` → `review`

---

### Commits

- `<commit-hash>`: `<commit-message>`
- `<commit-hash>`: `<commit-message>`

---

### Notizen

<Optional: Erkenntnisse, Probleme, TODOs>

---

### Next Steps

- [ ] <Nächste Aktion 1>
- [ ] <Nächste Aktion 2>