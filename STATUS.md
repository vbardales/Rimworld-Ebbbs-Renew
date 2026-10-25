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
workflow_stage: shootGallery[1.0.0]
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
publication_changelog_review_sha: 87d3f81446ab952e4fbf2289390218a0d2a2b694
code_review_sha: 3c6fea13d3d3ff2b2af1d43119d5b96ffcebdf60
echo_review_sha: 625a5537b0a047297013a7c09df17578f86532d3
social_preview_sha256: 827eea5757a40d75f3cdc28102f35e63f1f6f6415c0b1a2a4a802b23fa53e504
remaining:
  - feature: Pickle step `the load of the mod {string} is clean` (PickleTools, pending) may replace the local load check of 01; verify coverage first
  - unverified: Dogs mate (Continued) examined 2026-10-02 and not applicable, no analogue group (BACKLOG.md); no conditional set for it
  - unverified: whether a long French text fits or clips in a window. Not automated, see TESTING.md, so it needs a person
  - unverified: Preview and icon appearance in the game UI
maintainer:   Claude Code - responsible for this repository and STATUS.md (previously Codex)
session:      local_4dabc8d0-f966-4200-86c1-1de86349a7e8
updated:      2026-10-17, French reread and validated by the owner
protocols_read_sha: 62717d6c088af66129f3b032a5c173b9c1e2581e
---
# Ebbbs Renew, status
**Status, 2026-10-13: 1.0.0 published and public; 1.1.0 prepared, not published.** The item (`PublishedFileId.txt` 3811289805) was created private on 2026-10-01 (0.1.0 prepublication), `1.0.0` went out through the CI on 2026-10-13 (run 38409430019, tag `v1.0.0`) and was made public by the owner the same day. `1.1.0` (the 1.7 Steam tag and the new header image) has a green dry-run (run 38414526235 on `414de05`) and waits for the owner's go and her approval of `steam-production`. The workflow stage is `publish[1.1.0]` (see `STATUS.md`).
## Ticket e7fd read, 2026-10-25

`20261019-203822-218-e7fd` (`Tests/Pickle/Inbox/p7-gallery-redo-4`): 3 passed, 1 failed. Wide shot failed: step `I frame the cell (200, 186) at zoom 6` timed out after 40 s (game or harness timing, not a mod def); replay it alone. Captures opened: portrait (thrumebbb front, jug, fire, torches) kept as candidate; close shot REFUSED (ebbb, beee, table and jug scattered, Nelim small at the top, not close); family REFUSED (Nelim cropped at the top edge, babies are dots, cast scattered). Retake filed: ticket `20261025-145545-682-4a5f` (replaces cancelled 0db0; wide, close, family, family now holds the jug; evidence `Tests/Pickle/Inbox/p7-gallery-redo-5`; shotlist estimate 4 for each, risks in the feature header; no Opus director pass, retake only). Inbox folder stays until the wide shot and the two refusals are replayed. Working tree carries uncommitted `Art/echo-source.png` deletion and `scripts/Build-French.ps1` deletion, not made by this session: owner to confirm.

## Preview regenerated and echo validated, 2026-10-25

Owner changed `Art/Preview.config.json` (panel/icon schema, `echo.file: echo-preview.png`, `echo-source.png` retired). `Render-Preview.cjs` rerun, Preview opened (title, summary, rule, `1.6` badge, echo in panel, nothing clipped), `0-preview.png` byte copy. Owner validated the echo; `echo_review_sha` and `social_preview_sha256` updated, new `Preview.png` uploaded as GitHub social preview via Chrome (shown in Settings, General).

## Gallery retake state, 2026-10-25

Tomi and Sori replaced by Soren and Miel (NSB daily looks, not validated in LOOKS-VALIDATION.md; owner authorised in chat; outfits and expressions are suggestions, default smile). Tickets: close shot and family `20261025-145724-452-4fe3` (`Inbox/p7-gallery-redo-5`); wide shot `20261025-150012-965-b249` (`Inbox/p7-gallery-redo-6`, map `Tests/Pickle/wsl-deps.gallery-looks.map` = sanctuary map plus Roo hair and tattoo mods, loading unverified). Cancelled: 0db0, 4a5f, 778a. Plan rating 4.0, 4.5, 4.5, 4.0 (mean 4.25): e weak everywhere (static poses), j weak on 1 and 4.
Waiting on NPT: ticket 1071 proves the job and advance steps (`I advance the paused game by exactly N ticks`, forced jobs for pawns and animals); step `the animal "X" is forced into the job "Ingest" on the item "Milk" at (x, z)` built, not played. NPT tells this session when 1071 is read. Zoom floor is 2: the baby ebbb needs a tighter crop on the capture.
Next: at RUN_DONE of 4fe3 and b249 open the captures, verdict first, then reindex, subtitle from `Art/Gallery-clean`, replace the published gallery only with the owner's OK. The accepted portrait of e7fd stays in `Inbox/p7-gallery-redo-4` until then.

## Evidence migrated, 2026-10-19

Inbox model applied: `Tests/Pickle/Evidence/` holds only `p3-incompat`, `p4-ads2` (trimmed to 4), `p5-nocturnal`, `p6-crossbreeding` (trimmed to 3), each with `RELEASE.md` (67 KB); `Inbox/` empty, no `Parked/`, nothing of this mod left in `pickle-reports-archive/`. 2026-10-20 triage: `p1-labels-17-3` (1.7 labels, killed 137, no report) deleted; `p7-gallery-redo-3` (OOM-killed at 4 GB, 2 of 3 scenarios green, wide shot red: `Tomi` is Female so body type Male refused) deleted, cause fixed in feature 11 (`gender is male` / `female` before body type). Waiting: ticket `20261019-203822-218-e7fd` (gallery scenes 1 to 4, `Tests/Pickle/Inbox/p7-gallery-redo-4`). The 1.7 labels diagnostic (`tested_1_7`) is still unknown and must be refiled.

## Tickets read, 2026-10-18

- `6716` wide rework: launcher error (`rm ... Directory not empty` in Mods staging), no report; refiled in the new ticket below.
- `5987` new shots: 2 of 2 passed, captures opened and REFUSED on the old tree: portrait, Nelim hidden behind the jug and tiny (zoom 4.5 too wide); family, baby a dot, crebbb cropped at the top, Nelim and animals scattered. Fixes: zoom 3.5 and 3, Nelim at (200,190), crebbb at (203,189). The thrumebbb itself reads well, front view, kept.
- `810c` 1.7 diagnostic (P1, English): 14 passed, 1 failed, 17 skipped (requirements). Failure: `the English labels and descriptions reach the loaded definitions`, step `the main menu is open` timed out after 5 s (a game or harness timing, not a mod def). `tested_1_7` stays unrecorded until that scenario is replayed alone once.
- `bfda` card retake: `no free standable cell was found near (90, 0, 140)` (bamboo). The accepted `3-wildness-card.png` stays: interface window, set aside by the owner rule (not scored).
## Gallery reopened, 2026-10-18

Owner rule via Audit: every scene scored 4 or more before it is played. `workflow_stage: shootGallery[1.0.0]`. Shotlist (header of `11-publication-shots.feature`, estimates in its "SHOTLIST ESTIMATE" block):

| # | Shot, outfit (colours) | Hour | Score a-k | Risk and plan |
|---|---|---|---|---|
| 1 | wide, jug carried; mustard shirt, brown trousers; staggered nine, guests seated | 17h | 4 | overlap or crop: radius 3 two depths, retake radius 4 |
| 2 | thrumebbb portrait, jug held out; teal jacket, cream trousers | 18h | 4 | turns away or crops: zoom 4.5, spawn 4 cells away |
| 3 | ebbb and beee close, jug offered; rose shirt, charcoal trousers | 19h | 4 | not front: spawn facing South, retake |
| 4 | ebbb family 3 ages, watching; cream shirt, indigo duster | 20h | 4 | dark, life-stage step unproven: 2 lamps + fire, drop scene if step fails |
| 5 | Wildness card, interface | menu | not scored | set aside (owner rule) |

Audit read of 2026-10-18 answered: outfit per scene, own decor per scene, action per scene, risk with plan in the header (a to k). Tickets 6716 and 5987 started on the earlier tree: judge their captures against this table, refile what differs.

Lowest 3 before rework (2 and 4); captures under 4 to redo: old 1 and old card. New images stay candidates; the published gallery is replaced only with Virginie's OK. Ticket 5987 (new shots) played the pre-fix feature: refile.

## Gallery image 1 rework in flight, 2026-10-17

Owner asked to rework the gallery. Image 1 judged weak (nine scattered at the edge of the lit square, Nelim tiny, guests not visible). Feature 11 wide shot tightened (`0010074`: zoom 6 on (200, 186), half circle 3 cells). Ticket `20261017-233911-150-6716` (filter `11-publication-shots::wide shot`, evidence `Tests/Pickle/Evidence/p7-wide-rework`) waits. 1.7 diagnostic filed too: ticket `20261017-234127-872-810c` (P1 minimal English, `-Game /home/nelim/rimworld17`, evidence `Tests/Pickle/Evidence/p1-english-17`); `tested_1_7` recorded at its `RUN_DONE`. The third-party passes (P3 to P6) are not filed for 1.7: they depend on those mods' own 1.7 support.
Gallery concept moved to five images (owner OK 2026-10-17, `c0b163a`): 1 wide 17h, 2 thrumebbb portrait 18h (new), 3 close shot 19h (current 2), 4 ebbb family at three life stages 20h (new), 5 Wildness card (current 3). Ticket `20261017-234519-746-5987` (evidence `Tests/Pickle/Evidence/p7-new-shots`) plays the two new scenarios. Renumber and re-subtitle once accepted.
Next: open capture, verdict, replace `Art/Gallery-clean/1-*`, re-subtitle, re-review echo.

## Gallery subtitles, 2026-10-17

Images 1 and 2 subtitled with `scripts/Add-Subtitle.ps1` (lines in `PUBLICATION.md`, section "Gallery subtitles"); clean originals in `Art/Gallery-clean/`. Both opened: line readable, one line, hides no subject. Image 3 (interface card) and `0-` have none. Scene content unchanged, echo (`Art/echo-source.png`) reviewed again against the subtitled images: still fits, `echo_review_sha` moved to `14c20b2`.

## French re-validated, 2026-10-17

Virginie reread FRENCH_REVIEW.md after three ChatGPT review rounds and validated (`translation_fr` stays `complete`). Fixes applied: Goliebbb and Thrumebbb descriptions without addressing the player, ThrumebbbHorn wording, Crebbb `nutrition` typo, PUBLICATION/CHANGELOG wording. Last commit: `87d3f81`. Owner also validated PUBLICATION.md and CHANGELOG.md at that commit (`publication_changelog_review_sha`). `code_review_sha` stale (Mod/ text changes), reviewed at `prepareRelease`.

## shootGallery done, mountPreview next - 2026-10-15

Echo decision: redone from gallery (`Art/echo-source.png`, ebbb line-art; `Art/Preview.config.json` `echo.file` follows, flipX dropped). Preview and `0-` copy regenerated, opened full size: echo reads in empty panel area. `echo_review_sha` and `social_preview_sha256` set; owner must upload new `Preview.png` as GitHub social preview (manual). Gallery images being replayed (P7, ticket be71): if accepted image changes, echo reviewed again.

**Previous: `shootGallery[1.0.0]`. Retained: `mountPreview[1.0.0]`.** Gallery accepted by owner: `Art/Gallery/` holds `0-preview.png` and three images (P7 green, tickets b6db and 5dee, Nelim as protagonist, animals facing camera). | Order | File | Shows |: 1 `1-keeper-and-nine.png` wide shot, 2 `2-keeper-ebbb-beee.png` close shot, 3 `3-wildness-card.png` Wildness information card (taken on exhibition zone; "-height" zone of Sanctuary would crop better, accepted as is). No ADS2 or Nocturnal Animals image: no scenario, left for later version. `Mod/` changed since `code_review_sha` only in `About.xml` description, read by session.

## playTests done, shootGallery next - 2026-10-12

**Previous: `playTests[1.0.0]`. Retained: `shootGallery[1.0.0]`.** 8.c: P1 to P6 green on `5dcfd0d` (P1 15, P2 9, P3 2, P4 8, P5 6, P6 8 played; skips are `@requires` sets with own pass; all four conditional sets played). 8.d: P1 `@review` capture opened full size, nine silhouettes on open sand. 8.e: no `@wip`. 8.m: reviewed by read-only reviewer over `Mod/Patches`, `About.xml` and `EbbbsSteps.cs`: no mod defect, two test-code risks consigned in `remaining`; its two questions (packageIds and FindMod names) answered by green P3, P4, P5, P6. `code_review_sha` set. Protocols re-read after `a5c7cf4` (AGENTS, AUDIT, GALLERY, PICKLE, PUBLISHING, STYLE, TRANSLATIONS diffs). Declared: local scripts to Audit workflow (3 rows validated in `scripts/LOCAL_SCRIPTS.md`), publication scripts to CI/CD, 26 local steps to NPT. Feature 11 rewritten at this stage (fixture retired).

## Audit against the 15-state AUDIT.md, 2026-10-11

**Previous: `done`. Retained: `playTests[1.0.0]`** (correspondence table, `done` is `playTests`). Protocols: AUDIT.md `a5c7cf4`, AGENTS.md `84e645e`, dispatcher WELCOME.md read; `protocols_read_sha` written.

- `writeTests` met: `Validate-Mod.ps1` 389 checks and `Validate-Translations.ps1` 104 texts replayed green today; `Check-Steps.ps1` not rerun (needs Pickle assemblies path). Manual scenarios file now `Tests/TEST_SCENARIOS.md` (was `MANUAL.md`; AUDIT 7.a name), references updated.
- Evidence for 8.c: none on current tree. Seven requests of 2026-10-02 (owner `local_641d4013`) left no result; `Mod/About/Preview.png` changed after them (`cd3fac4`). P1 to P7 resubmitted from this session.
- Fixed: one em dash in Steam description of `PUBLICATION.md`; `stage` field removed; journal before 2026-09-26 folded into `docs/runs/STATUS-journal-2026-09.md`.
- Not yet: 8.c to 8.l, `code_review_sha` (8.m, end of `playTests`).
- Closing pass 3 (AGENTS.md): `_tools/` removed. `Build-French.ps1` moved to `scripts/`; `Generate-FrenchReview.mjs` replaced by shared `scripts/Make-FrenchReview.ps1` (`FRENCH_REVIEW.md` regenerated at `cd3fac4`, same 104 texts, so owner's validation of 2026-10-02 stands). `.build/` renamed `build/` (`.gitignore`, `Tests/Pickle/Source/Directory.Build.props`; old folder held only obj, deleted).
- Open for owner: `Art/ModIcon-signature-candidate.png` (untracked candidate, accept or refuse).

## Title set to "Ebbbs Renew", 2026-10-02

Owner: "Ebbbs (Continued)" did not match collection standard; title is `Ebbbs Renew`. `About.xml`, README, PUBLICATION, validator, test companion, FRENCH_REVIEW and `Art/Preview.config.json` follow. `Mod/About/Preview.png` is rendered art, may still show old title: owner regenerates. All passes replayed on new revision.

## French validated by the owner, 2026-10-02

Virginie read FRENCH_REVIEW.md, validated linguistically after two fixes (ThrumebbbHorn.description, Bebbbholder.description, commit 5e40130). `translation_fr` set to `complete`; FRENCH_REVIEW.md regenerated from that revision.

## Audit against AUDIT.md (re-read, monorepo `c770fd1e`), 2026-10-02

**Retained stage: `done` (`workflow_stage: done`), unchanged.** Revision `3336068`, tree clean. Session title: `ebbbs / done`.

- `done -> tested` still blocked, as before: no `@wip` (checked, none); four conditional sets are `@requires:` on `Coolie.Ebbbs`, `DizzyEevee.BetterCrossbreeding`, `Mlie.XNDNocturnalAnimals`, `SamBucher.ADogSaidAnimalProsthetics2`, each needs own pass; P1 to P6 not yet replayed on `nelim.ebbbs`; M1 to M9 all mapped to Pickle scenario or justified not-applicable (`TESTING.md`), so no manual test remains once passes green. Only report on disk (`p1-english`, 2026-09-29) is 15 passed, 12 skipped by requirement: not enough.
- `PublishedFileId.txt` exists (`3806760667`), tracked since `04756dd`; `CHANGELOG.md` already opens published part with `0.1.0`. Nothing to add.
- `.dds`: none tracked in git (0 of `git ls-files`), `*.dds` already in `.gitignore`; copies stay on disk only.
- `upstream_mod_remotes`: `N/A`, checked 2026-09-28; unchanged.
- Evidence: git holds none (`Tests/Pickle/Evidence/` ignored). On disk, `p1-english` cut from 9.5 MB to 0.5 MB: `report.html` and `messages.ndjson` deleted, the one `@review` capture converted to 1600 px JPEG. Rule for what to keep: `docs/runs/README.md`.
- Reading record: `docs/PROTOCOLS-READ.md` updated with versions.

## Translation audit: `translation_fr` reset, `FRENCH_REVIEW.md` generated, 2026-09-30

Per TRANSLATIONS.md 2026-09-30 French gender-agreement rule, every mod with `Languages/French` folder had `translation_fr` reset to `unchecked`. Re-audited this mod:

- Text lives in three files, no Keyed folder: `Languages/French/DefInjected/{BodyDef,PawnKindDef,ThingDef}/Ebbbs.xml`.
- 104 entries: BodyDef custom part labels (56), PawnKindDef labels + Thrumebbb life-stage labels (11), ThingDef labels/descriptions/tool labels/meatLabel (37).
- None agree with pawn's own gender: every string names animal, body part, or item, in third person. No `{PAWN_gender ? ...}` switch exists anywhere in mod, none needed, 2026-09-30 rule does not apply here.
- `FRENCH_REVIEW.md` (mod root, not in `Mod/`) generated by `scripts/Make-FrenchReview.ps1` from shipped Defs and DefInjected XML, revision `aa0e2d4`. One table per file, shipped order, Original = English (no other source language for this mod).
- `translation_fr` set to `partial`: session's own checks pass, but per TRANSLATIONS.md only Virginie's own reading can set `complete`. Awaiting her review of `FRENCH_REVIEW.md`.

## Licence reclassified: `silent` -> `authorized`, 2026-09-28

**Stage unchanged: `done`.** 2026-09-13 audit below found no licence and no authorization in five places (a file, upstream `About.xml`, its `README.md`, linked repository, Workshop description) and classified mod `silent`. Checking Workshop page itself (not part of that audit) turned up sixth place: still-visible Steam comment by author, coolziecat, dated 6 Jul 2024, replying to request to update mod for 1.5: "I do give people permission to do whatever with this mod though... If you want em in your game, you're 100% free to update it for 1.5!" Explicit, broad, unconditional authorization, found on owner's decision (2026-09-28) to reclassify rather than treat as silent, unauthorized continuation. Quote and citation in `ATTRIBUTION.md`.

- Corrected now-false "published without the original author's explicit consent" sentence in `README.md`, `Mod/About/About.xml` and `PUBLICATION.md` Steam description block, to name authorization instead.
- **Renamed (owner's decision, same day):** `Ebbbs Renew (unofficial)` -> `Ebbbs (Continued)`, following community convention for authorized continuation (`PUBLISHING.md`, "Mod « (Continued) » ou repris"). Opening description line changed from `UNOFFICIAL. ...` to `Original mod by coolziecat. Continued with their explicit permission ...`, in `About.xml`, `README.md` and `PUBLICATION.md` Steam description block. `Tests/Pickle/Mod/About/About.xml` `displayName` and `Tests/Validate-Mod.ps1` title check follow same rename. Folder, repository (`Rimworld-Ebbbs-Renew`), packageId (`nelim.ebbbs`) and every internal "Ebbbs Renew" reference used purely as project/log identifier (this file's header, Pickle steps' `Ebbbs Renew:` log prefix, `WORKSHOP_COMMENTS.md` `Covers` registry) untouched: rename is in-game title only.
- `upstream_mod_remotes: N/A` (frontmatter, added same day): no GitHub link found on current page, author's profile, or 2025-06-23 `web.archive.org` snapshot, despite 2024 comment mentioning one in description then.

## packageId shortened to `nelim.ebbbs`, 2026-09-28

**Stage unchanged: `done`.** At owner's request `Renew` suffix left packageId: `nelim.ebbbsrenew` became `nelim.ebbbs` (and Pickle companion `nelim.ebbbs.pickletests`), in `About.xml`, features, ADS2 pass map and validator. Safe now because Workshop item `3806760667` is private, never public: nobody has old id in mod list. Folder, repository, title and dispatcher name stay `EbbbsRenew`. P3 (`e7e5`) green on old id; that changed `Mod/` and `Tests/`, so P1 to P6 replayed on new one (`docs/runs/2026-09-25.md`).

## P5 and P6 green, one bug found and fixed, 2026-09-27

**Stage unchanged: `done`.** P5 (ticket `5d95`) green first try, 6 of 6. P6 (ticket `e892`) failed one scenario of 8: patch declared extension class as `DZY.Crossbreeding.Extension`, but mod's own DLL (decompiled with `ilspycmd`) names it `DZY.CrossBreeding.Extension` (capital B). Fixed in patch, local step, validator, feature text and `BACKLOG.md`; replay (ticket `cd68`, evidence `p6-crossbreeding-3`) green, 8 of 8. Both conditional sets (`09`, `10`) now proven. Record: `docs/runs/2026-09-25.md`.

Next: replay P1 to P4 on this revision (P1 requested, ticket `20260927-102349-582-e6f9`), then `tested`.

## Older journal

Sections dated 2026-09-25 and earlier (Nocturnal Animals and Better Crossbreeding, A Dog Said 2, Pickle suite, 2026-09-24 audit, 2026-09-13 follow-ups): `docs/runs/STATUS-journal-2026-09.md`.

## ModIcon source replaced, 2026-10-11

Owner replaced `Art/ModIcon-source.png` (new signature icon). Derivatives regenerated mechanically: `Preview.config.json` gained `"modIconSource"`, `Render-Preview.cjs` wrote `Mod/About/ModIcon.png` (128 x 128, 11.8 KB), `Mod/About/Preview.png`, `Art/Gallery/0-preview.png` (byte-identical), `Art/ModIcon.ico`, `Art/Preview.ico`. Both images opened and looked at. Seven queued tickets (all unstarted) cancelled and resubmitted on commit that carries them. GitHub social preview upload is owner's (manual).
