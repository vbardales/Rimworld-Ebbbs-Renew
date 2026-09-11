# Ebbbs — where the content comes from, and what had to be changed

Everything in this mod is **Coolie's** work: the nine creatures, their flesh type, their body plan,
their textures. This repository holds the port to RimWorld 1.6 and nothing else.

## The source

| | |
|---|---|
| Mod | Ebbbs |
| Author | Coolie |
| Workshop | [2817264755](https://steamcommunity.com/sharedfiles/filedetails/?id=2817264755) |
| Last version supported | 1.5 |
| Last updated | 7 July 2024 |
| Licence | none stated |

**Abandoned, not withdrawn.** The item is still on the Workshop and still downloadable; it reached
1.5 and stopped there, missing 1.6. Nobody else has picked it up: Mlie has no continuation of it, a
Workshop search filtered on the 1.6 tag returns nothing related, and no installed mod declares `Ebbb`
or `Goliebbb`.

The mod ships `1.3`, `1.4` and `1.5` folders. **The 1.5 one is taken**, which is identical to 1.4 bar
a single file.

## The licence, looked for in four places, and in a fifth

"None stated" is a verdict, not an absence of checking. A refusal never presents itself as a
licence, so each place was searched for the refusal rather than for the permission — `prohibit`,
`forbid`, `do not redistribute`, `no reupload`, `all rights reserved`, `without permission`, and
the Japanese and Chinese forms 禁止, 転載, 無断, 二次配布, 不得.

| Where | What it says |
|---|---|
| A `LICENSE` or `COPYING` file in the mod | there is none |
| The `<description>` of its `About.xml` | nothing about reuse |
| A linked repository | there is none |
| The Workshop page description | nothing about reuse |
| The `README.md` it ships, which most mods do not | nothing about reuse |

Silence grants nothing and forbids nothing. This port rests on the Workshop's own custom for
abandoned mods: named credit, and a takedown on request.

## What the port changed

One line, nine times.

- **`wildness` moved to `<Wildness>` under `statBases`, on all nine creatures.** It stopped being a
  field of `RaceProperties` in 1.6 and became a StatDef. The old form does not error: nothing reads it,
  and the stat's own default is `-1`, which Core's comment describes as deliberately out of range "so
  we can catch missing wildness stats on animals". Every one of the nine was taming for almost nothing,
  whether written at 0.4 or at 1.

A diff against the original files shows those nine lines and nothing else.

**One file was dropped**: `Textures/Things/Pawn/Animal/Ebbb/Ebbb_SkinSet.xml`, a leftover of the
AnimalVariations system that nothing referenced any more. Coolie had already moved the ebbb's colour
variants to vanilla `alternateGraphics` in their own 1.5 update, which is why there was nothing to
convert here.

## What was left alone, and why

- **`EbbbBase`, the mod's own abstract parent**, inherits cleanly from vanilla `AnimalThingBase` and
  shadows no vanilla name. Untouched.
- **The goliebbb is called "ebbb" in game.** Its `ThingDef` carries `<label>ebbb</label>` while its
  `PawnKindDef` says `goliebbb`; the `ThingDef` label is the one the game shows, so the largest of the
  nine is named after the smallest. That is upstream, in the 1.5 files as in the earlier ones, and it
  is a label rather than breakage — so it is recorded here rather than quietly rewritten. One word
  fixes it if its author, or you, would rather it were fixed.
- **No balance value was touched.**

## Where this came from

The port was done inside a private pack that had gathered two dozen abandoned animal mods, where these
nine were one source among them. They leave the pack to stand on their own, because the rule that pack
follows is that a mod which is dead **and** states nothing gets republished with credit rather than
kept back. The pack keeps only what cannot be published: sources that are alive in 1.6, and the one
whose author refuses redistribution.
