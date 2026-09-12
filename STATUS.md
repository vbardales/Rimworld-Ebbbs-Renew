---
localization: unchecked
translation_en: unchecked
translation_fr: unchecked
mod:          Ebbbs Renew (unofficial)
packageId:    nelim.ebbbsrenew
repo:         Rimworld-Ebbbs-Renew
remote:       https://github.com/vbardales/Rimworld-Ebbbs-Renew.git
visibility:   public
detached:     yes
stage:        done
licence:      silent
licence_at:   ATTRIBUTION.md; historical five-source audit, not refreshed online in this session
dependencies: none
showcase:     icon present; preview recomposed and visually verified; in-game review pending
tested_on:
automated:    PASS - 201 static checks, 6 XML files, 2026-09-13
manual_tests: Tests/MANUAL.md - 8 scenarios, not executed
workshop:
remaining:
  - unverified: RimWorld 1.6 functional scenarios and Core reference resolution not run
  - unverified: Preview and icon appearance in the game UI
maintainer:   Codex - responsible for this repository and STATUS.md
session:      01a09790-9f9b-7b92-8498-547182eb4f10
updated:      2026-09-13
---

# Ebbbs Renew — status

Codex takes responsibility for this local repository and this status file from
2026-09-12 onward. Update it with each material change, test result or publication.
This file stays at the root, outside the distributable `Mod/` folder.

## Identity and scope

- Folder: `C:\Users\nelim\Documents\rimworld\EbbbsRenew`.
- Mod title: **Ebbbs Renew (unofficial)**; packageId: `nelim.ebbbsrenew`.
- Remote: https://github.com/vbardales/Rimworld-Ebbbs-Renew.git.
- Independent local Git repository, with its own `.git` directory, branch `main`.
  `git rev-parse --show-toplevel` resolves to this folder. The parent repository
  tracks no files under EbbbsRenew and `git check-ignore EbbbsRenew` confirms exclusion.
  This task maintains this repository only.
- **Public**: GitHub REST API `/repos/vbardales/Rimworld-Ebbbs-Renew` returned
  `private: false`, `visibility: public` on 2026-09-12.
- No Workshop publication recorded; `workshop` remains empty.

## Mod title, description and licence

The suffix **(unofficial)** is already present in About.xml and README.md. Keep it:
this is a continuation of Coolie's work without recorded explicit approval.
No additional suffix is needed for this identification purpose.
The GitHub URL is present both in `<url>` and in the actual `<description>`.

**Mod classification: `licence: silent`; repository visibility: `public`.**
These are separate facts: public access does not establish an open licence.
The attribution audit in [ATTRIBUTION.md](ATTRIBUTION.md) reports no licence or
redistribution refusal in five locations: licence files, upstream About.xml,
upstream README, linked repository (none found), and Workshop description.
That historical audit is the basis for `silent`; the upstream materials were not
rechecked online during this takeover. No new permission is asserted here.

Classification rationale:

- `silent`: selected because the recorded upstream audit found neither an explicit
  licence nor an explicit refusal.
- `open`: not supported by an explicit upstream licence in the recorded evidence.
- `forbidden`: no written refusal recorded in that audit.
- `original`: not applicable; creatures, textures and definitions derive from Coolie.

Credit, the unofficial notice and the stated removal-on-request commitment remain
in place. They are not evidence of permission from the original author.

## Verification

No reproducible automated suite or manual scenario document existed at takeover.
Added [Tests/Validate-Mod.ps1](Tests/Validate-Mod.ps1) and
[Tests/MANUAL.md](Tests/MANUAL.md).

Run from the repository root:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File Tests/Validate-Mod.ps1
```

Result on 2026-09-13: **PASS — 201 checks, six XML files, nine races**.
Checks cover XML parsing, metadata, duplicate typed defNames, nine PawnKind/race
pairs, expected Wildness values under statBases, absence of obsolete wildness
fields, local body/leather/meat/flesh/blood/effect/product references, local texture
paths and live directional sprites, plus presence of the icon and Preview.

This is static validation, not a RimWorld schema validator or engine execution.
Core inheritance, Core assets/references, DLC compatibility, graphics and actual
behaviour still require the eight documented manual scenarios. `tested_on` stays
empty until an actual run is recorded with game version and evidence.
There is no C# assembly in this mod; C# unit tests are not applicable.

## Assets and corrected issue

`Mod/About/ModIcon.png` and `Mod/About/Preview.png` both exist. The old claim that
Preview was missing has been removed. `Art/ModIcon-source.png` is also present.
Presence alone does not prove their appearance in the game UI.

Goliebbb label corrected on 2026-09-13: ThingDef now displays `goliebbb`, matching PawnKindDef. Identifiers and balance remain unchanged; in-game confirmation is pending.

Stage is **done**: the port, metadata, showcase and static validation work are
complete. Stage tracks preparation independently of in-game testing.
`tested_on` and `manual_tests` track actual gameplay verification, which remains
unexecuted; `workshop` tracks publication separately. No in-game success or
Workshop publication is implied by `done`.

## Preview recomposed — 2026-09-12

The delivered illustration had no text. It was preserved intact as
`Art/Preview.png` before recomposition; no illustration was replaced, so no
separate old-source archive was needed. The existing title and the exact summary
from `_tools/preview.html` were retained. `(unofficial)` is on its own line;
`Renew` is 65% of the title size. Badge version `1.6` is derived from About.xml.

Composition and parameters: `Art/preview.html`; sole colour reference:
`Art/preview-palette.json`; reproducible renderer: `Art/render-preview.cjs`;
instructions: `Art/PREVIEW.md`. Final output: `Mod/About/Preview.png`.

The dominant chromatic family is the ochre/brown of the wooden floor, crates and
lamp pool. The veil uses dark wood; the secondary ink uses a lighter wood ochre.
Accent revised on 2026-09-13 after the amber was judged too close to the secondary ink. The new copper-orange accent extends the warm lamp palette:
its redder hue, stronger saturation and different lightness distinguish it from the
secondary ink. No HEX values are duplicated here.

Verified at 896 × 504 and 268 px wide: title, reduced suffix and badge readable,
rule visible, accent distinct, no text overlap or clipping. Chrome confirms actual
Segoe UI (Semibold title, regular tag/summary, Bold badge), with no fallback;
capture waited for document.fonts.ready. Output is 540,016 bytes, below 900 KB.
Minimum contrast on rendered backgrounds: title 12.05:1, suffix 8.11:1,
tag 7.73:1, summary 6.21:1, badge 6.67:1. Entire text rectangles were sampled,
not only their corners. Evidence: `Art/preview-qa.json`, `Art/preview-background.png`
and `Art/preview-268.png`. In-game UI review remains pending. No Workshop publication.
