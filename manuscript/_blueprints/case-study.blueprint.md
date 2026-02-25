# Case-Study-Blueprint (case-study.blueprint.md)

**Version:** 1.1.0  
**Status:** Template  
**Zielgruppe:** Autor:in + LLM (Case-Study-Designer)

---

Dieses Blueprint definiert die Struktur einer Fallstudie.  
Case Studies dienen dazu, reale oder realistische Situationen greifbar zu machen.

**Wichtig:** Falls die Case Study **fiktiv** ist, muss das explizit markiert werden:
```markdown
**Hinweis:** Dieses Beispiel ist fiktiv, aber basiert auf realen Mustern.
```

---

# 1) Case-Metadaten

- **Titel:** _z.B. "Team X migriert Legacy-System mit PDD"_
- **Kontext:** _Unternehmen, Teamgröße, Branche, Systemtyp_  
  _Beispiel: "Fintech-Startup, 15 Entwickler:innen, monolithische Python-App"_
- **Status:** draft _(draft / review / final)_
- **Relevante Patterns:** _z.B. "Disposable Code", "Prompt-Versionierung"_
- **Kapitelzuordnung:** _z.B. "05-praxis-ausblick/01-legacy-migration.md"_

---

# 2) Ausgangssituation

**Was war die Situation vor der Veränderung?**  
_Beispiel: "Monolithische App mit 200k Lines of Code, keine Tests, manuelle Deployments dauerten 6 Stunden."_

**Welche Probleme oder Engpässe gab es?**  
_Beispiel: "Jedes neue Feature verursachte Regressionen. Code-Reviews dauerten Tage. Technische Schuld blockierte Innovation."_

**Welche Ziele hatte das Team/Unternehmen?**  
_Beispiel: "Modularisierung des Monolithen, Reduktion von Tech Debt um 50%, schnellere Time-to-Market."_

---

# 3) Herausforderungen

**Technische Herausforderungen:**  
_Beispiel: "Code hatte keine klare Architektur. Abhängigkeiten waren zirkulär. Keine automatisierten Tests."_

**Organisatorische Herausforderungen:**  
_Beispiel: "Management wollte Features, nicht Refactoring. Kein Budget für 'große Rewrite'."_

**Kulturelle Herausforderungen:**  
_Beispiel: "Team war skeptisch gegenüber LLMs ('kann nicht funktionieren'). Keine Erfahrung mit Prompt-Driven Development."_

---

# 4) Intervention / Vorgehen

Beschreibe, wie PDD angewendet wurde:

**Welche Schritte wurden unternommen?**  
_Beispiel:_
1. _"Analyse des Monolithen → Identifikation von Boilerplate (70% des Codes)"_
2. _"Erstellung von Prompt-Blueprints für wiederkehrende Patterns (API-Endpoints, DB-Queries)"_
3. _"Schritt-für-Schritt-Migration: Ein Modul pro Sprint, Prompt → Generator → Tests"_
4. _"Versionierung aller Prompts in Git"_

**Welche Artefakte wurden erstellt?**  
_Beispiel: "20 Prompt-Blueprints, 15 Pattern-Definitionen, automatisierte Tests für generierten Code."_

**Welche Prompts kamen zum Einsatz?**  
_Beispiel: "Prompt für FastAPI-Endpoint-Generierung, Prompt für SQLAlchemy-Model-Generierung."_

**Welche Patterns wurden angewendet?**  
_Beispiel: "Disposable Code (für Boilerplate), Prompt-Versionierung (für Audit-Trail)."_

---

# 5) Ergebnisse

**Was hat sich verbessert?**  
_Beispiel: "Time-to-Market sank von 6 Wochen auf 2 Wochen. Code-Reviews dauerten 2 Stunden statt 2 Tage."_

**Welche Metriken oder Beobachtungen gibt es?**  
_Beispiel: "Technische Schuld: -60%. Bugs in Boilerplate-Code: -90%. Team-Velocity: +40%."_

**Welche Risiken wurden reduziert?**  
_Beispiel: "Keine Regressionen durch manuelles Patchen. Konsistenz über alle Module hinweg."_

---

# 6) Learnings

**Was hat gut funktioniert?**  
_Beispiel: "Prompt-Versionierung ermöglichte Rollback bei Fehlern. Tests für generierten Code gaben Sicherheit."_

**Was hat nicht funktioniert?**  
_Beispiel: "Initiale Prompts waren zu vage → mehrere Iterationen nötig. Team brauchte Training (2 Wochen)."_

**Was würde man beim nächsten Mal anders machen?**  
_Beispiel: "Früher mit Training starten. Mehr Zeit für Prompt-Blueprints einplanen. Management-Buy-In früher einholen."_

---

# 7) Claims (prüfpflichtige Aussagen)

- _Beispiel: "Time-to-Market sank von 6 Wochen auf 2 Wochen" → Messung dokumentieren_
- _Beispiel: "Technische Schuld: -60%" → Metrik definieren (wie gemessen?)_
- _Beispiel: "Bugs in Boilerplate: -90%" → Quelle (Bug-Tracker-Daten?)_

---

# 8) Takeaways (3–7 Punkte)

Die Essenz der Fallstudie:

- _Beispiel: "PDD funktioniert für Boilerplate-Migration, nicht für komplexe Geschäftslogik."_
- _Beispiel: "Prompt-Versionierung ist entscheidend für Audit-Trail und Rollback."_
- _Beispiel: "Team-Training ist kritisch – LLMs sind Werkzeuge, keine Magie."_
- _Beispiel: "Management-Buy-In früh einholen, sonst blockiert Budget."_

---

# 9) Notizen / TODOs

- _Beispiel: "Metriken noch konkretisieren (wie wurde Tech Debt gemessen?)"_
- _Beispiel: "Beispiel-Prompt für FastAPI-Generierung einfügen"_
- _Beispiel: "Interview mit Team-Lead für Zitate?"_

---

## Validation Checklist

**Bevor Blueprint als "vollständig" markiert wird:**

- [ ] Kontext ist klar beschrieben? (Unternehmen, Team, Branche)
- [ ] Ausgangssituation beschreibt Probleme konkret?
- [ ] Herausforderungen decken alle 3 Dimensionen ab? (technisch, organisatorisch, kulturell)
- [ ] Intervention beschreibt Schritte, Artefakte, Prompts, Patterns?
- [ ] Ergebnisse enthalten Metriken oder Beobachtungen?
- [ ] Learnings sind ehrlich (auch Fehlschläge)?
- [ ] Claims sind notiert?
- [ ] Takeaways haben 3–7 Punkte?

---

**Erst wenn dieses Blueprint vollständig ist, darf die Case Study geschrieben werden.**

---

## Versionshistorie

- **1.1.0** (2026-02-25): Inline-Beispiele, Validation Checklist, Versionierung, Hinweis auf fiktive Case Studies
- **1.0.0**: Initial (funktionales Template)