# CONTRIBUTING.md  
Beitragsrichtlinien für „The PDD Manifesto“

Vielen Dank für dein Interesse an diesem Buchprojekt.  
Dieses Repository ist ein öffentliches, transparentes Schreib‑ und Architekturprojekt, das die Prinzipien von Prompt‑Driven Development (PDD) demonstriert.

Beiträge sind willkommen – solange sie die Struktur, Stimme und Architektur des Projekts respektieren.

---

# 1. Grundprinzipien

Dieses Projekt folgt vier Leitlinien:

1. **Struktur vor Inhalt**  
   Kein Kapitel ohne Blueprint. Keine Prosa ohne Struktur.

2. **Kleine Schritte**  
   Beiträge sollen minimal, klar und diffbar sein.

3. **Reproduzierbarkeit**  
   Jede Änderung muss nachvollziehbar, versioniert und begründet sein.

4. **Respekt vor der Autor:innenstimme**  
   Stil, Ton und Rhythmus des Buches dürfen nicht verändert werden.

---

# 2. Wie du beitragen kannst

## 2.1 Kleine Beiträge (empfohlen)
- Tippfehler korrigieren  
- Glossar ergänzen  
- Claims prüfen oder ergänzen  
- Quellen hinzufügen  
- TODOs konkretisieren  
- Strukturvorschläge machen  
- Feedback in Issues geben  

## 2.2 Größere Beiträge
- Verbesserungsvorschläge zu Kapiteln  
- Ergänzungen zu Patterns, Anti‑Patterns oder Case Studies  
- Erweiterungen der Build‑ oder Check‑Tools  
- Ergänzungen im Style‑Guide oder in der Architektur  

## 2.3 Was nicht erwünscht ist
- Komplett neue Kapitel ohne Absprache  
- Stilistische Umschreibungen ganzer Abschnitte  
- Marketing‑ oder Werbesprache  
- Framework‑ oder Tool‑Vorschläge, die das Build‑System verkomplizieren  
- „Ich schreibe mal eben das ganze Kapitel neu“  

---

# 3. Branching‑Modell

Dieses Projekt nutzt ein leichtgewichtiges, aber striktes Branch‑Modell:

- `main` → veröffentlichter Stand (GitHub Pages)  
- `feat/<kapitel-id>-<kurzbeschreibung>` → jede Änderung  

Beispiele:

```
feat/ch01-tldr
feat/ch03-example-update
feat/glossary-add-rag
feat/pattern-disposable-code
```

**Keine direkten Commits auf `main`.**

---

# 4. Pull Requests

Jeder PR muss enthalten:

### 4.1 Beschreibung
- Was wurde geändert?  
- Warum wurde es geändert?  
- Welche Artefakte sind betroffen?  

### 4.2 Bezug
- Link zum Issue (falls vorhanden)  
- Verweis auf Blueprint oder Claim  

### 4.3 Status
Falls ein Kapitel betroffen ist:

- `draft` → Inhalt steht, Sprache roh  
- `review` → Struktur stabil, bereit für Feedback  
- `final` → kuratiert, aber nicht perfekt  

### 4.4 Checkliste
Bitte bestätige:

- [ ] Keine stilistischen Umschreibungen  
- [ ] Keine Änderungen an der Autor:innenstimme  
- [ ] Blueprint respektiert  
- [ ] Claims ergänzt, falls Fakten enthalten  
- [ ] Build läuft (falls relevant)  

---

# 5. Kapitelstruktur (Pflicht)

Jedes Kapitel muss folgende Struktur haben:

- YAML‑Frontmatter (id, title, part, status)  
- TL;DR  
- Kernthese  
- Beispiel/Metapher/Case Study  
- Snippets (max. 2–3)  
- Checkliste  
- Takeaways  
- Optional: Offene Fragen  

Beiträge, die diese Struktur verletzen, werden nicht gemerged.

---

# 6. Prompts als Artefakte

Prompts liegen in `manuscript/_prompts/` und sind **First‑Class‑Citizens**.

Regeln:

- Prompts dürfen erweitert, aber nicht „verschönert“ werden  
- Jede Änderung muss begründet sein  
- Prompts müssen diffbar bleiben  
- Keine Vermischung von Stil‑ und Inhaltsregeln  

---

# 7. Claims & Research

Wenn ein Beitrag eine Behauptung enthält:

- Lege einen Claim in `_research/claims.md` an  
- Füge eine Quelle in `_research/sources.md` hinzu  
- Markiere unklare Fakten als TODO  

Keine erfundenen Fakten. Keine unreferenzierten Statistiken.

---

# 8. Build & Tools

Das Build‑System ist bewusst minimalistisch.

Regeln:

- `/docs` wird **nicht** manuell editiert  
- Änderungen an `/docs` erfolgen nur über `scripts/build.js`  
- Keine neuen Frameworks (kein Jekyll, kein Hugo, kein SSG)  
- Tools müssen portabel und leichtgewichtig bleiben  

---

# 9. Stil & Stimme

Dieses Buch hat eine definierte Stimme:

- klar  
- direkt  
- technisch  
- architektonisch  
- ohne Marketing‑Sprech  
- ohne Buzzword‑Suppe  

Bitte respektiere diese Stimme.

---

# 10. Code of Conduct

- Sei respektvoll  
- Sei konstruktiv  
- Sei präzise  
- Keine persönlichen Angriffe  
- Keine politischen Diskussionen  
- Keine Off‑Topic‑Debatten  

---

# 11. Wie du anfangen kannst

1. Issue lesen oder erstellen  
2. Blueprint öffnen  
3. Feature‑Branch erstellen  
4. Kleinste sinnvolle Änderung durchführen  
5. PR erstellen  

Wenn du unsicher bist:  
Erstelle ein Issue und frage nach.

---

# 12. Lizenz

Beiträge zu diesem Projekt werden unter der Lizenz des Repositories veröffentlicht.

---

Vielen Dank für deinen Beitrag.  
Dieses Projekt lebt von Transparenz, Struktur und kleinen, klaren Schritten.
