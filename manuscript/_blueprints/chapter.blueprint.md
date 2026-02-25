# Kapitel-Blueprint (chapter.blueprint.md)

**Version:** 1.1.0  
**Status:** Template  
**Zielgruppe:** Autor:in + LLM (Blueprint-Assistent)

---

Dieses Blueprint definiert die Struktur, den Intent und die Claims eines Kapitels, bevor Prosa entsteht.  
Kein Kapitel darf ohne ausgefülltes Blueprint begonnen werden.

---

# 1) Kapitel-Metadaten

- **Kapitel-ID:** _z.B. `01-prompt-als-spezifikation`_
- **Titel:** _z.B. "Der Prompt als Spezifikation"_
- **Teil:** _z.B. "Teil II: Das PDD-Framework (Die Methode)"_
- **Status:** draft _(draft / review / final)_
- **Zielgruppe:** _Entwickler:innen / Architekt:innen / Manager:innen / Alle_
- **Relevante Patterns / Konzepte:** _z.B. API-Contract, Intent-Definition, Prompt-Versionierung_

---

# 2) Intent (Warum existiert dieses Kapitel?)

Kurze, klare Beschreibung:

**Welche Frage beantwortet das Kapitel?**  
_Beispiel: "Wie unterscheidet sich ein Prompt von einer natürlichen Anfrage?"_

**Welches Problem löst es?**  
_Beispiel: "Teams schreiben Prompts wie Gespräche, nicht wie Spezifikationen – das führt zu inkonsistenten Ergebnissen."_

**Welche Erkenntnis soll die Leser:in mitnehmen?**  
_Beispiel: "Ein Prompt ist ein Vertrag, der Erfolg definiert, bevor Code entsteht."_

---

# 3) Kernthese (max. 3–5 Sätze)

Die zentrale Aussage des Kapitels.  
Präzise, architektonisch, ohne Beispiele.

_Beispiel:_  
_"Ein Prompt ist keine natürlichsprachliche Anfrage, sondern eine formale Spezifikation eines Outputs. Wie ein API-Vertrag definiert er Eingaben, Constraints, Ausgabeformat und Erfolgskriterien. Die Qualität des generierten Codes hängt nicht von der 'Kreativität' des Modells ab, sondern von der Präzision der Spezifikation."_

---

# 4) Struktur / Outline

Liste der geplanten Abschnitte:

1. _Beispiel: "Was ist ein Prompt? (Definition)"_
2. _Beispiel: "Prompt vs. Anfrage (Unterschied)"_
3. _Beispiel: "Prompt als API-Vertrag (Metapher)"_
4. _Beispiel: "Intent, Constraints, Output-Schema (Komponenten)"_

Jeder Abschnitt muss einen Zweck haben.

---

# 5) Beispiel / Szene / Case Study

**Welche konkrete Situation wird beschrieben?**  
_Beispiel: "Ein Team schreibt einen Prompt für Code-Generierung, bekommt aber jedes Mal andere Ergebnisse. Ein strukturierter Prompt mit expliziten Constraints führt zu deterministischem Output."_

**Welche Rolle spielt sie für die These?**  
_Beispiel: "Zeigt den Kontrast: vager Prompt → inkonsistent, strukturierter Prompt → deterministisch."_

**Welche technische oder organisatorische Realität bildet sie ab?**  
_Beispiel: "CI/CD-Pipeline mit LLM-gestützter Code-Review, die nur mit reproduzierbaren Prompts funktioniert."_

---

# 6) Claims (Fakten, die geprüft werden müssen)

Liste aller Behauptungen, die Quellen benötigen:

- _Beispiel: "80% der Teams haben keine Prompt-Versionierung" → Quelle?_
- _Beispiel: "Reproduzierbarkeit sinkt bei vagen Prompts um Faktor 10" → Studie?_
- _Beispiel: "GitHub Copilot wurde 2021 veröffentlicht" → Pressemitteilung?_

Jeder Claim muss später in `manuscript/_research/claims.md` eingetragen werden.

---

# 7) Checkliste (5–8 Punkte)

Was die Leser:in nach dem Kapitel tun/prüfen/erkennen kann:

- [ ] _Beispiel: Prompt-Intent explizit definieren_
- [ ] _Beispiel: Constraints dokumentieren (MUST / MUST NOT)_
- [ ] _Beispiel: Output-Format spezifizieren_
- [ ] _Beispiel: Erfolgskriterien festlegen_
- [ ] _Beispiel: Prompt versionieren (wie Code)_

---

# 8) Takeaways (3–7 Punkte)

Die wichtigsten Erkenntnisse in komprimierter Form:

- _Beispiel: "Prompts sind Verträge, keine Anfragen – sie definieren Erfolg, bevor Code entsteht."_
- _Beispiel: "Ein Prompt ohne expliziten Intent führt zu unvorhersehbaren Ergebnissen."_
- _Beispiel: "Constraints (MUST/MUST NOT) machen Prompts deterministisch und testbar."_

---

# 9) Offene Fragen (optional)

Gibt es Aspekte, die unklar bleiben oder weiterer Forschung bedürfen?

- _Beispiel: "Wie verhalten sich Prompts bei extrem großen Context Windows?"_
- _Beispiel: "Gibt es Situationen, wo vage Prompts besser sind?"_

---

# 10) Notizen / TODOs

- _Beispiel: "Metapher 'API-Vertrag' noch ausarbeiten"_
- _Beispiel: "Claim zu 80%-Statistik recherchieren"_
- _Beispiel: "Code-Beispiel: Python vs. TypeScript?"_

---

## Validation Checklist

**Bevor Blueprint als "vollständig" markiert wird:**

- [ ] Alle Metadaten ausgefüllt? (ID, Titel, Teil, Zielgruppe)
- [ ] Intent beantwortet alle 3 Fragen? (Frage, Problem, Erkenntnis)
- [ ] Kernthese ist 2–5 Sätze? (nicht kürzer, nicht länger)
- [ ] Outline hat 3–6 Abschnitte? (nicht mehr, nicht weniger)
- [ ] Beispiel ist konkret beschrieben? (nicht abstrakt)
- [ ] Claims sind notiert? (mindestens 1)
- [ ] Checkliste hat 5–8 Punkte? (actionable)
- [ ] Takeaways haben 3–7 Punkte? (Erkenntnisse, nicht Zusammenfassungen)

---

**Erst wenn dieses Blueprint vollständig ist, darf das Kapitel geschrieben werden.**

---

## Versionshistorie

- **1.1.0** (2026-02-25): Inline-Beispiele, Validation Checklist, Versionierung
- **1.0.0**: Initial (funktionales Template)