# Changelog

Format inspired by [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).
This file serves the repository and the writing of Steam patch notes; RimWorld does not display it
in game.

## [1.0.0] — unreleased

The icon and Preview are already installed. The Workshop item exists since 0.1.0, so 1.0.0 is an
update: after final in-game validation it goes out through the CI, which tags `v1.0.0` and creates
the GitHub release only once Steam has received the upload.

First release of the 1.6 update of **Ebbbs**, by Coolie.

### Changed

- Added French translations for all 104 owned text fields, including descriptions,
  anatomy, attacks and resources. English remains the native Def source. Added a
  translation inventory, static checks and an English/French in-game test scenario.

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

- Corrected the description's body-size and market-value ranges to include Thrumebbb, removed the incorrect size-order claim, and added the required GitHub source footer. Balance is unchanged.

- Goliebbb ThingDef label corrected from `ebbb` to `goliebbb` on 2026-09-13, matching its PawnKindDef. DefNames are unchanged.

## [0.1.0] — 2026-09-23

- Creation of a `publishIdFile` (`About/PublishedFileId.txt`). This first upload exists only to
  create the Workshop item, which Steam creates private, and to obtain that file. It does not make
  the mod public and does not say it is tested.

### Notes

As far as can be established, the upload contained `Mod/` as it was at commit `0fe6c02`, the head of
`main` when it was sent: the ID file was written on 2026-09-23 at 16:32, no commit was made after
`0fe6c02` of 2026-09-19, and the working tree held nothing tracked that differed from it. The upload itself
left no record of its contents.
Nothing in `Mod/` has changed since, apart from the ID file itself, added in the commit that goes
with this version. The folder also held 43 generated `.dds` copies of the textures, written on the
day of the upload; they were never versioned and are now ignored.
