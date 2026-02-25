# Workflow-Paper: Zeitbasierte Arbeitsanleitung für das PDD-Manifesto

Dieses Dokument definiert, wie du an diesem Buch arbeitest – abhängig von der verfügbaren Zeit, deinem Energielevel und dem aktuellen Stand des Projekts.

Es ist dein persönlicher Arbeitsvertrag: klar, pragmatisch, reproduzierbar.

---

# 1. Grundprinzipien

- Jede Session beginnt mit einem Eintrag im Worklog.
- Jede Session endet mit einem Commit.
- Du arbeitest immer in Feature-Branches.
- Du schreibst nie ohne Blueprint.
- Du polierst nicht, bevor der Inhalt steht.
- Du arbeitest in der kleinsten sinnvollen Einheit.

---

# 2. Entscheidungsmatrix nach Zeitbudget

## ⏱ 15 Minuten – Mikro-Session
Ziel: Momentum halten.

Mögliche Aufgaben:
- 1 Claim ergänzen oder prüfen (`_research/claims.md`)
- 1 Quelle eintragen (`_research/sources.md`)
- 1 Absatz glätten
- 1 Glossar-Eintrag ergänzen
- 1 TODO im Blueprint konkretisieren
- Worklog aktualisieren

Regel:
- Keine neuen Kapitel. Keine großen Umbauten.

---

## ⏱ 30 Minuten – Fokus-Sprint
Ziel: Ein kleines, abgeschlossenes Ergebnis.

Mögliche Aufgaben:
- TL;DR eines Kapitels schreiben
- Kernthese formulieren
- Beispiel/Metapher skizzieren
- Checkliste entwerfen
- 1 Prompt überarbeiten
- Kapitel von `draft` → `review` bringen
- PR reviewen

---

## ⏱ 60 Minuten – Schreib-/Strukturblock
Ziel: Ein Kapitelteil oder Blueprint abschließen.

Mögliche Aufgaben:
- Blueprint vollständig ausfüllen
- Kapitelrohtext schreiben
- Claims für ein Kapitel sammeln
- Kapitelstruktur reorganisieren
- Glossar erweitern
- Research (max. 3 Quellen)

---

## ⏱ 2–3 Stunden – Deep Work
Ziel: Ein Kapitel oder Pattern substanziell voranbringen.

Mögliche Aufgaben:
- Kapitel von Rohform → „draft done“
- Pattern + Beispiel + Anti-Pattern erstellen
- Case Study ausarbeiten
- Kapitelreview + Überarbeitung
- Build-Pipeline testen
- Prompts refactoren

---

## 🗓 Ganzes Wochenende – Macro-Sprint
Ziel: Ein großer Meilenstein.

Mögliche Aufgaben:
- 1 komplettes Kapitel finalisieren
- 2–3 Kapitel auf „review“ bringen
- TOC überarbeiten
- Research-Block (10–20 Quellen)
- Build-System erweitern
- Edition vorbereiten (`v0.1.0`, `v0.2.0`)

---

# 3. Workflow-Reminder (für jede Session)

## Start
1. Worklog öffnen (`_worklog/YYYY-MM-DD.md`)
2. Zeitbudget festlegen
3. Entscheidungsmatrix → Aufgabe wählen
4. Branch prüfen oder neuen Branch erstellen  
   `feat/<kapitel-id>-<task>`
5. Blueprint öffnen (falls Kapitelarbeit)

## Währenddessen
- Kleinste sinnvolle Einheit bearbeiten
- Claims sofort notieren
- TODOs sofort notieren
- Keine Politur
- Commit alle 10–20 Minuten

## Ende
1. Worklog aktualisieren
2. Commit erstellen
3. Falls Kapitel fertig: Status → `review`, PR erstellen
4. Falls Build nötig: `scripts/build.js` ausführen, `/docs` committen
5. Branch pushen

---

# 4. Aufgaben-Katalog

## Schreiben
- TL;DR
- Kernthese
- Beispiel/Metapher
- Abschnitt glätten
- Kapitelrohtext
- Kapitelreview

## Struktur
- Blueprint ausfüllen
- TOC aktualisieren
- Patterns definieren
- Anti-Patterns ergänzen

## Research
- Claims sammeln
- Quellen prüfen
- Fakten verifizieren
- Gegenargumente notieren

## Qualität
- Glossar pflegen
- Style-Guide erweitern
- Prompt-Tests
- Kapitel gegen Blueprint validieren

## Build & Repo
- Build ausführen
- `/docs` aktualisieren
- PRs reviewen
- Branches aufräumen
- Release vorbereiten

## Meta
- Worklog pflegen
- Positioning aktualisieren
- Architektur-Dokument erweitern
- CONTRIBUTING aktualisieren

---

# 5. Definition of Done (DoD)

Ein Kapitel ist „draft done“, wenn:
- Frontmatter vollständig
- TL;DR vorhanden
- Kernthese formuliert
- Beispiel/Metapher enthalten
- Checkliste vorhanden
- Takeaways vorhanden
- Claims notiert

Ein Kapitel ist „review“, wenn:
- Struktur stabil
- Inhalt vollständig
- Keine offenen TODOs

Ein Kapitel ist „final“, wenn:
- Sprache geglättet
- Beispiele klar
- Claims verifiziert
- Konsistent mit Style-Guide

---

# 6. Prinzip: Immer klein anfangen

Wenn du nicht weißt, was du tun sollst:
- Öffne das Worklog
- Schreibe 3 Sätze
- Wähle die kleinste Aufgabe aus der Matrix

Fertig.