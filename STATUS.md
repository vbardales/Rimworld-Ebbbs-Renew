---
localization: complete
translation_en: complete
translation_fr: complete
settings_audit: not_applicable
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
showcase:     icon and Preview present, both inspected directly on 2026-09-24; in-game review pending
tested_on:
automated:    PASS - 257 mod checks, 10 XML files; 104 translation entries and injection paths; Pickle step check, 377 step lines all resolved; all rerun 2026-09-24
manual_tests: Tests/MANUAL.md - 9 scenarios, none executed. TESTING.md maps each to a Pickle scenario (25 written in 8 features; P1 and P2 played once, 2 failed on the companion's log lines, fix requested) or a justified not-applicable
workshop:     3806760667 - 0.1.0 pre-publication of 2026-09-23, private item, never made public
remaining:
  - unverified: never seen running in game, so every Pickle scenario and every in-game check is open. The four passes, P1 English, P2 French, P3 incompatibility and P4 A Dog Said 2, are in TESTING.md. Each is one request to the TicketDispatcher. the four final passes ran on 2026-09-25 from ff6b205 (record in docs/runs/2026-09-25.md): P2 French is green, 9 of 9. P1 English failed 6 map scenarios on "Accessing map pawns off main thread", which looks environmental and is being reproduced with one scenario (request 20260925-153756-781-c5c6). P4 failed because the staging loaded A Dog Said 2 before this mod; the pass map now corrects that and the four scenarios of feature 08 passed 4 of 4 in a running game (request 20260925-153755-054-9822), so the native support for A Dog Said 2 works. P3 timed out on its first step, and every menu scenario now waits for the game to finish starting (request 20260925-153753-095-0959). No pass has yet been green apart from P2, and the full P1, P3 and P4 come again after these three small requests, from e81ba40. Nothing under Mod/ or Tests/Pickle/Mod/ may change until the three are done
  - unverified: how the game's own mod sorting places this mod relative to A Dog Said 2 in a real mod list. The native support itself passed in a running game on 2026-09-25 with this mod staged first (feature 08, 4 of 4), and the staging does not sort by loadBefore, so that part is the game's and is not tested
  - unverified: the fix to the two log scenarios, requested as 20260924-235620-812-a03b. P1 and P2 played once on 2026-09-24: 13 of 15 and 7 of 9 scenarios passed, and the two that failed did so on two log lines about the test companion, not about the mod. No pass has been green as a whole. P3 and P4 have not been played
  - unverified: whether a long French text fits or clips in a window. Not automated, see TESTING.md, so it needs a person
  - unverified: Preview and icon appearance in the game UI
  - unverified: the incompatibility with the original in a running game, which is what pass P3 is for. The original is now in the WSL cache and its packageId, Coolie.Ebbbs, matches the one incompatibleWith names
  - feature: the Steam page text is fixed at creation and an update does not resend it, so the paragraph About.xml gained for A Dog Said 2 has to be added to the page by hand
maintainer:   Claude Code - responsible for this repository and STATUS.md (previously Codex)
session:      local_97069b1a-bbbd-4ae6-9bf1-337ff49bcc92
updated:      2026-09-25, four final passes read, three small requests submitted, tree frozen
---

# Ebbbs Renew — status

## Native support for A Dog Said 2, and the dispatcher — 2026-09-24

**Stage unchanged: `done`.** A change to `Mod/` invalidates the controls it touches, not the others, and each
of them was rerun.

- **Added.** `Mod/Patches/AnimalProsthetics2.xml` puts the nine species in the three cumulative animal
  categories of A Dog Said... Animal Prosthetics 2 (`SamBucher.ADogSaidAnimalProsthetics2`, Workshop
  3238353862): category 1 for the ebbb and the bebbbholder, 2 for the crebbb, the ebbberration, the drebbbd
  and the goliebbb, 3 for the beee, the ebbbomination and the thrumebbb. The placement is a decision, made
  from body size and trainability the way that mod's own lists place vanilla animals, and it is one file to
  change. `About.xml` declares `loadBefore` for it, because that mod copies its lists into its real recipes in
  its own last patch and a name added afterwards is never read. That is an order, not a dependency, so
  `dependencies` stays `none` and `modDependencies` stays absent.
- **Guard.** One `PatchOperationConditional` on `ADS_Cat1`, with no `nomatch`: without that mod the patch
  succeeds and does nothing. `MayRequire` is not used, since nothing reads it on an operation.
- **Offline, real data.** The patch was applied to that mod's own `Animal_Categories.xml`, taken from its
  public repository: each xpath matches exactly once, each species ends up in the right lists, and the copy
  its last patch makes then hands the recipes the right users. The one duplicate in the result is its own,
  `MonitorLizard` in category 2.
- **Offline, in the repository.** `Tests/Validate-Mod.ps1` grew from 204 to 257 checks: the order
  declaration, no `loadAfter` for it, one guarded patch with three additions, no `MayRequire`, every user a
  species of this mod, and each species in exactly the lists of its category. Four broken copies, one per
  rule, each fail with the intended message. `Check-XmlFields`, `Check-TypeRefs` and `Check-DefRefs` pass with
  the patch. `Check-XmlClasses` was not run: it needs a type list this session did not have.
- **Tests.** Feature `08-animal-prosthetics-2` and pass P4, with two more local steps, twenty-five scenarios
  in eight features. Not run.
- **Documentation.** README, CHANGELOG under 1.0.0, both `ATTRIBUTION.md` copies (identical), `About.xml`
  description and `TESTING.md`. The XML comment in `About.xml` about duplicate
  defNames was rewritten in this change, **wrongly**: see the correction of 2026-09-25 below.
- **The dispatcher.** The session registered with the TicketDispatcher, which now owns every run: one request
  per pass, no watcher, no follow-up task. A fix or an exploration plays one scenario, a first or a final
  validation plays every scenario of its pass. `Tests/Pickle/README.md` has the commands. P1 and P2 were
  submitted afterwards, on request; nothing is known of their result yet.
- **The session field was wrong** since the 2026-09-24 audit: it named the folder of this session's
  scratch space and not the session. It now reads `local_97069b1a-bbbd-4ae6-9bf1-337ff49bcc92`.

## Pickle suite written — 2026-09-24

**Previous stage: `preTest`. Retained stage: `done`.** The one criterion that held the mod at `preTest`,
Pickle tests written with their scope justified, is now met. Nothing else in the chain changed: the
audit below still stands for every other gate.

- **Written:** seven features and twenty-one scenarios in `Tests/Pickle/`, with a companion mod, eight
  local steps and a static step checker. `06` and `07` are generated from the translation inventory by
  `Tests/Pickle/New-LabelFeatures.ps1`, which stops on any key it has no shape for. Their scope is written
  in `TESTING.md`: each of M1 to M9 is a Pickle scenario, replaced by another, or not applicable with its reason.
- **Checked, offline:** the local steps compile against the reference stubs; `Check-Steps.ps1` resolves all
  347 step lines to exactly one step and rejects a deliberately undefined one; the two validators and the
  path checker pass again. No file under `Mod/` changed.
- **A fault found before any run:** every species is a ThingDef and a PawnKindDef of one name, and Pickle's
  own `def X field` and `def X raw stat` steps throw on a name held by two def databases. Using them would
  have cost a run. The suite's steps name the def type.
- **WITHDRAWN on 2026-09-25.** This bullet claimed the XML comment in `About.xml` was wrong to say a duplicate
  defName logs nothing, and that `Verse.DefDatabase.Add` logs an error and renames the later def. It was read from
  `Add` alone. The caller, `AddAllInMods`, removes the earlier def silently when a later mod defines the same
  defName, and only a duplicate inside one mod is an error. The original comment was right, and a running game
  confirmed it (see `docs/runs/2026-09-25.md`).
- **Not run.** No game was launched and no ticket was taken. `done` asks for the suites to be written, not
  played. Playing them, and reading their captures, is `done -> tested`.

**Strict next transition, `done -> tested`:** the three passes of `TESTING.md` played and green, `@review`
captures opened and looked at, no `@wip`, the conditional `05` run in its own pass, and no manual test left to
validate. Fetch the original into the WSL Workshop cache first, through `Use-Wsl.ps1`.

## Audit against AUDIT.md — 2026-09-24

**Previous stage: `done`. Retained stage then: `preTest`, superseded by the section above.** The stage names are the chain's own, read
literally: `dansMonoRepo`, `horsMonoRepo`, `ModIcon générée`, `Preview générée`, `preOptions`,
`options`, `l10n`, `preTest`, `done`, `tested`, `prepublished`, `published`. The one gate that fails
is `preTest -> done`, and it fails on a criterion not established, not on a defect.

### Revision and preservation

- Audited revision: `0fe6c02`, equal to `origin/main` (fetched) and to the local `main` head.
- Working tree at the start: clean except for the untracked `Mod/About/PublishedFileId.txt`, written by
  the 0.1.0 pre-publication of 2026-09-23, and 43 untracked `.dds` copies of the textures, written
  the same day at 14:13. Nothing tracked was modified.
- Changes of this session, all documentation or repository hygiene, and the only file added under `Mod/` is the Workshop ID: `04756dd` commits
  the Workshop file ID; the CHANGELOG opens on `## [0.1.0]`; `.gitignore` ignores `*.dds` and the
  evidence folders (no `.dds` was ever tracked, so nothing had to be removed from the index);
  `TESTING.md` and `docs/runs/README.md` are new; this file is updated.
- No game was launched, nothing was published, no image was generated. The commits were pushed afterwards, on the owner's request, once the four findings of the review were fixed.

### Ordered transition decisions

| Gate | Result | Evidence and limits |
| --- | --- | --- |
| 1: dansMonoRepo -> horsMonoRepo | **Validated** | Own `.git`, top level is this folder, `origin` set. GitHub API reports the repository public; `git ls-remote` returns `0fe6c02` on `main`, equal to the local head. The parent repository tracks no file here and ignores the folder. Documentation is English (README, ATTRIBUTION, CHANGELOG, TESTING, MANUAL, PREVIEW); the only accented text in scripts is the French translation data of `_tools/Build-French.ps1`. No LICENSE, justified: nothing here is licensed to grant. Root and distributed `ATTRIBUTION.md` are identical. |
| 2: -> ModIcon générée | **Validated** | 128 x 128, 14,482 bytes, byte-identical to the 2026-09-13 manifest. No assembly or project, so no build. Not generated or modified. |
| 3: -> Preview générée | **Validated** | 896 x 504, 540,016 bytes, under 1 MB. Opened and inspected: title, reduced "Renew", "(unofficial)", rule, summary and 1.6 badge are readable, nothing clipped, no camera concern. |
| 4: -> preOptions | **Validated** | Copper-orange rule and badge against the lighter ochre secondary ink, distinct at full size. The measured contrast values of 2026-09-13 are retained, not remeasured. English description ending on the Steam-formatted GitHub link. `About.xml` changed after that manifest (description corrections, then the credit wording of 2026-09-19) and was re-read in full. Naming follows the convention: `Renew` plus `(unofficial)`. |
| 5: -> options | **Not applicable, justified** | `Mod/` holds nine XML files, 45 PNG, one attribution, the ID file and the ignored `.dds`. No assembly, settings class, `MainButtonDef` or custom UI, so no options page and no shortcut exist. |
| 6: -> l10n | **Validated** | `Validate-Translations.ps1`: 104 English texts and French entries. `Check-DefInjected.ps1`: 104 keys, zero errors, 11,600 definitions, 29 patch operations. Of the 71 files fingerprinted on 2026-09-13, only `About.xml`, `Tests/MANUAL.md` and `Art/PREVIEW.md` differ, all three edited after it; Defs, languages, textures, icon and Preview are unchanged. Display in the game is unverified. |
| 7: -> preTest | **Validated, one point unverified** | No dependency is needed or declared. `loadAfter` names Core and the five official expansions, which is order, not a requirement. `Validate-Mod.ps1` checks the local references; the 554 parent, definition, stat and biome references resolved against local and Core names in the 2026-09-13 inspection, which was not rerun. The `Coolie.Ebbbs` packageId in `incompatibleWith` cannot be checked here because the source is not installed: not verified, not a defect. |
| 8: -> done | **Criterion not established** | Written scenarios with preconditions, actions and expected results (M1 to M9): met. Automated tests written, run and green (three checkers): met. XML tests: met. C# unit tests: not applicable, no assembly. **Pickle (Gherkin) tests written, with their scope justified: none exist.** `Tests/` holds no Pickle suite and no file records why one is not needed, whereas M1, M2, M5, M6 and M9 need a running game. The `done` of 2026-09-13 records no Pickle criterion. No in-game run is required for `done`, only the written suite and its scope. |
| 9: done -> tested | **Unverified** | Nothing has run in the game. The criteria are in `TESTING.md`. |
| 10 to 11 | **Not reached** | The 0.1.0 pre-publication is an act, not a state: it crossed no gate. Item 3806760667 exists, private, and its ID is committed. |

### Checks run

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File Tests/Validate-Mod.ps1
powershell -NoProfile -ExecutionPolicy Bypass -File Tests/Validate-Translations.ps1
powershell -NoProfile -ExecutionPolicy Bypass -File ../scripts/Check-DefInjected.ps1 -TransMod Mod
gh api repos/vbardales/Rimworld-Ebbbs-Renew --jq '{full_name,private,visibility,default_branch}'
git ls-remote origin refs/heads/main
```

All three checkers exited zero: **204 checks**, **104 texts**, **104 keys and zero errors**. The
SHA256 of the 71 inputs of `Tests/Audit-2026-09-13.json` were recomputed and compared. The historical
manifest is preserved, not overwritten.

### Defects observed

None.

### Strict next transition, `preTest -> done`

Write the Pickle suite for what only a running game can show, or record a justified non-applicability.
The scope proposed in `TESTING.md` is M1, M2, M5, M6 and M9 plus the incompatibility symptom of pass P3,
with M3 partly and M4 and M7 set aside for stated reasons. It waits for the owner's confirmation before
any Gherkin is committed. No run is needed for this transition.

### After that, `done -> tested`

The exit criteria are in `TESTING.md`. Three are new: no scenario left in `@wip`, every conditional
scenario has run (here the set that mounts `Coolie.Ebbbs`), and no manual test is left to validate,
each of M1 to M9 being green as an automated scenario or listed as not applicable with its reason.
Which proofs to keep and how to cut them down is in `docs/runs/README.md`.

### Optional recommendations, not blockers

- `_tools/preview.html` and `_tools/preview-raw.png`, tracked leftovers of an earlier composition
  superseded by `Art/render-preview.cjs`, were removed on 2026-09-24. `Tests/Audit-2026-09-13.json`
  still lists them, as the historical manifest it is.
- The 43 `.dds` were uploaded with 0.1.0 but are not versioned, so an upload made from a checkout would
  not carry them. The game loads the PNG when no `.dds` exists, so this changes nothing visible.
- Check the `Coolie.Ebbbs` packageId when the source mod is at hand.

## Description correction follow-up — 2026-09-13

**Cumulative stage then: `done` (previously `Preview générée`), superseded by the audit of 2026-09-24 above.** The user
requested continuation after the documentation translation. Corrected About.xml
and README.md to state the actual body-size range 0.2-4 and market-value range
10-2000. Removed the incorrect assertion that the species list was sorted by size.
About.xml now ends with the required Steam-formatted Source code on GitHub link.
Removed the redundant raw source-link paragraph and clarified the existing Goliebbb
label fix. CHANGELOG.md records the corrections and no longer lists existing images
as missing release work. No balance values or gameplay definitions were changed.

Gate 4 now passes. Gates 5-8 retain their independently established passes from
the audit, so the cumulative stage advances through preOptions, options, l10n and
preTest to done. This means ready for final functional validation, not tested in game.
The earlier stage statements below are historical results before these corrections.

Verification on base revision `f8ade1e2288fa862a0d404131bbcd17186b03313` plus the
documented local translations, audit records and these description changes:

- Reran Tests/Validate-Mod.ps1: **PASS, 204 checks, nine XML files, nine races**.
- Parsed About.xml and checked the exact final Steam link; checked the two ranges
  directly against all nine ThingDefs: **body 0.2-4; market 10-2000**.
- Compared the other **54 delivered files** against the SHA256 fingerprints in
  Tests/Audit-2026-09-13.json: all unchanged. Thus the earlier translation, settings,
  dependency and image checks remain applicable; About metadata is outside the
  in-game localization scope. The historical manifest is preserved, not overwritten.
- Reviewed the description/documentation diff; git diff --check passed.

Only final in-game checks remain for `done -> tested`: M1-M9, Player.log, FR/EN UI,
new-game and existing-save behavior. No game run, publication or commit was made.

## Documentation translation follow-up — 2026-09-13

**Cumulative stage then: `Preview générée` (previously `dansMonoRepo`), historical, superseded by the audit of 2026-09-24 above.**
Translated Tests/MANUAL.md and Art/PREVIEW.md into English at the user's request.
Reviewed the translations against the preceding text: all nine scenarios, dates,
expected values, commands, paths and unexecuted test statuses are preserved.
Gate 1's documentation language defect is resolved. The independent validations
of gates 2 and 3 from the audit below remain applicable, so the cumulative stage
advances to `Preview générée`. Gate 4 remains blocked by the recorded description
defects; no description or balance change was part of this translation request.

Only these two documents and STATUS.md changed in this follow-up. The existing
Tests/Audit-2026-09-13.json is preserved as the historical audit snapshot; its
hashes for the two translated documents now describe their pre-translation versions.
The delivered Mod files and executable validators are unchanged. Documentation
review and git diff --check apply to this change; gameplay tests remain unexecuted.

## Workflow audit before documentation translation — 2026-09-13

**Then: previous stage `done`, retained cumulative stage `dansMonoRepo`, historical, superseded by the audit of 2026-09-24 above.** The first
transition is blocked by the English documentation requirement. This is the initial
workflow checkpoint, not a claim that the repository is physically in the monorepo:
`detached: yes` remains correct. Do not move the repository or restore a parent remote.
The later historical entries below remain evidence of earlier work, not overrides
of this audit. The user-provided workflow takes precedence over the parent protocols,
in particular for settings and the cumulative interpretation of stage.

The stage names used here map literally to the requested chain:
`dansMonoRepo -> horsMonoRepo -> ModIcon générée -> Preview générée -> preOptions -> options -> l10n -> preTest -> done -> tested`.
Independent passes below are retained even though gate 1 prevents their cumulative award.

### Revision, scope and preservation

- Actual autonomous repository: `C:\Users\nelim\Documents\rimworld\EbbbsRenew`;
  actual distributable: its `Mod/` directory (55 files: 45 PNG, nine XML, attribution).
- Initial HEAD: `c21b5729212598689f0ed150964ceb3d98f6e60d`.
  Initial modifications: CHANGELOG.md, README.md, STATUS.md, Tests/MANUAL.md,
  Tests/Validate-Mod.ps1. Initial untracked content: Mod/Languages/,
  Tests/Translation-inventory.json, Tests/Validate-Translations.ps1,
  _tools/Build-French.ps1. These were included in the audit, not discarded.
- During the audit another operation committed that translation work as
  `f8ade1e2288fa862a0d404131bbcd17186b03313`; the worktree was then clean.
  This audit did not commit, push, regenerate art, or change mod implementation.
  Final checks were rerun against that revision; see the file fingerprints in
  `Tests/Audit-2026-09-13.json`. Audit changes are this status and that evidence file.
- Read the parent AGENTS.md, PUBLISHING.md, STYLE_RIMWORLD.md, MOD_SETTINGS.md and
  TRANSLATIONS.md. All findings below concern present artifacts, not only declarations.

### Ordered transition decisions

| Gate | Independent result | Evidence and limits |
| --- | --- | --- |
| 1: dansMonoRepo -> horsMonoRepo | **Defect observed** | Own .git and correct Git top level; parent tracks no files here and ignores EbbbsRenew. Live GitHub API reports public repository; ls-remote returned c21b572 on main, proving a pushed commit. Identity conventions, English root README/attribution/changelog and matching distributed attribution pass. However Tests/MANUAL.md (M1-M8) and Art/PREVIEW.md are French repository documentation, contrary to PUBLISHING.md and gate 1. |
| 2: horsMonoRepo -> ModIcon générée | **Validated independently** | Content implementation is present; 204 static checks pass. Build/compiled artifact freshness is not applicable: no source assembly, project or DLL, only native XML content and textures. Installed ModIcon is a valid 128 x 128 PNG, 14,482 bytes, visually inspected. |
| 3: ModIcon générée -> Preview générée | **Validated independently** | Installed PNG inspected directly: 896 x 504, 540,016 bytes, below 1 MB and the recommended 900 KB. No camera defect observed; no historical generation report or recorded game-screenshot comparison required. |
| 4: Preview générée -> preOptions | **Visual/naming criteria validated; description defect observed** | Copper-orange rule/badge visibly distinct from lighter ochre secondary ink at full size and 268 px. English description; Renew reduced to 65% and secondary ink; unofficial tag on its own line. No linking words or additional prefix apply. Required final Steam-formatted GitHub source link is absent. Advertised numeric ranges also disagree with delivered Defs. |
| 5: preOptions -> options | **Not applicable, justified** | Settings inventory and absence checks below pass. No in-game settings run required for this source-established absence under the user's clarification. |
| 6: options -> l10n | **Validated independently** | All 104 owned EN source texts and FR entries pass; reflected injection checker reports 104 keys, zero errors, no UNVERIFIED finding. Native English Def values are sufficient. Display in game is not certified. |
| 7: l10n -> preTest | **Validated independently, static scope** | Only local/Core content references found. 554 parent, definition, stat and biome references checked against local/Core XML names, none unresolved. No external framework class, patch, LoadFolders, version folder or conditional integration. About declares 1.6 and the upstream incompatibility; Core/DLC loadAfter entries impose order, not a DLC dependency. No third-party version constraint applies. This is not engine reference resolution. |
| 8: preTest -> done | **Test artifacts and automated/XML results validated independently** | M1-M9 provide shared preconditions, actions and expected results. Both local validators and the reflected path checker ran successfully on delivered files. C# unit/build tests are not applicable to this data-only mod. Gate 1's documentation language defect still blocks the cumulative stage. |
| 9: done -> tested | **Unverified** | No M1-M9 gameplay execution, FR/EN UI inspection or Player.log validation was performed. New-game and existing-save behavior remain unverified. No successful RIMMSQOL or other integration test is claimed. |

### Settings audit

Inventory: nine species with fixed balance/spawn/food/training/life-stage data,
five custom bodies, blood/effects, leather and horn. These are content definitions;
no configurable feature, documented XML-only user setting, optional settings
integration, or concrete player setting requirement was found. Exposing balance
constants solely to fill this gate would create new scope rather than complete this port.
All files under Mod were inventoried; there is no executable assembly or UI source,
MainButtonDef, settings class, custom UI or configuration patch. The only explicit
comp class is vanilla CompProperties_Styleable on the horn, not a settings interface.
Thus no empty mod-options page or settings shortcut is registered by this mod.
`settings_audit: not_applicable` is justified by content and access inventory, not
merely by the absence of C#. Defaults/input boundaries/application timing/persistence,
shortcut visibility and RIMMSQOL integration tests are not applicable to absent settings.
No integrations were executed in game; ordinary animal save persistence is still M6.

### Executed checks and artifact review

Commands run from the autonomous repository:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File Tests/Validate-Mod.ps1
powershell -NoProfile -ExecutionPolicy Bypass -File Tests/Validate-Translations.ps1
powershell -NoProfile -ExecutionPolicy Bypass -File ../scripts/Check-DefInjected.ps1 -TransMod Mod
gh api repos/vbardales/Rimworld-Ebbbs-Renew --jq '{full_name,private,visibility,default_branch}'
git ls-remote origin refs/heads/main
git rev-parse --show-toplevel
git -c safe.directory=C:/Users/nelim/Documents/rimworld -C .. ls-files EbbbsRenew
git -c safe.directory=C:/Users/nelim/Documents/rimworld -C .. check-ignore EbbbsRenew
```

Observed validator results: **204 checks / nine XML files / nine races**;
**104 English texts and French entries**; **104 injection keys / zero errors**
against installed assemblies and 11,600 indexed definitions (29 installed patch
operations applied by the checker). Exit codes were zero. The separate 554-reference
inspection checks name existence, not a complete typed engine/schema validation.
An initial shell invocation of that extra inspection failed without results;
the corrected invocation completed with zero unresolved names.

Reviewed French descriptions, labels, nested anatomy and tools against source and
inventory. No placeholders, missing owned text or custom formatting parameters found.
Core English Misc.xml and French archive Keyed/Misc.xml directly confirm MeatDesc,
CorpseLabel and CorpseDesc coverage; French CorpseDesc uses native 0_gender grammar.
The earlier documented engine injection-order review is retained as historical
evidence; it was not repeated by decompilation in this audit.

Direct visual inspection covered delivered Preview and ModIcon plus Art/preview-268.png.
Title, tag, accent, badge and subject are identifiable; no clipping, text overlap or
concrete camera concern was observed. Historical font/contrast measurements are
retained separately below and were not presented as newly measured values.
PNG format/dimensions/bytes were read directly with System.Drawing; hashes are in
the evidence manifest. Root and distributed ATTRIBUTION.md have identical SHA256
3348ABB809FFCF2E75758EF96B2B132A38509FF2509BDB0C18B94943F7C4EA23.

The live GitHub checks initially hit sandbox network/config restrictions, then
succeeded through authorized read-only execution. No GitHub access blocker remains.
The recorded five-source upstream rights review is retained for `silent`; no new
upstream licence/permission is asserted and that historical review was not refreshed.
The missing LICENSE is justified by the absence of a granted upstream licence;
inventing a licence for Coolie's content would not satisfy this workflow.

### Defects, next transition and remaining verification

**Strict next transition (gate 1):** translate the French repository documentation
in Tests/MANUAL.md and Art/PREVIEW.md to English, preserving scenarios and historical
results, then recheck documentation. The repository is already autonomous/public
with a pushed commit; no relocation, remote restoration or image generation is needed.

**Other observed description defects:** About.xml does not end with
`[url=https://github.com/vbardales/Rimworld-Ebbbs-Renew]Source code on GitHub[/url]`.
README.md and About.xml claim body sizes 0.2-2 and market values 10-360, whereas
Thrumebbb explicitly has baseBodySize 4 and MarketValue 2000. Correct the claims,
not the balance. These were recorded, not silently fixed during an audit-only request.

**Unverified mandatory final checks:** execute M1-M9 in RimWorld 1.6, check logs
and both languages, and record exact version/configuration and outcomes. M6 covers
reloading a save containing mod content; explicitly include adding the mod to a
pre-existing save when checking that supported use. No interactive game surface was
used; installed assemblies suffice for static tests, not for claiming gameplay success.

**Optional documentation cleanup:** CHANGELOG.md still tells a future release to add
both images even though they exist. This stale checklist is not evidence of missing
artifacts and does not invalidate their direct inspection. No optional visual reservation.

## Historical records (superseded stage statements)

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

Result on 2026-09-13: **PASS — 204 checks, nine XML files, nine races**.
Checks cover XML parsing, metadata, duplicate typed defNames, nine PawnKind/race
pairs, expected Wildness values under statBases, absence of obsolete wildness
fields, local body/leather/meat/flesh/blood/effect/product references, local texture
paths and live directional sprites, plus presence of the icon and Preview.

This is static validation, not a RimWorld schema validator or engine execution.
Core inheritance, Core assets/references, DLC compatibility, graphics and actual
behaviour still require the nine documented manual scenarios. `tested_on` stays
empty until an actual run is recorded with game version and evidence.
There is no C# assembly in this mod; C# unit tests are not applicable.

## Translation audit — 2026-09-13

Applied the new translation gate from the parent workspace's `PUBLISHING.md` and
`TRANSLATIONS.md`. Audited all five files under `Mod/Defs`, including the abstract
race base and nested fields. There are no assemblies, source UI, patches, optional
integrations, version folders or LoadFolders in this mod. About metadata and
repository documentation are outside the in-game translation scope.

[Tests/Translation-inventory.json](Tests/Translation-inventory.json) records all
104 owned texts with their typed injection paths, source files and reviewed EN/FR
values: nine race descriptions and labels, pawn kinds and the named juvenile stage,
five body definitions and their custom anatomy labels, attack tools, leather, horn,
blood and the meat label. Species names intentionally retain their original spelling.
English uses native Def values; French resources are in
`Mod/Languages/French/DefInjected/{BodyDef,PawnKindDef,ThingDef}/Ebbbs.xml`.
No duplicate English injection files or custom Keyed keys are needed.

Validation performed:

- `powershell -NoProfile -ExecutionPolicy Bypass -File Tests/Validate-Mod.ps1`:
  **PASS, 204 checks, nine XML files**.
- `powershell -NoProfile -ExecutionPolicy Bypass -File Tests/Validate-Translations.ps1`:
  **PASS, 104 English texts and French entries**, no duplicate, empty or unexpected keys.
- `powershell -NoProfile -ExecutionPolicy Bypass -File ../scripts/Check-DefInjected.ps1 -TransMod Mod`:
  **104 keys checked, zero errors, no UNVERIFIED findings**, against installed 1.6
  assemblies and Core/DLC definitions (11,600 indexed definitions).
- Inspected installed `Assembly-CSharp.dll` with ilspycmd: `PlayDataLoader` and
  `LoadedLanguage.InjectIntoData_BeforeImpliedDefs` inject translations before
  `ThingDefGenerator_Meat` reads `Ebbb.race.meatLabel`. The other eight races reuse
  Ebbb meat. `ThingDefGenerator_Corpses` uses Core `CorpseLabel` and `CorpseDesc`;
  meat descriptions use Core `MeatDesc`. All three keys were verified in Core's
  English XML and French language archive, including their formatting tokens.
  Inherited vanilla anatomy and unnamed bite attacks remain Core-owned.

Rebuild resources with `pwsh -NoProfile -File _tools/Build-French.ps1`, review the
inventory and translations, then rerun both local validators and the parent path
checker whenever Defs or language resources change. Reset affected status fields to
`unchecked` until that review passes. The generator rejects unreviewed text.

The three `complete` fields certify static readiness for `preTest` only. Historical
`stage: done` is preserved. English/French runtime checks remain **unverified** in M9;
no game session or Workshop publication was performed for this audit.

## Assets and corrected issue

`Mod/About/ModIcon.png` and `Mod/About/Preview.png` both exist. The old claim that
Preview was missing has been removed. `Art/ModIcon-source.png` is also present.
Presence alone does not prove their appearance in the game UI.

Goliebbb label corrected on 2026-09-13: ThingDef now displays `goliebbb`, matching PawnKindDef. Identifiers and balance remain unchanged; in-game confirmation is pending.

As of 2026-09-13 the stage was **done** (historical, since set back to `preTest`, see the audit at the top): the port, metadata, showcase and static validation work are
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
