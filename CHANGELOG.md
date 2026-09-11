# Changelog

Format inspired by [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).
This file serves the repository and the writing of Steam patch notes; RimWorld does not display it
in game.

## [1.0.0] — unreleased

On release: add `Mod/About/ModIcon.png` and `Mod/About/Preview.png`, create the `v1.0.0` tag and
the matching GitHub release, then publish to the Workshop.

First release of the 1.6 update of **Ebbbs**, by Coolie.

### Changed

- **`wildness` moved to `<Wildness>` under `statBases`, on all nine creatures.** It stopped being a
  field of `RaceProperties` in 1.6 and became a StatDef. The old form is not an error, it is simply
  never read, and the stat's default is `-1` — outside the range the game uses, so every one of the
  nine tamed for almost nothing, whether written at 0.4 or at 1.

### Removed

- `Textures/Things/Pawn/Animal/Ebbb/Ebbb_SkinSet.xml`, a leftover of the AnimalVariations system that
  nothing referenced any more. Coolie had already moved the ebbb's colour variants to vanilla
  `alternateGraphics` in their own 1.5 update.

### Notes

Those nine lines are the entire difference from the original defs. The defs come from the mod's `1.5`
folder, identical to `1.4` bar one file. No balance value was changed.

**One inherited oddity is left in place and documented:** the goliebbb's `ThingDef` label reads `ebbb`
while its `PawnKindDef` reads `goliebbb`, so the largest of the nine shows in game under the name of the
smallest. Upstream, present in the 1.5 files as in the earlier ones, and a label rather than breakage.
