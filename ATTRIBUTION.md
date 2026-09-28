# Ebbbs — where the content comes from, and what had to be changed

Everything in this mod is **Coolie's** work: the nine creatures, their flesh type, their body plan,
their textures. This repository holds the port to RimWorld 1.6 and nothing else.

## The source

| | |
|---|---|
| Mod | Ebbbs |
| Author | Coolie (own collection title "Coolie's Rimworld Mods"; the Steam account itself now displays as `coolziecat`, checked 2026-09-27) |
| Workshop | [2817264755](https://steamcommunity.com/sharedfiles/filedetails/?id=2817264755) |
| Last version supported | 1.5 |
| Last updated | 7 July 2024 |
| Licence | no file, but explicit authorization found in a Steam comment (below) |

**Abandoned, not withdrawn.** The item is still on the Workshop and still downloadable; it reached
1.5 and stopped there, missing 1.6. Nobody else has picked it up: Mlie has no continuation of it, a
Workshop search filtered on the 1.6 tag returns nothing related, and no installed mod declares `Ebbb`
or `Goliebbb`.

The mod ships `1.3`, `1.4` and `1.5` folders. **The 1.5 one is taken**, which is identical to 1.4 bar
a single file.

## The licence, looked for in four places, and found in a fifth

No `LICENSE` or `COPYING` file, nothing about reuse in `About.xml`'s `<description>`, no linked
repository, nothing about reuse in the Workshop page description, nothing in the `README.md` it
ships. But the author gave **explicit permission** in a Steam comment on the mod's own page, still
visible there, replying to a request to update the mod for a newer version:

> I do give people permission to do whatever with this mod though, that's why the github link is
> in the description. If you want em in your game, you're 100% free to update it for 1.5! As for
> me, I'm definitely just, not gonna touch this mod until I know for certain I have the motivation
> to make the sprites...
>
> — coolziecat, 6 Jul 2024, on
> [the mod's Workshop page](https://steamcommunity.com/sharedfiles/filedetails/?id=2817264755),
> checked still visible 2026-09-28

The GitHub link the comment mentions is no longer in the description, and none was found on the
author's profile or in a 2025-06-23 `web.archive.org` snapshot of the page (checked 2026-09-28); the
authorization itself does not depend on that link existing. It is broad ("do whatever"), names
updating the mod specifically, and is unconditional: it covers this 1.6 port and its redistribution.
This is not a silent, unauthorized continuation; the mod's own Workshop custom of named credit and
a takedown on request still applies as a courtesy on top of it.

**The licence of the port itself.** The row above is about Coolie's mod. What this port added is its own work and
is under the MIT licence, in `LICENSE`, which says in its own text that it does not cover Coolie's creatures and
textures.

## What the port changed

One line, nine times.

- **`wildness` moved to `<Wildness>` under `statBases`, on all nine creatures.** It stopped being a
  field of `RaceProperties` in 1.6 and became a StatDef. The old form does not error: nothing reads it,
  and the stat's own default is `-1`, which Core's comment describes as deliberately out of range "so
  we can catch missing wildness stats on animals". Every one of the nine was taming for almost nothing,
  whether written at 0.4 or at 1.

The definition changes are those nine Wildness lines and the Goliebbb label correction below.

**One file was dropped**: `Textures/Things/Pawn/Animal/Ebbb/Ebbb_SkinSet.xml`, a leftover of the
AnimalVariations system that nothing referenced any more. Coolie had already moved the ebbb's colour
variants to vanilla `alternateGraphics` in their own 1.5 update, which is why there was nothing to
convert here.

## Additional correction and preserved behaviour

- **`EbbbBase`, the mod's own abstract parent**, inherits cleanly from vanilla `AnimalThingBase` and
  shadows no vanilla name. Untouched.
- **Goliebbb label corrected on 2026-09-13:** its ThingDef now says `goliebbb`, matching its PawnKindDef, instead of the inherited `ebbb`. DefNames and balance values are unchanged.
- **No balance value was touched.**

## Added by this port, not by Coolie

**Support for A Dog Said... Animal Prosthetics 2**, in `Patches/AnimalProsthetics2.xml`. That mod is
SamBucher's ([Workshop 3238353862](https://steamcommunity.com/sharedfiles/filedetails/?id=3238353862)), a
continuation of A Dog Said... Animal Prosthetics. The patch is written from scratch. It uses the names of that
mod's three category recipes, `ADS_Cat1` to `ADS_Cat3`, and follows the convention its Workshop page asks other
mods to follow; nothing from its files is copied. Which species go in which category is this port's decision,
not Coolie's, and the three lists it adds to are the only thing it touches there.

**Support for [XND] Nocturnal Animals (Continued)**, in `Patches/NocturnalAnimals.xml`. That mod is Mlie's
continuation (`Mlie.XNDNocturnalAnimals`, [Workshop 2269731409](https://steamcommunity.com/sharedfiles/filedetails/?id=2269731409))
of XeoNovaDan's Nocturnal Animals. The patch is written from scratch and uses only the extension class that mod
publishes for other mods, `NocturnalAnimals.ExtendedRaceProperties`; nothing from its files is copied. Which clock
each species gets is this port's decision.

**Support for Better Crossbreeding**, in `Patches/BetterCrossbreeding.xml`. That mod is DizzyEevee's
(`DizzyEevee.BetterCrossbreeding`, [Workshop 3520675842](https://steamcommunity.com/sharedfiles/filedetails/?id=3520675842)).
The patch is written from scratch and follows the format of the example that mod ships for other mods; nothing is
copied. Which species cross, and what each pairing gives, is this port's decision, and it stays inside the family.

Neither is a dependency: each patch is guarded and does nothing without its mod.

## Where this came from

The port was done inside a private pack that had gathered two dozen abandoned animal mods, where these
nine were one source among them. They leave the pack to stand on their own, because the rule that pack
follows is that a mod which is dead **and** states nothing gets republished with credit rather than
kept back. The pack keeps only what cannot be published: sources that are alive in 1.6, and the one
whose author refuses redistribution.
