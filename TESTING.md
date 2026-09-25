# Testing — Ebbbs Renew

Nine species, five def files, no assembly, and one patch that only acts beside A Dog Said 2. Everything a file checker can settle is settled
offline; what remains needs a running game. [`Tests/MANUAL.md`](Tests/MANUAL.md) holds the scenarios
M1 to M9 as written, and [`Tests/Pickle/`](Tests/Pickle/README.md) holds the ones a running game plays for
itself. This file says how they get run, and when the mod counts as tested.

**An empty log is not a pass.** The original fault, a `wildness` field that 1.6 no longer reads, made
no error at all: every species loaded and looked normal, and tamed for almost nothing. Only the
information card of each species settles it.

## Settled without the game

From the repository root. All of them passed on 2026-09-24, revision `0fe6c02`, and are rerun after any
change to `Mod/Defs`, `Mod/Languages` or the inventory:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File Tests/Validate-Mod.ps1
powershell -NoProfile -ExecutionPolicy Bypass -File Tests/Validate-Translations.ps1
# Check-DefInjected.ps1 lives in the monorepo's scripts/ folder, not in this repository:
# run it from this folder while it sits inside the monorepo checkout, where ../scripts resolves.
powershell -NoProfile -ExecutionPolicy Bypass -File ../scripts/Check-DefInjected.ps1 -TransMod Mod
```

204 checks over nine XML files; 104 owned texts with their French entries; 104 injection keys, zero
errors. None of it loads a def through the engine: Core inheritance, texture loading and behaviour
still need the passes below.

For the Pickle suite, before a ticket is taken (details in [`Tests/Pickle/README.md`](Tests/Pickle/README.md)):

```powershell
dotnet build Tests/Pickle/Source/EbbbsRenew.PickleSteps.csproj -c Release
powershell -NoProfile -ExecutionPolicy Bypass -File Tests/Pickle/Check-Steps.ps1
```

The step checker passed on 2026-09-24: 377 step lines, each resolving to exactly one step. It proves that
the text of a step exists, not that the step does what the scenario hopes.

A run is a request to the TicketDispatcher, one per pass, never a process of the session and never watched:
the commands, the three-small-requests rule and what each request should play are in
[`Tests/Pickle/README.md`](Tests/Pickle/README.md).

## Passes

The mod is validated by four passes, and a report has to say which one it is.

| Pass | Mod set | Language | What it proves |
|---|---|---|---|
| **P1** | Core, the five expansions, Harmony, RimLogging, Pickle and this mod | English | The mod stands alone, with every expansion present. Features `01` to `04` and `06`. 15 scenarios |
| **P2** | The same set | French, by `-Language French` at staging | What the game holds in French, and that no key falls back to accented developer-mode gibberish. Features `01` and `07`. 9 scenarios |
| **P3** | P1 plus the original, `Coolie.Ebbbs` | English | Whether the declared incompatibility is still true. The documented symptom is **asserted**, so a green pass means the incompatibility behaves as declared. Feature `05`. 1 scenario |
| **P4** | P1 plus A Dog Said... Animal Prosthetics 2, `SamBucher.ADogSaidAnimalProsthetics2`, staged after this mod by the pass map | English | The one optional integration this mod claims: it loads before that mod, and each species is offered the surgeries of its category and none of a higher one. Features `01` and `08`. 8 scenarios |

`loadAfter` names Core and the five official expansions, which the minimal set already carries, so there is
no pass that stages all of them apart from P1. The one optional mod this mod integrates with is A Dog Said 2,
and that is P4. M8, "repeat with the available expansions", is covered by every pass, since the minimal set
carries every expansion.

P3 is replayed when the original mod moves, not at every publication: its update is what ages the
verdict. The original is not in the Windows Workshop folder of this machine, and it was downloaded into the WSL
cache on 2026-09-25, which is where P3 stages it from. Its packageId, `Coolie.Ebbbs`, is the one `About.xml`
names, and it matches the `About.xml` of the downloaded item. P4 is replayed when A Dog Said 2 renames its recipes or its
category lists, which is what its update would change. It is installed here (version 1.3.7, checked 2026-09-25).

## What only a running game can show

Written on 2026-09-24. Each scenario of `Tests/MANUAL.md` is either a Pickle scenario, replaced by another,
or not applicable with its reason. **P1 and P2 were played once on 2026-09-24 (`docs/runs/2026-09-24.md`): everything passed except two scenarios that failed on the test companion's own log lines, which are fixed and requested again. P3 and P4 have not been played.**

| Scenario | Verdict |
|---|---|
| M1 clean load, title, icon | **Pickle `01`**: nothing logged as an error or a warning names the mod's defs or its identifier, read from the game's own log because Pickle's step cannot see load-time errors. The title, icon and Preview in the mod list are what the game draws from `About.xml`, which the offline checker validates: **not applicable** as a scenario |
| M2 nine species spawn, textures | **Pickle `02`**: each species is generated on the colony map and nothing is logged, plus one `@review` capture of the nine. A missing texture is logged, so `01` and `02` both see it |
| M3 wildness, taming | **Pickle `01`**: the `Wildness` entry the game loaded, for each of the nine. That the stat is read is what the original fault broke. The taming success rate is the engine's arithmetic and one success proves nothing, so it is **not automated** |
| M4 diet, hunger, training | **Not applicable as a scenario**: it exercises what the game does with fields the defs merely declare |
| M5 injure, butcher, corpse | **Pickle `03`**: butchering an adult of each species leaves ebbb meat and leather, and the thrumebbb leaves its horn. The anatomy labels are asserted in `06` and `07`. Injury and treatment are the game's health system acting on body plans whose references load-time errors already cover: **not applicable** |
| M6 save and reload | **Pickle `04`**: the nine species come back from a save and a reload. Loading `test-colony`, written without this mod, is also the "mod added to an existing save" case |
| M7 original enabled alongside | **Replaced by P3, `05`**: the mod-list warning is the game's own behaviour, and what is worth asserting is the symptom |
| M8 expansions | Covered by every pass, see above |
| A Dog Said 2 support, added after M1 to M9 were written | **Pickle `08`, pass P4**: `loadBefore` in the running game, then the surgeries each species is offered through `ThingDef.AllRecipes`. Offline, `Tests/Validate-Mod.ps1` asserts the patch, the category of each species and the order declaration, and the patch was applied to that mod's own category file. The order of two mods in a mod list and the game's reading of the result need the pass |
| M9 English and French | **Pickle `06` and `07`**: the 104 texts this mod owns, read off the loaded definitions in each language. **Not asserted, and not applicable to automation:** whether a long French text fits or clips in a window, which is the game's layout and needs a person; and the generated corpse and meat descriptions, which come from Core keys and were checked in the 2026-09-13 audit against Core's own files |

## Exit criteria, `done` to `tested`

All of them, on the revision that is delivered:

1. Every scenario ran in the game and is green. The Pickle suites are green **and** their `@review`
   captures were opened and looked at: a green run says the path was followed, not that the image shows
   what it should. `exitReason` is read before any count, and the scenarios played are compared with
   the features discovered.
2. Logs checked, the interface verified in English and in French, new game and existing save covered.
3. **No `@wip` scenario.** One that was set aside is either repaired and replayed, or deleted with its
   justification. A remaining `@wip` is a scenario waiting, not a scenario passed.
4. **Every conditional scenario ran.** Each `@requires:<packageId>` had its pass, with the map that
   mounts that mod, and its report was read: suite name and scenario names checked before it is cited,
   because the report folder is shared by the whole machine. A scenario skipped for want of its condition
   is not a scenario passed. Today the conditional sets are `05`, on `Coolie.Ebbbs`, and `08`, on
   `SamBucher.ADogSaidAnimalProsthetics2`.
5. **No manual test left to validate.** Each of M1 to M9 is green as an automated scenario, or is
   listed above as not applicable with its reason. The `@review` captures still get looked at, but that
   is reading an image a scenario already proved to be in the wanted state, not one more manual test.

## Evidence

Which proofs to keep, and how to cut them down, is written in
[`docs/runs/README.md`](docs/runs/README.md): one proof per check, the log of every pass as text,
nothing about a superseded revision, captures reviewed at full size and then minified. Evidence stays
on disk and is ignored by git; what is versioned is the day's summary in `docs/runs/`.
