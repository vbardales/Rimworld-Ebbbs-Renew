# Publication

What the Workshop page needs and the rest of the repository does not hold. It serves twice: for the
first real release, and for whoever takes the mod over.

**Status: drafted, 2026-09-27.** Workshop item `3806760667` was created private by the `0.1.0`
prepublication of 2026-09-23 and its `PublishedFileId.txt` is committed and pushed. No Git tag and no
GitHub release exist, and none is made by hand: the CI creates them after a successful upload. Nothing
below has been posted or pasted anywhere. The stage is `done`, not `prepublished` (see `STATUS.md`):
P1 to P6 are being replayed on the revision that carries the licence and the two new patches before that
move.

## What blocks the publication

Not restated from `AUDIT.md`; only what is specific to this mod.

- P1 to P4 have not yet been replayed on the revision that carries `LICENSE` and the Nocturnal Animals /
  Better Crossbreeding patches. P5 and P6 are green (`docs/runs/2026-09-25.md`); P1's replay is in flight.
- Long French text fit and Preview/icon appearance in the game UI: `TESTING.md` says these need a
  person, not automated.
- The gallery does not exist (see below).
- The rollback target is not chosen (see "Fail fast").
- No dry-run of the publish workflow has run.
- The page still carries the description `0.1.0` sent. `update_description=true` is what corrects it.

## Description

Written once, in Markdown, in the fenced block below (the single-source standard of 2026-09-25, see
`PUBLISHING.md` and `Rimworld-Release-Admin/docs/OPERATIONS.md`). The CI generates both the Steam BBCode
page and `About.xml`'s `<description>` from this block; no second copy to keep in step by hand.

## Steam description

```markdown
Original mod by coolziecat. Continued with their explicit permission, given in a Steam comment on the
original mod's page (see ATTRIBUTION.md). If they contact me to request its removal, I undertake to
take it down promptly.

Nine forms of goo, brought forward to RimWorld 1.6.

**I am not the author of this mod.** All nine creatures are Coolie's; all I did was the work needed to
make them run on 1.6. Credit goes to them, mistakes in the update are mine.

Original mod: [Ebbbs](https://steamcommunity.com/sharedfiles/filedetails/?id=2817264755) — last
supporting 1.5, last updated in July 2024. Abandoned, not withdrawn.

## What the mod does

Nine creatures: **ebbb**, **beee**, **crebbb**, **drebbbd**, **ebbberration**, **ebbbomination**,
**goliebbb**, **thrumebbb**, **bebbbholder**. Body sizes from 0.2 to 4, market values from 10 to 2000,
trainability from Intermediate to Advanced.

They bring a flesh type of their own, their own body plan, their own blood, ebbb leather, and a horn off
the thrumebbb.

Nobody knows what an ebbb is. The mod's own description says scientists have been at it for decades. The
one certainty is that they really, really like cheese.

No DLC required. No Harmony, no framework, no dependency of any kind.

Content mod: removing it mid-save will lose any ebbb already in play, of any size.

## Compatibility

**[A Dog Said... Animal Prosthetics 2](https://steamcommunity.com/sharedfiles/filedetails/?id=3238353862)**
is supported natively, with nothing to install or configure. The nine species are sorted into its three
cumulative categories the way its own lists sort vanilla animals: the ebbb and the bebbbholder get the
basic replacements, the crebbb, the ebbberration, the drebbbd and the goliebbb the simple prosthetics as
well, and the beee, the ebbbomination and the thrumebbb the bionics too.

**[[XND] Nocturnal Animals (Continued)](https://steamcommunity.com/sharedfiles/filedetails/?id=2269731409)**
is supported natively too. Each species gets a body clock through that mod's own extension, changeable per
species in its options: the ebbb, the beee, the ebbbomination and the thrumebbb are nocturnal, the crebbb
is crepuscular, the ebbberration is diurnal, and the bebbbholder, the drebbbd and the goliebbb are
cathemeral.

**[Better Crossbreeding](https://steamcommunity.com/sharedfiles/filedetails/?id=3520675842)** is supported
natively. Four pairs among the nine can breed, each way: ebbb with crebbb, ebbb with bebbbholder and crebbb
with ebbberration (a coin flip for the kind of each child), and ebbb with drebbbd (three ebbbs for one
drebbbd). No animal of the base game is involved, and the beee, the ebbbomination, the thrumebbb and the
goliebbb are paired with nothing.

None of the three is a dependency, and without them their patches do nothing.

## What changed in the 1.6 update

One line, nine times: `wildness` moved to `<Wildness>` under `statBases`. It stopped being a field of
`RaceProperties` in 1.6 and became a StatDef; the old form is not an error, it is simply never read, and
the stat's default sits outside the range the game uses, so every one of the nine tamed for almost
nothing. No balance value was changed.

## Terms

The original states no licence anywhere. This port rests on the Workshop's own custom for abandoned mods:
named credit, and a takedown on request. What I add is mine, under the MIT licence (see the repository's
`LICENSE`): the 1.6 fix, the three compatibility patches, the French translation, the tests, the images and
the documentation. It does not cover Coolie's creatures and textures, for which none is granted.

## If I go quiet

If I do not answer within a reasonable time after being contacted, anyone may freely update this or any
other of my mods, including publishing a continuation of it. All credit must be preserved.

## AI-generated

Written with the help of Claude (Anthropic).

## Thanks

- **Coolie**, for the original [Ebbbs](https://steamcommunity.com/sharedfiles/filedetails/?id=2817264755):
  all nine creatures and their textures are theirs.
- **SamBucher**, for [A Dog Said... Animal Prosthetics 2](https://steamcommunity.com/sharedfiles/filedetails/?id=3238353862).
- **Mlie**, for continuing **XeoNovaDan**'s
  [[XND] Nocturnal Animals](https://steamcommunity.com/sharedfiles/filedetails/?id=2269731409).
- **DizzyEevee**, for [Better Crossbreeding](https://steamcommunity.com/sharedfiles/filedetails/?id=3520675842).
- **Pickle** and **RimLogging**, the test tools this mod's suite runs on — development only, never a
  dependency of the mod you are downloading.

Full check and detail in `ATTRIBUTION.md`.

[Source code on GitHub](https://github.com/vbardales/Rimworld-Ebbbs-Renew)
```

## Images

- **Preview** (`Mod/About/Preview.png`) and **ModIcon** (`Mod/About/ModIcon.png`): already installed since
  0.1.0, checked in `STATUS.md`. This session generates and touches neither.

## Screenshots, in this order

**Not settled.** No Workshop screenshot has been chosen or produced. Steam shows the first one large
under the Preview, so it must be the most demonstrative, and every image is opened and looked at before it
is listed here.

| Order | What it should show | Why there |
|---|---|---|
| 1 | The nine species side by side on the studio colony | The mod's whole content in one frame. Scenario "the nine species together in the flower glade" of feature `11`, pass P7; the owner judges the composition |
| 2 | An ebbb's information card filtered to `Wildness` | The exact defect the port exists to fix, and the one thing the log cannot show. Scenario "the information card of an ebbb, with Wildness" of feature `11`, pass P7 |
| 3 | A species offered a prosthetic/bionic recipe with A Dog Said 2, its recipe in the surgery menu | The one optional integration this mod claims natively. Needs its own scenario and map, not written |
| 4 | Two species with a body-clock icon, with Nocturnal Animals | A second optional integration. Needs its own scenario, not written |

The gallery is uploaded by hand (`OPERATIONS.md`): a folder holding only the images to upload, numbered
`01-`, `02-`... in page order, no old version, no raw capture, no subfolder. It would be
`Art/Workshop/`, also the workflow's `--gallery-dir` once it exists.

## Dependencies and DLCs

**No DLC is required, and no mod.** `supportedVersions` declares 1.6 only.

| Declared | Identifier | Actually required |
|---|---|---|
| `incompatibleWith` | `Coolie.Ebbbs` | Same nine `defName`s as the original: run one or the other. Pass P3 plays them together and asserts that this mod's def is the one the game runs, and that the original still writes the `wildness` field 1.6 no longer reads. Nothing is logged about the shared names |
| `loadBefore` | `SamBucher.ADogSaidAnimalProsthetics2` | Order, not dependency. That mod copies its category lists into its own recipes in its last patch, so a name added after is never read. Pass P4 |
| Guarded patch | `Mlie.XNDNocturnalAnimals` | Optional. Guarded by an exact name match (`PatchOperationFindMod`, `ModLister.HasActiveModWithName`). Pass P5 |
| Guarded patch | `DizzyEevee.BetterCrossbreeding` | Optional. Same guard style. Pass P6 |
| `modDependencies` | none | The mod needs nothing to load |

## Manual validations of the owner

`AUDIT.md` asks for none at `tested` that a test could carry, and lists "the owner's manual validations"
among the things a `publish` does not skip without saying which. This is a proposal drawn from
`TESTING.md` and `PUBLISHING.md`; it is hers to change.

| # | What to look at | Why a test cannot |
|---|---|---|
| 1 | Long French descriptions read naturally and do not clip in a window | The suite proves the strings are loaded, not that they read well or fit |
| 2 | Subscribe to item `3806760667`, start a game with the installed copy, spawn the nine and taste-test the taming rate | The installed copy is what players get; the suite plays the working tree |
| 3 | The gallery: which captures, in which order | A composition is a choice |
| 4 | The description read once more, on the page after the publish | The dry-run cannot read a private page |
| 5 | Then, and only then, the visibility, the comments subscription and "Watch all activity" of the mod and of its parents | Steam, by hand, by the owner |

## Mature content checkboxes

**None of them.** The mod adds nine goo creatures; the images are a Preview and an icon of the creatures
themselves. The Workshop screenshots are not produced yet; each must be opened before this answer is
final.

## Steam change notes

Written at upload time, in the Change Notes tab, from the block below (BBCode), read at the pinned
commit. The version stands alone on the first line.

### 1.0.0

```
[b]1.0.0[/b]

First release. Port of Coolie's "Ebbbs" to RimWorld 1.6.

[list]
[*]Nine goo creatures, brought forward from the abandoned 1.5 version: ebbb, beee, crebbb, drebbbd, ebbberration, ebbbomination, goliebbb, thrumebbb, bebbbholder.
[*]The taming defect RimWorld 1.6 introduced (wildness moved to a StatDef and silently stopped being read) is fixed on all nine.
[*]Native support for A Dog Said... Animal Prosthetics 2: each species offered the surgeries of its category.
[*]Native support for [XND] Nocturnal Animals (Continued): each species carries its own body clock.
[*]Native support for Better Crossbreeding: four pairs can crossbreed within the family.
[*]English and French.
[/list]

None is a dependency; without them their patches do nothing. Cannot run beside the original mod.
```

## Fail fast: the rollback target

A rollback is a new publication, not an unpublication: the workflow is dispatched with `ref` = the full
SHA of the last good commit and the next patch number, and the change note reads "Rolls back to <what>,
because <what failed>". The version numbers only go up and a tag that exists is refused. The CI never
sends visibility: making the item private again is a manual act of the owner on Steam.

`AUDIT.md`, `prepublished -> published`: before the `publish`, every scenario that failed has a green
replay, the gallery is done and the owner's manual validations are made.

- Scenario that failed and was replayed green (2026-09-26): P6's "what each pairing gives, by mother",
  wrong extension-class name (`DZY.Crossbreeding.Extension` written, `DZY.CrossBreeding.Extension` real),
  fixed and rejoued green (ticket `cd68`).
- **The rollback target is not chosen.** The only earlier upload is the private `0.1.0` prepublication of
  2026-09-23, made from the folder as it stood then and not from a tagged commit, so it cannot be
  reproduced. The first real target is the SHA of the `1.0.0` that passes its dry-run, written here at
  that moment.

## Comments on other mods' pages

`WORKSHOP_COMMENTS.md` decides; it is keyed by Workshop id. Under 1,000 characters each, a bare URL on the
last line, to post **only after item 3806760667 is public**.

| Recipient | Id | State | Reason |
|---|---|---|---|
| Ebbbs (Coolie) | 2817264755 | drafted | The mod this one is a port of, declared incompatible and played by pass P3 |
| A Dog Said... Animal Prosthetics 2 (SamBucher) | 3238353862 | to check against registry | Optional integration, exercised by pass P4. Not yet in `WORKSHOP_COMMENTS.md` under this mod; add to its `Covers` if already `posted` for another mod when this one goes public |
| [XND] Nocturnal Animals (Continued) (Mlie, update of XeoNovaDan's mod) | 2269731409 | to add to registry | Optional integration, exercised by pass P5. Already `drafted` in `WORKSHOP_COMMENTS.md` for another mod's `Covers`; add this mod there instead of a new draft if it posts first |
| Better Crossbreeding (DizzyEevee) | 3520675842 | drafted | Optional integration, exercised by pass P6. Not yet in `WORKSHOP_COMMENTS.md` |
| Pickle | 3791648678 | already `posted` | Test tool really used; add Ebbbs Renew to its `Covers` |
| RimLogging | 3733484696 | already `posted` | Staged by every Pickle pass; add Ebbbs Renew to its `Covers` |
| PickleTools | 3806142401 | `not_applicable` | Same author, private page |
| Harmony | 2009463077 | already `posted` | Staged for the two optional passes only; add Ebbbs Renew to its `Covers` |

### Ebbbs (Coolie), 2817264755

```
Hello Coolie! 🧪

Thank you for the ebbbs — nine forms of goo that nobody can quite explain is exactly the kind of strange
I want wandering my colony, and I could not let them stay stuck on 1.5. I brought them forward as Ebbbs
Renew (unofficial): your nine creatures, their stats and their textures are unchanged, the taming defect
1.6 introduced is fixed, and I added native support for two crossbreeding/behaviour mods plus French.

It is credited to you everywhere, and if you would rather it did not exist, just say so and it comes down,
no argument, no delay. Thank you for the goo 💛

https://steamcommunity.com/sharedfiles/filedetails/?id=3806760667
```

### Better Crossbreeding (DizzyEevee), 3520675842

```
Hello DizzyEevee! 🥚

Thank you for Better Crossbreeding: it gave the nine ebbb-family creatures of Ebbbs (Continued), my
1.6 update of an old abandoned mod, a way to actually breed into each other instead of just standing next
to each other looking related. Four pairs, both ways, weighted the way their sizes and temperaments
suggested to me.

Optional, not a dependency: nothing happens without your mod, and your mechanics and arithmetic are
entirely your own.

https://steamcommunity.com/sharedfiles/filedetails/?id=3806760667
```
