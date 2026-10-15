---
localization: complete
translation_en: complete
translation_fr: complete
settings_audit: not_applicable
mod:          Ebbbs Renew
packageId:    nelim.ebbbs
repo:         Rimworld-Ebbbs-Renew
remote:       https://github.com/vbardales/Rimworld-Ebbbs-Renew.git
visibility:   public
detached:     yes
workflow_stage: mountPreview[1.0.0]
licence:      authorized (was silent; see 2026-09-28 entry below)
licence_at:   ATTRIBUTION.md; historical five-source audit, refreshed online 2026-09-28 (see the
  reclassification entry below): the Workshop page, the author's profile and a web.archive.org
  snapshot were checked, and turned up the coolziecat comment
upstream_mod_remotes: N/A (checked 2026-09-28: no GitHub link on the current Workshop page, the profile,
  or a 2025-06-23 web.archive.org snapshot of the page)
dependencies: none
showcase:     icon (new source 2026-10-11) and Preview regenerated and inspected directly on 2026-10-11; in-game review pending
tested_on:    5dcfd0d, 2026-10-11 and 12 (P1 to P6 green; see docs/runs/2026-09-25.md)
automated:    PASS - 389 mod checks, 12 XML files; 104 translation entries; offline checks rerun 2026-10-11
manual_tests: Tests/TEST_SCENARIOS.md - 9 scenarios, each mapped to a green Pickle scenario or a justified not-applicable (TESTING.md)
workshop:     3806760667 - 0.1.0 pre-publication of 2026-09-23, private item, never made public
code_review_sha: 3c6fea13d3d3ff2b2af1d43119d5b96ffcebdf60
echo_review_sha: 9cfb169551489aec52dba289ed69ad43faae5c38
social_preview_sha256: 30a8f6caa9c144f5bd9b15bb3de44745ca5fb36b67afdc619273560f2a312378
remaining:
  - feature: Pickle step `the load of the mod {string} is clean` (PickleTools, pending) may replace the local load check of 01; verify coverage first
  - unverified: Dogs mate (Continued) examined 2026-10-02 and not applicable, no analogue group (BACKLOG.md); no conditional set for it
  - unverified: whether a long French text fits or clips in a window. Not automated, see TESTING.md, so it needs a person
  - unverified: Preview and icon appearance in the game UI
maintainer:   Claude Code - responsible for this repository and STATUS.md (previously Codex)
session:      local_4dabc8d0-f966-4200-86c1-1de86349a7e8
updated:      2026-10-15, gallery accepted by the owner (3 images), now mountPreview[1.0.0]
protocols_read_sha: 6eeb289af92096fa3a7ee40825e3b5221030873d
---

# Ebbbs Renew, status

## shootGallery done, mountPreview next - 2026-10-15

Echo decision: redone from the gallery (`Art/echo-source.png`, an ebbb line-art; `Art/Preview.config.json` `echo.file` follows, flipX dropped), Preview and `0-` copy regenerated, opened at full size: the echo reads in the empty panel area. `echo_review_sha` and `social_preview_sha256` set; the new `Preview.png` must be uploaded as the GitHub social preview by the owner (manual). Gallery images are being replayed (P7, ticket be71): if an accepted image changes, this echo is reviewed again.

**Previous: `shootGallery[1.0.0]`. Retained: `mountPreview[1.0.0]`.** Gallery accepted by the owner: `Art/Gallery/` holds `0-preview.png` and three images (P7 green, tickets b6db and 5dee, Nelim as protagonist, animals facing the camera). | Order | File | Shows |: 1 `1-keeper-and-nine.png` wide shot, 2 `2-keeper-ebbb-beee.png` close shot, 3 `3-wildness-card.png` the Wildness information card (taken on the exhibition zone; a "-height" zone of the Sanctuary would crop better, accepted as is). No ADS2 or Nocturnal Animals image: no scenario, left for a later version. `Mod/` changed since `code_review_sha` only in the `About.xml` description, read by the session.

## playTests done, shootGallery next - 2026-10-12

**Previous: `playTests[1.0.0]`. Retained: `shootGallery[1.0.0]`.** 8.c: P1 to P6 green on `5dcfd0d` (P1 15, P2 9, P3 2, P4 8, P5 6, P6 8 played; skips are `@requires` sets with their own pass; all four conditional sets played). 8.d: P1 `@review` capture opened at full size, nine silhouettes on open sand. 8.e: no `@wip`. 8.m: reviewed by a read-only reviewer over `Mod/Patches`, `About.xml` and `EbbbsSteps.cs`: no defect in the mod, two test-code risks consigned in `remaining`; its two questions (packageIds and FindMod names) are answered by the green P3, P4, P5 and P6. `code_review_sha` set. Protocols re-read after `a5c7cf4` (AGENTS, AUDIT, GALLERY, PICKLE, PUBLISHING, STYLE, TRANSLATIONS diffs). Declared: local scripts to Audit workflow (3 rows validated in `scripts/LOCAL_SCRIPTS.md`), publication scripts to CI/CD, 26 local steps to NPT. Feature 11 is rewritten at this stage (fixture retired).

## Audit against the 15-state AUDIT.md, 2026-10-11

**Previous: `done`. Retained: `playTests[1.0.0]`** (correspondence table, `done` is `playTests`). Protocols: AUDIT.md `a5c7cf4`, AGENTS.md `84e645e`, dispatcher WELCOME.md read; `protocols_read_sha` written.

- `writeTests` met: `Validate-Mod.ps1` 389 checks and `Validate-Translations.ps1` 104 texts replayed green today; `Check-Steps.ps1` not rerun (needs the Pickle assemblies path). The manual scenarios file is now `Tests/TEST_SCENARIOS.md` (was `MANUAL.md`; AUDIT 7.a name), references updated.
- Evidence for 8.c: none on the current tree. The seven requests of 2026-10-02 (owner `local_641d4013`) left no result; `Mod/About/Preview.png` changed after them (`cd3fac4`). P1 to P7 are resubmitted from this session.
- Fixed: one em dash in the Steam description of `PUBLICATION.md`; `stage` field removed; journal before 2026-09-26 folded into `docs/runs/STATUS-journal-2026-09.md`.
- Not yet: 8.c to 8.l, `code_review_sha` (8.m, at the end of `playTests`).
- Closing pass 3 (AGENTS.md): `_tools/` removed. `Build-French.ps1` moved to `scripts/`; `Generate-FrenchReview.mjs` replaced by the shared `scripts/Make-FrenchReview.ps1` (`FRENCH_REVIEW.md` regenerated at `cd3fac4`, same 104 texts, so the owner's validation of 2026-10-02 stands). `.build/` renamed `build/` (`.gitignore`, `Tests/Pickle/Source/Directory.Build.props`; the old folder held only obj and is deleted).
- Open for the owner: `Art/ModIcon-signature-candidate.png` (untracked candidate, accept or refuse).

## Title set to "Ebbbs Renew", 2026-10-02

Owner: "Ebbbs (Continued)" did not match the collection standard; the title is `Ebbbs Renew`. `About.xml`, README, PUBLICATION, validator, test companion, FRENCH_REVIEW and `Art/Preview.config.json` follow. `Mod/About/Preview.png` is rendered art and may still show the old title: the owner regenerates it. All passes are replayed on the new revision.

## French validated by the owner, 2026-10-02

Virginie read FRENCH_REVIEW.md and validated it linguistically after two fixes (ThrumebbbHorn.description, Bebbbholder.description, commit 5e40130). `translation_fr` set to `complete`; FRENCH_REVIEW.md regenerated from that revision.

## Audit against AUDIT.md (re-read, monorepo `c770fd1e`), 2026-10-02

**Retained stage: `done` (`workflow_stage: done`), unchanged.** Revision `3336068`, tree clean. Session title: `ebbbs / done`.

- `done -> tested` still blocked, as before: no `@wip` (checked, none); the four conditional sets are `@requires:` on `Coolie.Ebbbs`, `DizzyEevee.BetterCrossbreeding`, `Mlie.XNDNocturnalAnimals`, `SamBucher.ADogSaidAnimalProsthetics2` and each needs its pass; P1 to P6 are not yet replayed on `nelim.ebbbs`; M1 to M9 are all mapped to a Pickle scenario or justified not-applicable (`TESTING.md`), so no manual test remains once the passes are green. The only report on disk (`p1-english`, 2026-09-29) is 15 passed, 12 skipped by requirement: not enough.
- `PublishedFileId.txt` exists (`3806760667`), tracked since `04756dd`; `CHANGELOG.md` already opens its published part with `0.1.0`. Nothing to add.
- `.dds`: none tracked in git (0 of `git ls-files`), `*.dds` already in `.gitignore`; copies stay on disk only.
- `upstream_mod_remotes`: `N/A`, checked 2026-09-28; unchanged.
- Evidence: git holds none (`Tests/Pickle/Evidence/` ignored). On disk, `p1-english` cut from 9.5 MB to 0.5 MB: `report.html` and `messages.ndjson` deleted, the one `@review` capture converted to a 1600 px JPEG. Rule for what to keep: `docs/runs/README.md`.
- Reading record: `docs/PROTOCOLS-READ.md` updated with versions.

## Translation audit: `translation_fr` reset, `FRENCH_REVIEW.md` generated, 2026-09-30

Per TRANSLATIONS.md's 2026-09-30 French gender-agreement rule, every mod with a
`Languages/French` folder had `translation_fr` reset to `unchecked`. Re-audited this mod:

- Text lives in three files, no Keyed folder: `Languages/French/DefInjected/{BodyDef,PawnKindDef,ThingDef}/Ebbbs.xml`.
- 104 entries: BodyDef custom part labels (56), PawnKindDef labels + Thrumebbb life-stage labels (11), ThingDef labels/descriptions/tool labels/meatLabel (37).
- None of them agree with a pawn's own gender: every string names an animal, a body part,
  or an item, in the third person. No `{PAWN_gender ? ...}` switch exists anywhere in the
  mod, and none is needed, the 2026-09-30 rule does not apply here.
- `FRENCH_REVIEW.md` (mod root, not in `Mod/`) generated by `scripts/Make-FrenchReview.ps1`
  from the shipped Defs and DefInjected XML, revision `aa0e2d4`. One table per file, in
  shipped order, Original = English (no other source language for this mod).
- `translation_fr` set to `partial`: the session's own checks pass, but per TRANSLATIONS.md
  only Virginie's own reading can set it to `complete`. Awaiting her review of `FRENCH_REVIEW.md`.

## Licence reclassified: `silent` -> `authorized`, 2026-09-28

**Stage unchanged: `done`.** The 2026-09-13 audit below found no licence and no authorization in five
places (a file, the upstream `About.xml`, its `README.md`, a linked repository, the Workshop
description) and classified the mod `silent`. Checking the Workshop page itself (not part of that
audit) turned up a sixth place: a still-visible Steam comment by the author, coolziecat, dated 6 Jul
2024, replying to a request to update the mod for 1.5: "I do give people permission to do whatever
with this mod though... If you want em in your game, you're 100% free to update it for 1.5!" This is
explicit, broad, unconditional authorization, found on the owner's decision (2026-09-28) to reclassify
rather than treat it as a silent, unauthorized continuation. Quote and citation in `ATTRIBUTION.md`.

- Corrected the now-false "published without the original author's explicit consent" sentence in
  `README.md`, `Mod/About/About.xml` and `PUBLICATION.md`'s Steam description block, to name the
  authorization instead.
- **Renamed (owner's decision, same day):** `Ebbbs Renew (unofficial)` -> `Ebbbs (Continued)`,
  following the community convention for an authorized continuation (`PUBLISHING.md`, "Mod «
  (Continued) » ou repris"). The opening description line changed from `UNOFFICIAL. ...` to
  `Original mod by coolziecat. Continued with their explicit permission ...`, in `About.xml`,
  `README.md` and `PUBLICATION.md`'s Steam description block. `Tests/Pickle/Mod/About/About.xml`'s
  `displayName` and `Tests/Validate-Mod.ps1`'s title check follow the same rename. The folder, the
  repository (`Rimworld-Ebbbs-Renew`), the packageId (`nelim.ebbbs`) and every internal "Ebbbs
  Renew" reference used purely as a project/log identifier (this file's own header, the Pickle
  steps' `Ebbbs Renew:` log prefix, `WORKSHOP_COMMENTS.md`'s `Covers` registry) are untouched: the
  rename is the in-game title only.
- `upstream_mod_remotes: N/A` (frontmatter, added same day): no GitHub link found on the current page,
  the author's profile, or a 2025-06-23 `web.archive.org` snapshot, despite the 2024 comment
  mentioning one was in the description then.

## packageId shortened to `nelim.ebbbs`, 2026-09-28

**Stage unchanged: `done`.** At the owner's request the `Renew` suffix left the packageId: `nelim.ebbbsrenew` became `nelim.ebbbs` (and the Pickle companion `nelim.ebbbs.pickletests`), in `About.xml`, the features, the ADS2 pass map and the validator. Safe now because the Workshop item `3806760667` is private and was never public: nobody has the old id in a mod list. The folder, the repository, the title and the dispatcher name stay `EbbbsRenew`. P3 (`e7e5`) was green on the old id; that changed `Mod/` and `Tests/`, so P1 to P6 are replayed on the new one (`docs/runs/2026-09-25.md`).

## P5 and P6 green, one bug found and fixed, 2026-09-27

**Stage unchanged: `done`.** P5 (ticket `5d95`) was green first try, 6 of 6. P6 (ticket `e892`) failed one scenario
of 8: the patch declared the extension class as `DZY.Crossbreeding.Extension`, but the mod's own DLL (decompiled
with `ilspycmd`) names it `DZY.CrossBreeding.Extension` (capital B). Fixed in the patch, the local step, the
validator, the feature text and `BACKLOG.md`; the replay (ticket `cd68`, evidence `p6-crossbreeding-3`) is green,
8 of 8. Both conditional sets (`09`, `10`) are now proven. Record: `docs/runs/2026-09-25.md`.

Next: replay P1 to P4 on this revision (P1 requested, ticket `20260927-102349-582-e6f9`), then `tested`.

## Older journal

Sections dated 2026-09-25 and earlier (Nocturnal Animals and Better Crossbreeding, A Dog Said 2, Pickle suite, the 2026-09-24 audit, 2026-09-13 follow-ups): `docs/runs/STATUS-journal-2026-09.md`.

## ModIcon source replaced, 2026-10-11

The owner replaced `Art/ModIcon-source.png` (new signature icon). Derivatives regenerated mechanically: `Preview.config.json` gained `"modIconSource"`, `Render-Preview.cjs` wrote `Mod/About/ModIcon.png` (128 x 128, 11.8 KB), `Mod/About/Preview.png`, `Art/Gallery/0-preview.png` (byte-identical), `Art/ModIcon.ico`, `Art/Preview.ico`. Both images opened and looked at. The seven queued tickets (all unstarted) were cancelled and resubmitted on the commit that carries them. GitHub social preview upload is the owner's (manual).
