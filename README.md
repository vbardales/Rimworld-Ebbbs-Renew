# Ebbbs Renew (unofficial)

UNOFFICIAL. This mod is published without the original author's explicit consent. If the original author contacts me to request its removal, I undertake to take it down promptly.

Nine forms of goo, brought forward to RimWorld 1.6.

**I am not the author of this mod.** All nine creatures are Coolie's; all I did was the work needed to
make them run on 1.6. Credit goes to them, mistakes in the update are mine.

Original mod: https://steamcommunity.com/sharedfiles/filedetails/?id=2817264755 — last supporting 1.5,
last updated in July 2024. Abandoned, not withdrawn.

## What the mod does

Nine creatures, smallest to largest: **ebbb**, **beee**, **crebbb**, **drebbbd**, **ebbberration**,
**ebbbomination**, **goliebbb**, **thrumebbb**, **bebbbholder**. Body sizes from 0.2 to 2, market
values from 10 to 360, trainability from Intermediate to Advanced.

They bring a **flesh type of their own**, their own body plan, their own blood, **ebbb leather**, and a
**horn** off the thrumebbb.

Nobody knows what an ebbb is. The mod's own description says scientists have been at it for decades.
The one certainty is that they really, really like cheese.

No DLC required. No Harmony, no framework, no dependency of any kind.

Content mod: removing it mid-save will lose any ebbb already in play, of any size.

## What changed in the 1.6 update

One line, nine times.

- **`wildness` moved to `<Wildness>` under `statBases`, on all nine.** It stopped being a field of
  `RaceProperties` in 1.6 and became a StatDef. The old form is not an error, it is simply never read,
  and the stat's default is `-1` — outside the range the game uses, so every one of them tamed for
  almost nothing, whether written at 0.4 or at 1.

Nothing else needed touching. Coolie had already moved the ebbb's colour variants to vanilla
`alternateGraphics` in their own 1.5 update, so only the leftover SkinSet file of the old system had to
go, which nothing referenced any more.

No balance value was changed.

**Inherited naming inconsistency fixed (2026-09-13):** Goliebbb now displays as *goliebbb* instead of *ebbb*. Its identifiers and balance are unchanged. See [ATTRIBUTION.md](ATTRIBUTION.md).

## Terms

The original **states no licence anywhere** — no file in the mod, nothing in its `About.xml`, nothing in
the `README.md` it ships, no linked repository, and nothing on its Workshop page, which was read
looking for a refusal rather than for a permission. Silence grants nothing and forbids nothing.

This port rests on the Workshop's own custom for abandoned mods: named credit, and a takedown on
request. If Coolie comes back to the ebbbs, or asks for this to be taken down, it comes down.

If I do not answer within a reasonable time after being contacted, anyone may freely update this or
any other of my mods, including publishing a continuation of it. All credit must be preserved.

## Credits

- **Coolie** — the mod, all nine creatures, and their textures.
- 1.6 update by nelim. Written with the help of Claude (Anthropic).

See [ATTRIBUTION.md](ATTRIBUTION.md) for the licence check and the port in detail.

## Validation

English source text and French translations are included. Translation coverage and
injection paths pass static checks; display in both languages still needs in-game
validation. The translation audit is recorded in [STATUS.md](STATUS.md).

See [Tests/MANUAL.md](Tests/MANUAL.md) for the manual scenarios and the command to run XML checks. Current results and remaining validation are tracked in [STATUS.md](STATUS.md).
