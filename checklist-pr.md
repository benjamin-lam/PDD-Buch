# PR-Checkliste für „The PDD Manifesto“

Diese Checkliste muss für jeden Pull Request vollständig erfüllt sein.  
Sie schützt Struktur, Stimme, Reproduzierbarkeit und PDD-Konformität.

---

## 1) Allgemein
- [ ] PR-Beschreibung erklärt klar, **was** geändert wurde und **warum**
- [ ] Betroffene Artefakte sind genannt (Kapitel, Blueprint, Prompt, Claim, etc.)
- [ ] Branch folgt dem Schema `feat/<kapitel-id>-<task>`
- [ ] Keine direkten Commits auf `main`

---

## 2) Struktur & Architektur
- [ ] Änderungen respektieren `manuscript/_meta/toc.yml`
- [ ] Keine Strukturänderungen ohne Begründung
- [ ] Blueprint vorhanden, falls Kapitel betroffen
- [ ] Kapitel folgt der verpflichtenden Struktur:
    - YAML-Frontmatter
    - TL;DR
    - Kernthese
    - Beispiel/Szene/Case Study
    - Snippets (max. 2–3)
    - Checkliste
    - Takeaways

---

## 3) Inhalt & Claims
- [ ] Keine erfundenen Fakten
- [ ] Neue Fakten → Claim in `_research/claims.md`
- [ ] Quellen ergänzt in `_research/sources.md`
- [ ] Keine unreferenzierten Statistiken
- [ ] Keine inhaltlichen Widersprüche zum Style Guide

---

## 4) Stil & Stimme
- [ ] Keine stilistischen Umschreibungen ohne Notwendigkeit
- [ ] Ton bleibt klar, technisch, architektonisch
- [ ] Keine Marketing-Sprache
- [ ] Keine Buzzword-Suppe
- [ ] Gender: Entwickler:innen

---

## 5) Prompts
- [ ] Änderungen an Prompts sind minimal und begründet
- [ ] Prompts bleiben diffbar
- [ ] Keine Vermischung von Stil- und Inhaltsregeln

---

## 6) Build & Tools
- [ ] `/docs` **nicht** manuell editiert
- [ ] Falls Build nötig: `scripts/build.js` ausgeführt
- [ ] Build-Ergebnis committed (falls relevant)

---

## 7) Status
Falls ein Kapitel betroffen ist:
- [ ] Status korrekt gesetzt (`draft`, `review`, `final`)
- [ ] Keine Statusänderung ohne inhaltliche Grundlage

---

## 8) Abschluss
- [ ] PR ist klein, klar und diffbar
- [ ] Keine „Rewrite the world“-Änderungen
- [ ] PR ist bereit für Review

---

**Danke für deinen Beitrag.**  
Dieses Projekt lebt von kleinen, klaren, reproduzierbaren Schritten.
