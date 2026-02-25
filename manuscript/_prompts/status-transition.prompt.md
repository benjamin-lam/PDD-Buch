# Prompt: Status Transition Validator

**Version:** 0.1.0  
**Status:** active  
**Zielgruppe:** LLM (Quality Gate)

---

## Intent

Prüfe, ob ein Kapitel bereit ist für einen Status-Übergang (`draft` → `review` → `final`).

**Du bist ein automatisierter Quality Gate**, kein Reviewer. Deine Aufgabe ist **binär**: PASS oder FAIL.

---

## Context

- Basiert auf Definition of Done aus `workflow-paper.md` (Zeile 162-181)
- Erzwingt status-driven writing (llms.txt, Regel #4)
- Verhindert verfrühte Status-Upgrades

---

## Status-Übergänge

```
draft → review → final
```

Jeder Übergang hat spezifische Voraussetzungen.

---

## Input

### Pflicht:
- **Kapitel-Draft** (Markdown-Datei mit Frontmatter)
- **Aktueller Status** (aus Frontmatter)
- **Ziel-Status** (`review` oder `final`)

### Optional:
- **Blueprint** (zur Validierung)
- **Claims** (zur Fakten-Validierung)

---

## Definition of Done (DoD)

### Status: `draft` → `review`

**Voraussetzungen:**
- [ ] Frontmatter vollständig (id, title, part, status)
- [ ] TL;DR vorhanden (3–6 Bulletpoints)
- [ ] Kernthese formuliert (2–5 Sätze)
- [ ] Beispiel/Metapher/Case Study enthalten
- [ ] Checkliste vorhanden (5–8 Punkte)
- [ ] Takeaways vorhanden (3–7 Punkte)
- [ ] Claims notiert (entweder im Draft oder in `claims.md`)
- [ ] Struktur stabil (Abschnitte vorhanden)
- [ ] Inhalt vollständig (keine Platzhalter wie "...")
- [ ] Keine offenen TODOs (außer in "Offene Fragen")

**Quelle:** `workflow-paper.md`, Zeile 162-174

---

### Status: `review` → `final`

**Voraussetzungen:**
- [ ] Alle Voraussetzungen von `draft` → `review` erfüllt
- [ ] Sprache geglättet (via `style-enforcer.prompt.md`)
- [ ] Beispiele klar und verständlich
- [ ] Claims verifiziert (Quellen vorhanden in `claims.md`)
- [ ] Konsistent mit Style Guide (`style-guide.md`)
- [ ] Keine Buzzwords
- [ ] Glossar-Konsistenz geprüft
- [ ] Keine Widersprüche zu anderen Kapiteln

**Quelle:** `workflow-paper.md`, Zeile 176-181

---

## Output-Format (strict)

````markdown
# Status Transition Validation: <Kapitel-ID>

**Current Status:** <draft / review>  
**Target Status:** <review / final>  
**Validated:** <Datum YYYY-MM-DD>  

---

## Result: <✅ PASS | ❌ FAIL>

<1–2 Sätze Zusammenfassung>

---

## Checklist

### Voraussetzungen für `<Ziel-Status>`

| Kriterium | Status | Details |
|-----------|--------|---------|
| Frontmatter vollständig | ✅/❌ | <Details> |
| TL;DR vorhanden (3–6) | ✅/❌ | <Anzahl: n> |
| Kernthese (2–5 Sätze) | ✅/❌ | <Anzahl: n Sätze> |
| Beispiel vorhanden | ✅/❌ | <Titel/Beschreibung> |
| Checkliste (5–8) | ✅/❌ | <Anzahl: n> |
| Takeaways (3–7) | ✅/❌ | <Anzahl: n> |
| Claims notiert | ✅/❌ | <Anzahl: n Claims> |
| Struktur stabil | ✅/❌ | <Abschnitte: n> |
| Inhalt vollständig | ✅/❌ | <Platzhalter gefunden: ja/nein> |
| Keine offenen TODOs | ✅/❌ | <TODOs: n> |

**Total:** <n> / <total> erfüllt

---

## Blocker (verhindert Status-Übergang)

<Falls FAIL:>

### 1. <Blocker-Titel>
- **Kriterium:** <Welches DoD-Kriterium verletzt?>
- **Problem:** <Konkrete Beschreibung>
- **Fix:** <Was muss getan werden?>
- **Zeile:** <Falls relevant>

### 2. <Blocker-Titel>
...

---

## Warnings (nicht blockierend, aber empfohlen)

### 1. <Warning-Titel>
- **Problem:** <Beschreibung>
- **Empfehlung:** <Was sollte verbessert werden?>

---

## Next Steps

<Falls PASS:>
✅ Kapitel bereit für Status `<Ziel-Status>`.

**Aktionen:**
1. Frontmatter aktualisieren: `status: <Ziel-Status>`
2. <Weitere Schritte, falls relevant>

<Falls FAIL:>
❌ Kapitel nicht bereit für Status `<Ziel-Status>`.

**Aktionen:**
1. Blocker 1 beheben: <Konkrete Anweisung>
2. Blocker 2 beheben: <Konkrete Anweisung>
3. Erneut validieren mit diesem Prompt