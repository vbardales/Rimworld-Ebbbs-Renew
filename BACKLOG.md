# Backlog

Work that is possible and wanted but not started. `STATUS.md` holds what is open on the current version;
nothing here is promised for 0.1.0. Both items below were looked at on 2026-09-25 against the installed
copies of the mods, and neither needs C#: each is one guarded XML patch file, like
`Mod/Patches/AnimalProsthetics2.xml`.

## Nocturnal Animals (Continued)

- **Mod:** `[XND] Nocturnal Animals (Continued)`, packageId `Mlie.XNDNocturnalAnimals`, Workshop 2269731409, by
  XeoNovaDan, continued by Mlie. Declares 1.6.
- **What it reads:** a `DefModExtension` on the animal's **ThingDef**,
  `<li Class="NocturnalAnimals.ExtendedRaceProperties"><bodyClock>Nocturnal</bodyClock></li>`, with the values
  `Diurnal`, `Nocturnal`, `Crepuscular` and `Cathemeral`. Without the extension an animal is `Diurnal`. The value is
  only the default: the mod keeps a per-species setting keyed by defName, which the player can change in its options,
  and it shows the clock in the animal's info card.
- **Precedent:** its own `Patches/Core/Races_Animal_*.xml` and `LegacyArk.xml` add the extension the same way, which
  is the pattern other mods follow. Nothing needs to be copied from it.
- **The plan:** `Mod/Patches/NocturnalAnimals.xml`, one `PatchOperationAddModExtension` per species, nine in all.
  It has to be guarded: an extension of a class that does not exist logs an XML error when the mod is absent. There is no
  marker def to test here, unlike A Dog Said 2's `ADS_Cat1`, so the guard is a `PatchOperationFindMod` on the mod's name,
  and **how 1.6 matches that name has to be checked in the game's own assembly before the file is written**.
  No `loadBefore` or `loadAfter` is needed: the extension is read at runtime, not copied by a later patch.
- **To decide, by the owner:** the clock of each of the nine. It is a judgment about the creatures, as the
  A Dog Said 2 categories were, and it is one file to change afterwards.
- **Tests:** a pass with the mod staged (`wsl-deps.avec-na.map`), with a local step that reads the extension off
  the ThingDef, and the same "nothing logged names this mod" checks the other passes have. Without the mod, the
  existing passes already show that the patch does nothing.

## Better Crossbreeding

- **Mod:** `Better Crossbreeding`, packageId `DizzyEevee.BetterCrossbreeding`, Workshop 3520675842, by DizzyEevee.
  1.6 only. It is the only mod of that name installed; if another one is meant, say which.
- **What it reads, and where.** Two things, in two places:
  1. `canCrossBreedWith`, a list of defNames in the ThingDef's `race`, and `mateMtbHours`. **This one is vanilla 1.6**
     (Core uses it in `Races_Animal_MiscGroup.xml`), not the mod's.
  2. The mod's own `<li Class="DZY.Crossbreeding.Extension"><outcomes>` on the **mother's PawnKindDef**, which says
     what the offspring is: `Maternal`, `Paternal`, `Random` (a coin flip per child) or `Other` (a weighted list of
     kinds). Only the mother is checked, so a pairing has to be written for both sexes to work both ways.
     Without the mod, the game's own rule applies.
- **Precedent:** the mod ships `Example/Patches/Example.xml`, which is the pattern to follow: a
  `PatchOperationConditional` that adds the extension only when it is absent, then the outcomes.
- **The plan:** `Mod/Patches/BetterCrossbreeding.xml`. The extension part must be guarded like the one above (its
  class does not exist without the mod). The `canCrossBreedWith` part is vanilla: whether to put it in the mod's own
  defs, which would change what the species do **without** Better Crossbreeding, or in the guarded patch only, is the
  first decision. The guarded patch is the safer one, and it is the one this file assumes.
- **To decide, by the owner:** which species cross with which, and with vanilla animals or only among themselves,
  and what each pairing gives (`Maternal`, `Paternal`, `Random`, `Other`). The nine are a family, so pairings among
  them are the obvious start; anything with a vanilla animal is a design choice of its own and touches balance, which
  this port has so far refused to do.
- **Tests:** a pass with the mod staged, a local step reading `race.canCrossBreedWith` and the outcomes off the
  defs, and a scenario that breeds a pair and reads the kind of the child, if the game can be made to do it in a
  reasonable time (`mateMtbHours` is long). If it cannot, the def-level assertions are what the pass proves and the
  breeding itself stays a manual check, written down as such.

## For both

- **Both touch `Mod/`,** so the gates that read it (offline validators, translations if a text is added) and the
  passes are rerun, and the version becomes 0.2.0 or later with a `CHANGELOG` entry naming each mod. Nothing is
  started while the queued P1 and P3 have not been rendered.
- **Neither is a dependency:** `dependencies` stays `none`, no `modDependencies`, and each mod is thanked by name in
  the description and in `ATTRIBUTION.md`, as A Dog Said 2 and the original are.
- **Unofficial:** neither author is contacted or asked. The patches use only names those mods publish for other mods to
  use.
