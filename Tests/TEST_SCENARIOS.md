# Functional scenarios — RimWorld 1.6

Status as of 2026-09-12: **not executed**. Use a new test save with
Core + this mod only, without the original. Enable development mode.
Record the exact version, active mods/DLCs, each scenario's result and Player.log.

Since 2026-09-24 most of these are played by Pickle instead of by a person: [`../TESTING.md`](../TESTING.md)
says, for each of M1 to M9, which Pickle scenario replaces it or why it is not applicable. This table
stays as the written description of what each one is for.

| ID | Actions | Expected result |
|---|---|---|
| M1 | Enable the mod, restart, and create a colony without DLC. Open its description. | No mod XML/reference errors in the log; unofficial title, GitHub link, icon and Preview visible. |
| M2 | Spawn Ebbb, Beee, Crebbb, Drebbbd, Ebbberration, Ebbbomination, Goliebbb, Thrumebbb and Bebbbholder. Move them in all four directions; test their available ages. | Nine usable species, no pink/missing textures; Ebbb variants visible across several individuals. Goliebbb displays as goliebbb, and Ebbb remains named ebbb. |
| M3 | Inspect all nine species' wildness; attempt normal taming with suitable food and skill, without debug taming actions. | Values: Ebbb 70%, Beee 80%, Crebbb 20%, Drebbbd 100%, Ebbberration 40%, Ebbbomination 100%, Goliebbb 100%, Thrumebbb 100%, Bebbbholder 70%. No value of -1; untamable species must be treated as such. A single success does not establish a correct success rate. |
| M4 | Give the animals compatible food; observe hunger, predator hunting and available training. | Diet and training match their definitions, with no exceptions. |
| M5 | Injure and then treat an animal of each body plan; kill and butcher one specimen of each species, including Thrumebbb. Allow a corpse to desiccate. | Functional anatomy, black blood, meat/leather and horn as defined; corpses visible without errors. |
| M6 | Save with animals and resources, quit, then reload. | Animals, ages, training and resources preserved; no lost references. |
| M7 | In a disposable configuration, also select Coolie.Ebbbs without loading a save. | Incompatibility reported in the mod list. Disable the original afterward. |
| M8 | Repeat loading and spawning with available DLCs; observe natural spawns in a biome with a positive spawn weight. | No DLC conflicts or spawning errors. Record the DLCs actually tested. |

Automated tests: `powershell -NoProfile -ExecutionPolicy Bypass -File Tests/Validate-Mod.ps1`.
They check XML and local resources; they do not replace loading,
Core reference resolution or behavior checks in the game engine.

## M9 — English and French translation display

Not executed. Run once in English and once in French, restarting after changing
language. With Core and this mod, spawn all nine races and their available ages.
Inspect species descriptions, juvenile Thrumebbb labels, health tabs for all five
custom body plans, and melee tool labels. Inspect blood, leather and the horn,
then butcher animals and inspect generated meat and corpses. Check leather item
names when used as a material and battle log text containing body parts.

Expected: readable localized text, preserved species names and attribution, no raw
keys, unintended English fallback in French, broken accents, formatting or clipping.
Record exact game version, language, screenshots and translation-related Player.log
messages. Static checks do not establish success for this scenario.

Resource coverage check:
`powershell -NoProfile -ExecutionPolicy Bypass -File Tests/Validate-Translations.ps1`.
