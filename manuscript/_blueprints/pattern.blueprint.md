# Pattern-Blueprint (pattern.blueprint.md)

**Version:** 1.1.0  
**Status:** Template  
**Zielgruppe:** Autor:in + LLM (Pattern-Designer)

---

Dieses Blueprint definiert die Struktur eines Architektur-Patterns im Kontext von PDD.  
Es stellt sicher, dass Patterns konsistent, reproduzierbar und praxisnah beschrieben werden.

---

# 1) Pattern-Metadaten

- **Pattern-Name:** _z.B. "Disposable Code"_
- **Kategorie:** _Architektur / Workflow / Prompting / Governance_
- **Status:** draft _(draft / review / final)_
- **Relevante Kapitel:** _z.B. "03-architektur-patterns/01-disposable-code.md"_
- **Verwandte Patterns:** _z.B. "Prompt-Versionierung", "Intent-Definition"_

---

# 2) Intent (Warum existiert dieses Pattern?)

**Welches Problem löst das Pattern?**  
_Beispiel: "Legacy-Code wird immer schwerer zu warten, weil manuelle Patches auf manuellen Patches entstehen."_

**In welchem Kontext tritt das Problem auf?**  
_Beispiel: "Teams mit schnell ändernden Requirements und hoher technischer Schuld."_

**Warum ist dieses Pattern notwendig?**  
_Beispiel: "Code, der bewusst als kurzlebig konzipiert ist, vermeidet technische Schuld durch Neugenerierung statt Wartung."_

---

# 3) Motivation / Problem Statement

Beschreibe die Ausgangssituation:

**Welche Symptome treten auf?**  
_Beispiel: "Code-Reviews dauern länger, weil niemand den Legacy-Code versteht. Patches führen zu Regressionen."_

**Welche Risiken entstehen?**  
_Beispiel: "Technische Schuld wächst exponentiell. Team-Velocity sinkt. Neue Features dauern Wochen statt Tage."_

**Welche Fehlannahmen sind verbreitet?**  
_Beispiel: "'Code muss perfekt sein und für immer halten' – aber Requirements ändern sich schneller als Code altert."_

---

# 4) Lösung (Pattern)

Beschreibe das Pattern selbst:

**Kerngedanke:**  
_Beispiel: "Code ist disposable (wegwerfbar), wenn er jederzeit aus einem Prompt neu generiert werden kann."_

**Struktur:**  
_Beispiel: "Prompt (Source of Truth) → Generator → Code (Artefakt). Code wird committed, aber ist nicht die Source of Truth."_

**Mechanik:**  
_Beispiel: "Bei Requirements-Änderung: Prompt anpassen, Code neu generieren, alten Code verwerfen."_

**Regeln:**  
_Beispiel:_
- _Prompts sind versioniert (wie Code)_
- _Code enthält keine Business Logic, die nicht im Prompt steht_
- _Tests validieren Prompt-Output, nicht Code manuell_

Kurz, präzise, architektonisch.

---

# 5) Beispiel / Anwendungsszenario

**Konkrete Situation:**  
_Beispiel: "Ein Team generiert Boilerplate-Code für REST-APIs aus einem Prompt. Wenn ein neues Feld hinzukommt, wird der Prompt aktualisiert und Code neu generiert – statt manuell gepatcht."_

**Wie das Pattern angewendet wird:**  
_Beispiel: "Prompt: 'Generate FastAPI endpoint for User CRUD with fields: name, email, age'. Generator: LLM. Output: Python-Code. Bei Änderung: Prompt erweitern, neu generieren."_

**Welche Ergebnisse sichtbar werden:**  
_Beispiel: "Keine manuelle Wartung, keine Regressionen durch Patches, schnellere Iteration (Minuten statt Stunden)."_

---

# 6) Anti-Pattern (Was NICHT tun)

**Häufige Fehler:**  
_Beispiel: "Code manuell patchen, obwohl er aus Prompt generiert wurde → Drift zwischen Prompt und Code."_

**Missverständnisse:**  
_Beispiel: "'Disposable Code' bedeutet nicht 'schlechter Code' – es bedeutet 'neu generierbar'."_

**Fehlanwendungen:**  
_Beispiel: "Disposable Code für kritische Geschäftslogik verwenden, die Tests benötigt (zu riskant)."_

---

# 7) Claims (prüfpflichtige Aussagen)

- _Beispiel: "Disposable Code reduziert technische Schuld um 60%" → Quelle?_
- _Beispiel: "Boilerplate-Generierung ist 10x schneller als manuelles Schreiben" → Messung?_
- _Beispiel: "Legacy-Code verursacht 80% der Bugs" → Studie?_

---

# 8) Checkliste (5–8 Punkte)

Was die Leser:in nach dem Pattern tun/prüfen kann:

- [ ] _Beispiel: Identifiziere Code, der selten ändert (nicht disposable)_
- [ ] _Beispiel: Identifiziere Code, der oft ändert (disposable)_
- [ ] _Beispiel: Schreibe Prompts für disposable Code_
- [ ] _Beispiel: Versioniere Prompts_
- [ ] _Beispiel: Teste Prompt-Output (nicht manuellen Code)_

---

# 9) Takeaways (3–7 Punkte)

Die Essenz des Patterns:

- _Beispiel: "Disposable Code ist neu generierbar, nicht wartbar."_
- _Beispiel: "Prompt ist Source of Truth, Code ist Artefakt."_
- _Beispiel: "Pattern funktioniert für Boilerplate, nicht für kritische Logik."_

---

# 10) Notizen / TODOs

- _Beispiel: "Anti-Pattern 'manuell patchen' noch ausarbeiten"_
- _Beispiel: "Beispiel mit FastAPI vs. Django?"_
- _Beispiel: "Claim zu 60%-Reduktion recherchieren"_

---

## Validation Checklist

**Bevor Blueprint als "vollständig" markiert wird:**

- [ ] Pattern-Name ist klar und selbsterklärend?
- [ ] Intent beantwortet alle 3 Fragen? (Problem, Kontext, Notwendigkeit)
- [ ] Lösung beschreibt Kerngedanke, Struktur, Mechanik, Regeln?
- [ ] Beispiel ist konkret (nicht abstrakt)?
- [ ] Anti-Pattern ist dokumentiert?
- [ ] Claims sind notiert?
- [ ] Checkliste hat 5–8 Punkte?
- [ ] Takeaways haben 3–7 Punkte?

---

**Erst wenn dieses Blueprint vollständig ist, darf das Pattern ausgearbeitet werden.**

---

## Versionshistorie

- **1.1.0** (2026-02-25): Inline-Beispiele, Validation Checklist, Versionierung
- **1.0.0**: Initial (funktionales Template)