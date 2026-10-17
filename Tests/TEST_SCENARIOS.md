# Functional scenarios: RimWorld 1.6

Status as of 2026-09-12: **not executed**. Use new test save with
Core + this mod only, no original. Enable development mode.
Record exact version, active mods/DLCs, each scenario result, Player.log.

Since 2026-09-24 most played by Pickle, not person: [`../TESTING.md`](../TESTING.md)
says, for each M1 to M9, which Pickle scenario replaces it or why not applicable. Table
stays as written description of what each is for.

| ID | Actions | Expected result |
|---|---|---|
| M1 | Enable mod, restart, create colony without DLC. Open description. | No mod XML/reference errors in log; unofficial title, GitHub link, icon, Preview visible. |
| M2 | Spawn Ebbb, Beee, Crebbb, Drebbbd, Ebbberration, Ebbbomination, Goliebbb, Thrumebbb, Bebbbholder. Move in all four directions; test available ages. | Nine usable species, no pink/missing textures; Ebbb variants visible across several individuals. Goliebbb displays as goliebbb, Ebbb remains named ebbb. |
| M3 | Inspect wildness of all nine species; attempt normal taming with suitable food and skill, no debug taming actions. | Values: Ebbb 70%, Beee 80%, Crebbb 20%, Drebbbd 100%, Ebbberration 40%, Ebbbomination 100%, Goliebbb 100%, Thrumebbb 100%, Bebbbholder 70%. No value -1; untamable species treated as such. Single success does not establish correct success rate. |
| M4 | Give animals compatible food; observe hunger, predator hunting, available training. | Diet and training match definitions, no exceptions. |
| M5 | Injure then treat animal of each body plan; kill and butcher one specimen of each species, including Thrumebbb. Let corpse desiccate. | Functional anatomy, black blood, meat/leather and horn as defined; corpses visible without errors. |
| M6 | Save with animals and resources, quit, reload. | Animals, ages, training, resources preserved; no lost references. |
| M7 | In disposable configuration, also select Coolie.Ebbbs without loading save. | Incompatibility reported in mod list. Disable original afterward. |
| M8 | Repeat loading and spawning with available DLCs; observe natural spawns in biome with positive spawn weight. | No DLC conflicts or spawning errors. Record DLCs actually tested. |

Automated tests: `powershell -NoProfile -ExecutionPolicy Bypass -File Tests/Validate-Mod.ps1`.
They check XML and local resources; do not replace loading,
Core reference resolution or behavior checks in game engine.

## M9: English and French translation display

Not executed. Run once in English, once in French, restart after changing
language. With Core and this mod, spawn all nine races and available ages.
Inspect species descriptions, juvenile Thrumebbb labels, health tabs for all five
custom body plans, melee tool labels. Inspect blood, leather, horn,
then butcher animals and inspect generated meat and corpses. Check leather item
names when used as material and battle log text containing body parts.

Expected: readable localized text, preserved species names and attribution, no raw
keys, unintended English fallback in French, broken accents, formatting or clipping.
Record exact game version, language, screenshots, translation-related Player.log
messages. Static checks do not establish success for this scenario.

Resource coverage check:
`powershell -NoProfile -ExecutionPolicy Bypass -File Tests/Validate-Translations.ps1`.