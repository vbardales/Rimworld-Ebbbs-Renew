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

The defs come from the original mod's `1.5` folder. No balance value was changed.

### Fixed

- Goliebbb ThingDef label corrected from `ebbb` to `goliebbb` on 2026-09-13, matching its PawnKindDef. DefNames are unchanged.
