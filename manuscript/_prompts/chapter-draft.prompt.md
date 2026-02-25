# Prompt: Chapter Draft

**Version:** 0.2.0  
**Status:** active  
**Zielgruppe:** LLM (struktureller Schreibmotor)

---

## Intent

Erzeuge einen **ersten Rohentwurf** für ein Kapitel basierend auf einem vollständig ausgefüllten Blueprint.

Dieser Prompt ist **kein freies Schreiben**. Er ist eine **deterministische Transformation** von Blueprint → Draft.

### Was dieser Prompt NICHT tut:
- Glätten oder stilistisch optimieren
- Marketing-Sprache erzeugen
- Fakten erfinden
- Die Stimme des Autors überschreiben
- Kapitel ohne Blueprint schreiben

---

## Preconditions (Eingangsvalidierung)

**Bevor du beginnst, prüfe:**

1. ✅ Existiert ein ausgefüllter Blueprint (`manuscript/_blueprints/chapter.blueprint.md`)?
2. ✅ Sind alle Blueprint-Pflichtfelder ausgefüllt?
   - Kapitel-Metadaten (ID, Titel, Teil)
   - Intent
   - Kernthese
   - Struktur/Outline
   - Beispiel/Case/Szene
   - Checkliste (5–8 Punkte)
   - Takeaways (3–7 Punkte)
3. ✅ Sind Claims notiert (Blueprint Abschnitt 6)?
4. ✅ Ist der Status im Blueprint `draft`?

**Falls NEIN → STOP. Fordere die fehlenden Artefakte an.**

---

## Input

### Pflicht:
- **Chapter Blueprint** (vollständig ausgefüllt)
- **TOC** (`manuscript/_meta/toc.yml`) – zur Verortung im Buch

### Optional:
- **Claims** aus `manuscript/_research/claims.md`
- **Glossar-Auszüge** (falls relevant)
- **Style Guide** (`manuscript/_meta/style-guide.md`)
- **Vorherige Kapitel** (für Konsistenz)

---

## Output-Struktur (strict)

### 1) YAML Frontmatter
```yaml
---
id: <kapitel-id>
title: "<kapitel-titel>"
part: "<teil-name>"
status: draft
---
```

### 2) Kapitel-Überschrift
```markdown
# <Kapitel-Titel>
```

### 3) TL;DR (3–6 Bulletpoints)
**Regel:** Kompakt, technisch, ohne Füllwörter.

```markdown
## TL;DR
- Punkt 1
- Punkt 2
- Punkt 3
```

### 4) Kernthese (2–5 Sätze)
**Regel:** Präzise, architektonisch, ohne Metaphern. Die zentrale Aussage des Kapitels.

```markdown
## Kernthese
<2–5 prägnante Sätze>
```

### 5) Beispiel / Szene / Case Study
**Regel:**
- Konkret, nicht abstrakt
- Technisch oder organisatorisch greifbar
- Zeigt das Problem oder die Lösung in der Praxis
- Kein Storytelling um des Storytellings willen

```markdown
## Beispiel: <Titel der Szene>
<Szene, Case Study oder konkretes Beispiel>
```

### 6) Hauptteil (strukturiert nach Blueprint Outline)
**Regel:**
- Folge der Outline aus Blueprint Abschnitt 4
- Jeder Abschnitt hat einen klaren Zweck
- Keine Wiederholungen
- Keine Buzzwords

```markdown
## <Abschnitt 1>
<Inhalt>

## <Abschnitt 2>
<Inhalt>
```

### 7) Code-Snippets (max. 2–3)
**Regel:**
- Nur wenn im Blueprint vorgesehen
- Kommentiert, lauffähig
- Kein Pseudocode ohne Erklärung

```markdown
## Code-Beispiel: <Titel>
\```<sprache>
<code>
\```
```

### 8) Checkliste (5–8 Punkte)
**Regel:** Actionable. Was kann die Leser:in nach dem Kapitel TUN?

```markdown
## Checkliste
- [ ] Punkt 1
- [ ] Punkt 2
- [ ] Punkt 3
```

### 9) Takeaways (3–7 Punkte)
**Regel:** Die wichtigsten Erkenntnisse, komprimiert.

```markdown
## Takeaways
- Punkt 1
- Punkt 2
- Punkt 3
```

### 10) Offene Fragen (optional)
```markdown
## Offene Fragen
- Frage 1
- Frage 2
```

---

## Rules (non-negotiable)

### Voice & Style
- **Ton:** klar, direkt, technisch, architektonisch
- **Nicht:** glossy, buzzword-lastig, marketingy
- **Satzrhythmus:** Respektiere den Rhythmus des Autors (kurz/lang-Mix)
- **Gender:** Entwickler:innen, Leser:innen (Doppelpunkt)

### Fakten & Claims
- **Keine erfundenen Fakten.** Niemals.
- Wenn ein Fakt unklar ist:
   - Markiere als `[TODO: Claim prüfen]`
   - Erzeuge einen Claim-Eintrag (siehe unten)
- Keine unreferenzierten Statistiken
- Keine Zitate ohne Quelle

### Struktur
- **Strikt:** Output muss exakt der definierten Struktur folgen
- **Keine Abschnitte weglassen** (außer "Offene Fragen")
- **Keine zusätzlichen Abschnitte** hinzufügen

### Scope
- **Ein Kapitel = ein Thema**
- Nicht abschweifen
- Nicht vorgreifen auf spätere Kapitel
- Auf Blueprint beschränken

---

## Claim-Handling

**Wenn du im Draft auf Fakten/Statistiken/Forschungsergebnisse stößt:**

1. Prüfe: Ist dieser Fakt im Blueprint als Claim notiert?
2. Falls NEIN:
   - Markiere im Text: `[TODO: Claim prüfen – <Beschreibung>]`
   - Erzeuge einen Claim-Eintrag:

```markdown
### Claim: <Kurzbeschreibung>
- **Aussage:** <Was wird behauptet?>
- **Kapitel:** <Kapitel-ID>
- **Status:** ungeprüft
- **Quelle:** [TODO]
```

3. Füge am Ende des Outputs alle neuen Claims zusammen:

```markdown
---

## Neu erzeugte Claims (für manuscript/_research/claims.md)

- Claim 1
- Claim 2
```

---

## Workflow-Integration

### Nach Fertigstellung des Drafts:

1. ✅ Blueprint-Vollständigkeit prüfen
2. ✅ Alle Pflicht-Abschnitte vorhanden?
3. ✅ Claims notiert?
4. ✅ Status = `draft`
5. ✅ Frontmatter korrekt?

### Definition of Done: "draft done"

Ein Kapitel ist **"draft done"**, wenn:
- Frontmatter vollständig
- TL;DR vorhanden (3–6 Punkte)
- Kernthese formuliert (2–5 Sätze)
- Beispiel/Metapher enthalten
- Checkliste vorhanden (5–8 Punkte)
- Takeaways vorhanden (3–7 Punkte)
- Claims notiert

(Quelle: `workflow-paper.md`, Zeile 162-169)

---

## Anti-Patterns (was du NIEMALS tun darfst)

❌ Kapitel ohne Blueprint schreiben  
❌ Fakten erfinden oder „schätzen"  
❌ Stil glätten oder „verbessern"  
❌ Marketing-Sprache einfügen  
❌ Tools oder Frameworks bewerben  
❌ Struktur ignorieren oder umbauen  
❌ Buzzwords verwenden (z.B. "game-changer", "revolutionär")  
❌ Komplette Kapitel in einem Rutsch schreiben (falls nicht explizit gewünscht)

---

## Example Usage

**Input:**
```
Blueprint: manuscript/_blueprints/01-prompt-als-spezifikation.blueprint.md (ausgefüllt)
TOC: manuscript/_meta/toc.yml
```

**Output:**
```markdown
---
id: 01-prompt-als-spezifikation
title: "Der Prompt als Spezifikation"
part: "Teil II: Das PDD-Framework (Die Methode)"
status: draft
---

# Der Prompt als Spezifikation

## TL;DR
- Prompts sind keine Anfragen, sondern Verträge
- Sie definieren Intent, Constraints und Erfolgskriterien
- Reproduzierbarkeit entsteht durch Explizitheit
- Vage Prompts führen zu vagen Ergebnissen
- Spezifikation ≠ Implementierung

## Kernthese
Ein Prompt ist keine natürlichsprachliche Anfrage an ein System, sondern eine formale Spezifikation eines Outputs. Wie ein API-Vertrag definiert er Eingaben, Constraints, Ausgabeformat und Erfolgskriterien. Die Qualität des generierten Codes hängt nicht von der „Kreativität" des Modells ab, sondern von der Präzision der Spezifikation.

## Beispiel: API-Endpoint vs. Vibe-Prompt
<Szene entwickeln>

[... Rest des Kapitels]

---

## Neu erzeugte Claims

- Claim 1: "Reproduzierbarkeit entsteht durch Explizitheit" – Quelle?
- Claim 2: "Vage Prompts führen zu vagen Ergebnissen" – Messbar?
```

---

## Versionshistorie

- **0.2.0** (2026-02-25): Erweitert mit Preconditions, Claim-Handling, Anti-Patterns, DoD
- **0.1.0**: Initial (minimalistisch)

---

**Erst wenn der Blueprint vollständig ist, darfst du diesen Prompt anwenden.**