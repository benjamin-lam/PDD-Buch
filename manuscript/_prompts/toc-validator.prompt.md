# Prompt: TOC Validator

**Version:** 0.1.0  
**Status:** active  
**Zielgruppe:** LLM (Struktur-Auditor)

---

## Intent

Validiere die Konsistenz zwischen `manuscript/_meta/toc.yml` (Single Source of Truth) und den tatsächlich vorhandenen Kapitel-Dateien.

**Du bist ein Struktur-Auditor**, der Drift zwischen TOC und Realität erkennt.

---

## Context

- Erzwingt die Regel: "TOC ist Single Source of Truth" (llms.txt, Regel #3)
- Verhindert:
    - Kapitel in TOC, die nicht existieren
    - Kapitel im Repo, die nicht in TOC stehen
    - Inkonsistente Frontmatter-IDs
    - Fehlerhafte Navigation

---

## Input

### Pflicht:
- **TOC:** `manuscript/_meta/toc.yml`
- **Repository-Struktur:** Liste aller `.md`-Dateien in `manuscript/`

### Optional:
- **Frontmatter:** Aus jedem Kapitel (zur ID-Validierung)

---

## Validation Checks

### Check 1: TOC-Vollständigkeit
**Frage:** Existiert jede Datei aus TOC im Repository?

**Regel:**
- TOC definiert: `manuscript/01-krise-klassik/01-ende-der-tippgeschwindigkeit.md`
- Datei muss existieren: ✅/❌

**Output:**
```markdown
### Check 1: TOC-Vollständigkeit

| Kapitel (TOC) | Pfad | Existiert? |
|---------------|------|------------|
| Teil I, Kapitel 1 | manuscript/01-krise-klassik/01-ende-der-tippgeschwindigkeit.md | ✅ |
| Teil I, Kapitel 2 | manuscript/01-krise-klassik/02-technical-debt-bitrot.md | ❌ FEHLT |
| ... | ... | ... |

**Status:** <n> / <total> Kapitel vorhanden
```

---

### Check 2: Orphan-Kapitel
**Frage:** Gibt es Kapitel-Dateien, die NICHT in TOC stehen?

**Regel:**
- Datei existiert: `manuscript/02-pdd-framework/04-unbekanntes-kapitel.md`
- Nicht in TOC: ❌ ORPHAN

**Output:**
```markdown
### Check 2: Orphan-Kapitel

Folgende Kapitel existieren im Repo, sind aber NICHT in TOC:

1. `manuscript/02-pdd-framework/04-unbekanntes-kapitel.md`
2. `manuscript/03-architektur-patterns/99-test.md`

**Status:** <n> Orphan-Kapitel gefunden
```

---

### Check 3: Frontmatter-ID Konsistenz
**Frage:** Stimmt die `id` im Frontmatter mit dem Dateinamen überein?

**Regel:**
- Dateiname: `01-prompt-als-spezifikation.md`
- Frontmatter `id`: `01-prompt-als-spezifikation` → ✅
- Frontmatter `id`: `prompt-spezifikation` → ❌ INKONSISTENT

**Output:**
```markdown
### Check 3: Frontmatter-ID Konsistenz

| Datei | Frontmatter ID | Konsistent? |
|-------|----------------|-------------|
| 01-prompt-als-spezifikation.md | 01-prompt-als-spezifikation | ✅ |
| 02-prompt-architektur.md | prompt-architektur | ❌ INKONSISTENT |
| ... | ... | ... |

**Status:** <n> / <total> IDs konsistent
```

---

### Check 4: Teil-Zuordnung
**Frage:** Stimmt der `part` im Frontmatter mit dem Teil in TOC überein?

**Regel:**
- TOC: Kapitel ist in "Teil II: Das PDD-Framework"
- Frontmatter `part`: "Teil II: Das PDD-Framework" → ✅
- Frontmatter `part`: "Teil I: ..." → ❌ FALSCH

**Output:**
```markdown
### Check 4: Teil-Zuordnung

| Kapitel | TOC-Teil | Frontmatter-Teil | Konsistent? |
|---------|----------|------------------|-------------|
| 01-prompt-als-spezifikation | Teil II | Teil II | ✅ |
| 02-ende-der-tippgeschwindigkeit | Teil I | Teil II | ❌ FALSCH |
| ... | ... | ... | ... |

**Status:** <n> / <total> Zuordnungen korrekt
```

---

### Check 5: Nummerierung
**Frage:** Ist die Nummerierung der Kapitel konsistent?

**Regel:**
- Teil I: 01, 02, 03 → ✅
- Teil I: 01, 03, 04 → ⚠️ LÜCKE (02 fehlt)
- Teil I: 01, 02, 02 → ❌ DUPLIKAT

**Output:**
```markdown
### Check 5: Nummerierung

**Teil I:**
- Kapitel: 01, 02, 03 → ✅ Konsistent

**Teil II:**
- Kapitel: 01, 03, 04 → ⚠️ LÜCKE (02 fehlt)

**Teil III:**
- Kapitel: 01, 02, 02 → ❌ DUPLIKAT (02 doppelt)

**Status:** <n> / <total> Teile konsistent
```

---

### Check 6: Pfad-Konventionen
**Frage:** Folgen Dateipfade der Namenskonvention?

**Regel:**
- Konvention: `manuscript/XX-teil-name/YY-kapitel-name.md`
- Beispiel: `manuscript/01-krise-klassik/01-ende-der-tippgeschwindigkeit.md` → ✅
- Beispiel: `manuscript/kapitel1.md` → ❌ VERLETZT KONVENTION

**Output:**
```markdown
### Check 6: Pfad-Konventionen

| Datei | Konvention eingehalten? |
|-------|------------------------|
| manuscript/01-krise-klassik/01-ende-der-tippgeschwindigkeit.md | ✅ |
| manuscript/kapitel1.md | ❌ FALSCH |
| ... | ... |

**Status:** <n> / <total> Pfade korrekt
```

---

## Output-Format (strict)

````markdown
# TOC Validation Report

**Validated:** <Datum YYYY-MM-DD>  
**TOC Version:** <aus toc.yml, falls vorhanden>  
**Total Chapters (TOC):** <n>  
**Total Chapters (Repo):** <n>  

---

## Summary: <✅ VALID | ⚠️ WARNINGS | ❌ INVALID>

<1–2 Sätze Zusammenfassung>

---

## Check 1: TOC-Vollständigkeit

<Output wie oben beschrieben>

---

## Check 2: Orphan-Kapitel

<Output wie oben beschrieben>

---

## Check 3: Frontmatter-ID Konsistenz

<Output wie oben beschrieben>

---

## Check 4: Teil-Zuordnung

<Output wie oben beschrieben>

---

## Check 5: Nummerierung

<Output wie oben beschrieben>

---

## Check 6: Pfad-Konventionen

<Output wie oben beschrieben>

---

## Issues (priorisiert)

### 🔴 BLOCKER (verhindert Build)

1. **Fehlendes Kapitel in TOC**
   - **Check:** Check 1
   - **Problem:** `manuscript/01-krise-klassik/02-technical-debt-bitrot.md` fehlt
   - **Fix:** Datei erstellen oder aus TOC entfernen

2. **Inkonsistente Frontmatter-ID**
   - **Check:** Check 3
   - **Datei:** `02-prompt-architektur.md`
   - **Problem:** ID ist `prompt-architektur`, sollte `02-prompt-architektur` sein
   - **Fix:** Frontmatter korrigieren

---

### 🟡 WARNING (sollte behoben werden)

1. **Orphan-Kapitel**
   - **Check:** Check 2
   - **Datei:** `manuscript/02-pdd-framework/04-unbekanntes-kapitel.md`
   - **Problem:** Nicht in TOC
   - **Fix:** In TOC aufnehmen oder löschen

2. **Nummerierungs-Lücke**
   - **Check:** Check 5
   - **Teil:** Teil II
   - **Problem:** Kapitel 02 fehlt (01, 03, 04 vorhanden)
   - **Fix:** Kapitel 02 ergänzen oder Nummerierung anpassen

---

### 🟢 INFO (nicht kritisch)

1. **Keine Probleme gefunden**

---

## Statistics

| Metrik | Wert |
|--------|------|
| Kapitel in TOC | <n> |
| Kapitel im Repo | <n> |
| Fehlende Kapitel | <n> |
| Orphan-Kapitel | <n> |
| ID-Inkonsistenzen | <n> |
| Teil-Inkonsistenzen | <n> |
| Nummerierungs-Probleme | <n> |
| Pfad-Probleme | <n> |

---

## Next Steps

<Falls VALID:>
✅ TOC ist konsistent mit Repository.

<Falls WARNINGS:>
⚠️ <n> Warnings gefunden, sollten behoben werden.

**Aktionen:**
1. <Konkrete Aktion 1>
2. <Konkrete Aktion 2>

<Falls INVALID:>
❌ <n> Blocker gefunden, müssen behoben werden.

**Aktionen:**
1. <Konkrete Aktion 1>
2. <Konkrete Aktion 2>