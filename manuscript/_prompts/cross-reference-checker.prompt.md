## cross-reference-checker.prompt.md

````markdown name=manuscript/_prompts/cross-reference-checker.prompt.md
# Prompt: Cross-Reference Checker

**Version:** 0.1.0  
**Status:** active  
**Zielgruppe:** LLM (Konsistenz-Auditor)

---

## Intent

Finde **Inkonsistenzen, Widersprüche und Redundanzen** zwischen Kapiteln.

**Du bist ein Konsistenz-Auditor**, der das Buch als Gesamtsystem betrachtet.

---

## Context

- Wird verwendet, wenn mehrere Kapitel `review` oder `final` Status erreichen
- Verhindert:
  - Widersprüchliche Aussagen zwischen Kapiteln
  - Redundante Inhalte (gleicher Inhalt in 2+ Kapiteln)
  - Fehlende Referenzen (Kapitel A erwähnt Konzept, das erst in Kapitel B erklärt wird)

---

## Input

### Pflicht:
- **Kapitel-Set:** Mindestens 2 Kapitel (Markdown-Dateien)
- **TOC:** `manuscript/_meta/toc.yml` (zur Reihenfolge)

### Optional:
- **Glossar:** `manuscript/_meta/glossary.md`
- **Blueprints:** Zur Intent-Validierung

---

## Check-Kategorien

### 1. Widersprüche (CRITICAL)
**Frage:** Widersprechen sich Aussagen zwischen Kapiteln?

**Beispiel:**
- Kapitel 1: "Prompts sollten immer versioniert werden."
- Kapitel 3: "Versionierung ist optional für einfache Prompts."
→ ❌ WIDERSPRUCH

---

### 2. Redundanzen (MEDIUM)
**Frage:** Wird derselbe Inhalt in mehreren Kapiteln wiederholt?

**Beispiel:**
- Kapitel 2: "Ein Prompt ist eine Spezifikation, kein Wunsch." (3 Absätze)
- Kapitel 4: "Ein Prompt ist eine Spezifikation, kein Wunsch." (2 Absätze)
→ ⚠️ REDUNDANZ (sollte konsolidiert oder cross-referenced werden)

---

### 3. Fehlende Referenzen (MEDIUM)
**Frage:** Wird ein Konzept erwähnt, das erst später erklärt wird?

**Beispiel:**
- Kapitel 1 (Teil I): "...wie in PDD-Loops beschrieben..."
- Kapitel "PDD-Loops" kommt erst in Teil II
→ ⚠️ FORWARD REFERENCE (Leser:in kennt Begriff noch nicht)

---

### 4. Begriffskonsistenz (LOW)
**Frage:** Werden Begriffe über Kapitel hinweg konsistent verwendet?

**Beispiel:**
- Kapitel 1: "API Contract"
- Kapitel 3: "API-Vertrag"
→ ⚠️ INKONSISTENT (sollte mit Glossar abgeglichen werden)

---

### 5. Strukturelle Konsistenz (LOW)
**Frage:** Folgen alle Kapitel derselben Struktur?

**Beispiel:**
- Kapitel 1–10: TL;DR → Kernthese → Beispiel → ...
- Kapitel 11: Kernthese → TL;DR → ...
→ ⚠️ STRUKTURABWEICHUNG

---

## Output-Format (strict)

````markdown
# Cross-Reference Check

**Checked:** <Datum YYYY-MM-DD>  
**Chapters Analyzed:** <n>  
**Issues Found:** <n>  

---

## Summary: <✅ CONSISTENT | ⚠️ ISSUES FOUND | ❌ CRITICAL ISSUES>

<1–2 Sätze Zusammenfassung>

---

## Check 1: Widersprüche

### Gefundene Widersprüche: <n>

#### 1. Widerspruch: <Kurzbeschreibung>

**Kapitel A:** <Kapitel-ID A>  
**Zeile:** <n>  
**Aussage:** "<Zitat aus Kapitel A>"

**Kapitel B:** <Kapitel-ID B>  
**Zeile:** <n>  
**Aussage:** "<Zitat aus Kapitel B>"

**Problem:**  
<Erklärung des Widerspruchs>

**Empfehlung:**  
<Wie sollte es gelöst werden?>

---

## Check 2: Redundanzen

### Gefundene Redundanzen: <n>

#### 1. Redundanz: <Kurzbeschreibung>

**Kapitel A:** <Kapitel-ID A>  
**Abschnitt:** <Titel>  
**Inhalt:** <Kurzzusammenfassung>

**Kapitel B:** <Kapitel-ID B>  
**Abschnitt:** <Titel>  
**Inhalt:** <Kurzzusammenfassung>

**Problem:**  
<Warum ist es redundant?>

**Empfehlung:**  
- Option 1: Konsolidieren (einen Abschnitt entfernen, anderen ausbauen)
- Option 2: Cross-Reference einfügen ("Siehe Kapitel X für Details")
- Option 3: Perspektiven unterscheiden (falls beide Abschnitte aus verschiedenen Blickwinkeln schreiben)

---

## Check 3: Fehlende Referenzen

### Forward References (Konzepte, die erst später erklärt werden): <n>

#### 1. Forward Reference: <Begriff/Konzept>

**Erwähnt in:** <Kapitel-ID>  
**Zeile:** <n>  
**Kontext:** "<Zitat>"

**Erklärt in:** <Kapitel-ID> (kommt später in TOC)

**Problem:**  
Leser:in kennt Begriff noch nicht.

**Empfehlung:**
- Option 1: Kurze Erklärung einfügen + Forward Reference ("wird in Kapitel X vertieft")
- Option 2: Reihenfolge anpassen (Erklärung vor erste Verwendung)
- Option 3: Glossar-Referenz einfügen

---

### Backward References (Konzepte werden nicht aufgegriffen, obwohl sie sollten): <n>

#### 1. Backward Reference: <Begriff/Konzept>

**Erklärt in:** <Kapitel-ID>  
**Sollte referenziert werden in:** <Kapitel-ID> (kommt später, aber greift Konzept nicht auf)

**Problem:**  
Konzept wurde eingeführt, aber nicht weiter vertieft.

**Empfehlung:**  
Cross-Reference oder Vertiefung einfügen.

---

## Check 4: Begriffskonsistenz

### Inkonsistente Begriffe: <n>

#### 1. Begriff: "<Begriff>"

**Varianten:**
- Kapitel <ID>: "<Variante 1>" (Zeile <n>)
- Kapitel <ID>: "<Variante 2>" (Zeile <n>)
- Kapitel <ID>: "<Variante 3>" (Zeile <n>)

**Glossar-Definition:** "<Glossar-Form>" (falls vorhanden)

**Empfehlung:**  
Vereinheitlichen auf: "<Empfohlene Form>"

---

## Check 5: Strukturelle Konsistenz

### Strukturabweichungen: <n>

#### 1. Kapitel: <Kapitel-ID>

**Erwartete Struktur:** TL;DR → Kernthese → Beispiel → ...  
**Tatsächliche Struktur:** Kernthese → TL;DR → ...

**Problem:**  
Weicht von Standard-Struktur ab.

**Empfehlung:**  
Struktur anpassen oder explizit begründen (falls bewusste Abweichung).

---

## Issues (priorisiert)

### 🔴 CRITICAL (müssen behoben werden)

1. **Widerspruch: Versionierung**
   - Kapitel 01-prompt-als-spezifikation vs. 03-prompt-versionierung
   - Details: Siehe Check 1.1

---

### 🟡 MEDIUM (sollten behoben werden)

1. **Redundanz: Prompt-Definition**
   - Kapitel 01 und 04
   - Details: Siehe Check 2.1

2. **Forward Reference: "PDD-Loop"**
   - Erwähnt in Kapitel 01, erklärt erst in Kapitel 03
   - Details: Siehe Check 3.1

---

### 🟢 LOW (optional)

1. **Begriffskonsistenz: "API Contract" vs. "API-Vertrag"**
   - Details: Siehe Check 4.1

---

## Recommendations

### Global
- [ ] Widersprüche auflösen (Kapitel 01 + 03)
- [ ] Redundanzen konsolidieren oder cross-referenzieren
- [ ] Forward References auflösen (Glossar oder Kurzerklärung)

### Per Kapitel
**Kapitel 01-prompt-als-spezifikation:**
- [ ] Forward Reference zu "PDD-Loop" auflösen (Zeile 34)
- [ ] Redundante Definition entfernen oder kürzen

**Kapitel 03-prompt-versionierung:**
- [ ] Widerspruch zu Kapitel 01 auflösen (Zeile 67)

---

## Statistics

| Metrik | Wert |
|--------|------|
| Kapitel analysiert | <n> |
| Widersprüche | <n> |
| Redundanzen | <n> |
| Forward References | <n> |
| Backward References | <n> |
| Begriffsinkon­sistenzen | <n> |
| Strukturabweichungen | <n> |

---

## Next Steps

1. 🔴 CRITICAL Issues beheben (Widersprüche)
2. 🟡 MEDIUM Issues prüfen (Redundanzen, Forward References)
3. 🟢 LOW Issues optional beheben (Begriffskonsistenz)
4. Erneut prüfen nach Korrekturen