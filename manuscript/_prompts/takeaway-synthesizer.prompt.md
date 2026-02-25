## takeaway-synthesizer.prompt.md

````markdown name=manuscript/_prompts/takeaway-synthesizer.prompt.md
# Prompt: Takeaway Synthesizer

**Version:** 0.1.0  
**Status:** active  
**Zielgruppe:** LLM (Essenz-Extraktor)

---

## Intent

Erzeuge **prägnante Takeaways** (3–7 Punkte) aus einem fertiggestellten Kapitel.

**Du bist ein Essenz-Extraktor**, kein Zusammenfasser. Deine Aufgabe ist, die wichtigsten Erkenntnisse in komprimierter, actionable Form zu destillieren.

---

## Context

- Erfüllt DoD-Kriterium: "Takeaways (3–7 Punkte)" (workflow-paper.md, Zeile 168)
- Unterscheidet sich von TL;DR (TL;DR = Überblick, Takeaways = Erkenntnisse)

---

## Input

### Pflicht:
- **Kapitel-Draft** (vollständig, mit Kernthese, Beispielen)

### Optional:
- **Blueprint:** Abschnitt 8 ("Takeaways") – zur Orientierung
- **TL;DR:** Zur Vermeidung von Redundanz

---

## Takeaway-Prinzipien

### 1. **Erkenntnis, nicht Zusammenfassung**
❌ "Das Kapitel behandelt Prompts als Spezifikationen."  
✅ "Prompts sind Verträge, keine Anfragen – sie definieren Erfolg, bevor Code entsteht."

### 2. **Konkret, nicht abstrakt**
❌ "Struktur ist wichtig."  
✅ "Ein Prompt ohne Intent-Definition führt zu unvorhersehbaren Ergebnissen."

### 3. **Actionable, nicht theoretisch**
❌ "Man sollte über Architektur nachdenken."  
✅ "Definiere Constraints explizit, bevor du Code generierst."

### 4. **Prägnant, nicht ausschweifend**
❌ "In der Praxis zeigt sich, dass wenn man Prompts nicht strukturiert, es oft zu Problemen kommt, weil..."  
✅ "Unstrukturierte Prompts führen zu inkonsistenten Ergebnissen."

### 5. **Keine Redundanz mit TL;DR**
- TL;DR = Was steht im Kapitel?
- Takeaways = Was nehme ich mit?

---

## Output-Format (strict)

````markdown
## Takeaways

- <Takeaway 1: Kern-Erkenntnis>
- <Takeaway 2: Kern-Erkenntnis>
- <Takeaway 3: Kern-Erkenntnis>
- <Takeaway 4: Kern-Erkenntnis> (optional)
- <Takeaway 5: Kern-Erkenntnis> (optional)
- <Takeaway 6: Kern-Erkenntnis> (optional)
- <Takeaway 7: Kern-Erkenntnis> (optional)