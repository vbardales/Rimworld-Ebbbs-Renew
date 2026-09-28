# Ebbbs (Continued)

Original mod by coolziecat. Continued with their explicit permission, given in a Steam comment on the original mod's page (see [ATTRIBUTION.md](ATTRIBUTION.md)). If they contact me to request its removal, I undertake to take it down promptly.

Nine forms of goo, brought forward to RimWorld 1.6.

**I am not the author of this mod.** All nine creatures are Coolie's; all I did was the work needed to
make them run on 1.6. Credit goes to them, mistakes in the update are mine.

Original mod: https://steamcommunity.com/sharedfiles/filedetails/?id=2817264755 — last supporting 1.5,
last updated in July 2024. Abandoned, not withdrawn.

## What the mod does

Nine creatures: **ebbb**, **beee**, **crebbb**, **drebbbd**, **ebbberration**,
**ebbbomination**, **goliebbb**, **thrumebbb**, **bebbbholder**. Body sizes from 0.2 to 4, market
values from 10 to 2000, trainability from Intermediate to Advanced.

They bring a **flesh type of their own**, their own body plan, their own blood, **ebbb leather**, and a
**horn** off the thrumebbb.

Nobody knows what an ebbb is. The mod's own description says scientists have been at it for decades.
The one certainty is that they really, really like cheese.

No DLC required. No Harmony, no framework, no dependency of any kind.

Content mod: removing it mid-save will lose any ebbb already in play, of any size.

## Compatibility

**A Dog Said... Animal Prosthetics 2** is supported natively, with nothing to install or configure. That mod
sorts animals into three cumulative categories, and this one places the nine species in them the way its
own lists place vanilla animals:

| Category | Species | Surgeries offered |
|---|---|---|
| 1 | ebbb, bebbbholder, the two smallest | basic replacements |
| 2 | crebbb, ebbberration, drebbbd, goliebbb, trainable to Intermediate | plus simple prosthetics |
| 3 | beee, ebbbomination, thrumebbb, trainable to Advanced | plus bionics |

The assignment is a decision and easy to change: it is one file, `Patches/AnimalProsthetics2.xml`. Without
that mod the patch does nothing. It only works because `About.xml` declares `loadBefore` for it: that mod
copies its category lists into its real recipes in its own last patch, so a name added after that is never
read. It is an order, not a dependency.

**[XND] Nocturnal Animals (Continued)** is supported natively too. Each species gets a body clock through that mod's
own extension, the default the player can change per species in its options: the ebbb, beee, ebbbomination and
thrumebbb are nocturnal, the crebbb is crepuscular, the ebbberration is diurnal, and the bebbbholder, drebbbd and
goliebbb are cathemeral. The choices follow that mod's own for vanilla animals and each species' description. It is
one file, `Patches/NocturnalAnimals.xml`, guarded by the mod's name, which the game compares exactly.

**Better Crossbreeding** is supported natively. Four pairs among the nine can breed, each way: ebbb with crebbb,
ebbb with bebbbholder and crebbb with ebbberration (a coin flip for the kind of each child), and ebbb with drebbbd
(three ebbbs for one drebbbd). No animal of the base game is involved, and the beee, the ebbbomination, the thrumebbb
and the goliebbb are paired with nothing. It is one file, `Patches/BetterCrossbreeding.xml`, guarded by the mod's
name.

Neither is a dependency, and without them their patches do nothing.

## What changed in the 1.6 update

One line, nine times.

- **`wildness` moved to `<Wildness>` under `statBases`, on all nine.** It stopped being a field of
  `RaceProperties` in 1.6 and became a StatDef. The old form is not an error, it is simply never read,
  and the stat's default is `-1` — outside the range the game uses, so every one of them tamed for
  almost nothing, whether written at 0.4 or at 1.

Coolie had already moved the ebbb's colour variants to vanilla
`alternateGraphics` in their own 1.5 update, so only the leftover SkinSet file of the old system had to
go, which nothing referenced any more.

No balance value was changed.

**Inherited naming inconsistency fixed (2026-09-13):** Goliebbb now displays as *goliebbb* instead of *ebbb*. Its identifiers and balance are unchanged. See [ATTRIBUTION.md](ATTRIBUTION.md).

## Terms

The original states no licence anywhere — no file in the mod, nothing in its `About.xml`, nothing in
the `README.md` it ships, no linked repository, and nothing about reuse in its Workshop page
description. But its author gave **explicit permission** in a Steam comment on the mod's own page,
still visible there: "I do give people permission to do whatever with this mod... If you want em in
your game, you're 100% free to update it for 1.5!" See [ATTRIBUTION.md](ATTRIBUTION.md) for the full
quote and where it was checked.

This port also rests on the Workshop's own custom for abandoned mods: named credit, and a takedown on
request. If Coolie comes back to the ebbbs, or asks for this to be taken down, it comes down.

What I add is mine, and it is under the MIT licence (see [LICENSE](LICENSE)): the 1.6 fix, the three compatibility patches, the French translation, the tests, the images and the documentation. The licence says in its own text that it does not cover Coolie's creatures and textures, for which none is granted.

If I do not answer within a reasonable time after being contacted, anyone may freely update this or
any other of my mods, including publishing a continuation of it. All credit must be preserved.

## Credits

- **Coolie** — the mod, all nine creatures, and their textures.
- 1.6 update by Nelim. Written with the help of Claude (Anthropic).

See [ATTRIBUTION.md](ATTRIBUTION.md) for the licence check and the port in detail.

## Validation

English source text and French translations are included. Translation coverage and
injection paths pass static checks; display in both languages still needs in-game
validation. The translation audit is recorded in [STATUS.md](STATUS.md).

See [Tests/MANUAL.md](Tests/MANUAL.md) for the manual scenarios and the command to run XML checks. Current results and remaining validation are tracked in [STATUS.md](STATUS.md).
