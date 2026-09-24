# Pickle suite for Ebbbs Renew

In-game scenarios for a mod that ships nine species, five body plans, a flesh type, leather and a horn, with
no code and no patch. They are **written and statically checked; none has been run.** `../../TESTING.md`
says what belongs here, what stays out and why. Nothing in this folder is part of `Mod/`, which is what
Steam receives whole.

## What is asserted

| Feature | Pass | Asserts |
|---|---|---|
| `01-the-mod-loads` | every pass but the incompatibility one | the mod is loaded, its defs exist, **nothing logged while the defs loaded names one of them**, and each of the nine species carries the `Wildness` entry the game loaded |
| `02-the-species-spawn` | minimal, English | each species is generated on the colony map and nothing is logged; one `@review` capture of the nine together |
| `03-butchering` | minimal, English | butchering an adult of each species leaves the ebbb's meat and leather, and the thrumebbb leaves its horn |
| `04-save-and-reload` | minimal, English | the nine species come back from a save and a reload, and nothing is logged |
| `05-original-mod-incompatibility` | `incompat-original` | with `Coolie.Ebbbs` beside it, the game logs `Adding duplicate ThingDef name` and `Adding duplicate PawnKindDef name` |
| `06-labels-en`, `07-labels-fr` | English pass, French pass | the 104 texts this mod owns, as the loaded definitions hold them in the language the game started in |
| `08-animal-prosthetics-2` | `avec-ads2` | with A Dog Said 2 beside it, the mod loads before it, and each species is offered the surgeries of its category and none of a higher one |

Eight features, twenty-five scenarios. `06` and `07` are **generated** by `New-LabelFeatures.ps1` from
`../Translation-inventory.json`, which stops on any key it has no shape for, so a new kind of text cannot be
left out silently. Rerun it after any change to the inventory.

## Two things worth knowing before reading a green

**Pickle's own def steps cannot be used here.** Every species is two defs with the same defName, a
`ThingDef` and a `PawnKindDef`. `def "Ebbb" field ...` and `def "Ebbb" raw stat ...` look the name up across
every def database and throw when it names more than one def. This suite's steps in `Source/EbbbsSteps.cs`
name the def type instead. Read from Pickle 4.9.1's own source on 2026-09-24, not found by a run.

**Pickle's "no errors were logged" cannot see the errors this mod can produce.** It reads what is logged
after a scenario is armed, and arming clears the buffer; a def that fails to load logs its error at startup,
before any scenario. So `01` reads RimWorld's own log, `Verse.Log.Messages`, through two local steps. That
log is bounded, so a long modlist can push an early line out, which is why every pass here stages a small
set. `02`, `03` and `04` do use the shipped step, and it is right for them: they ask about what happens
after the map is loaded.

## Passes

A run is a **request** to the TicketDispatcher, never a process of this session: nothing here launches the
game, on Windows or anywhere else. Read `../../../AUDIT.md` first, then the dispatcher's
`Rimworld-Ticket-Dispatcher/docs/WELCOME.md`. From the collection root, one request per pass. The command
returns at once (`submitted <id>`); a detached worker plays the pass and copies the report into `-EvidenceDir`,
and the dispatcher wakes the session by message at `START`, `END` and `RUN_DONE`.

```powershell
# P1, minimal, English
powershell.exe -ExecutionPolicy Bypass -File Rimworld-Ticket-Dispatcher/scripts/Submit-PickleRun.ps1 -Mod EbbbsRenew -Owner local_97069b1a-bbbd-4ae6-9bf1-337ff49bcc92 -Label "Ebbbs Renew P1 minimal English" -Language English -Filter 'Ebbbs Renew - Pickle tests,!@fr-only' -EvidenceDir EbbbsRenew/Tests/Pickle/Evidence/p1-english

# P2, minimal, French: no map to load, so no @save
powershell.exe -ExecutionPolicy Bypass -File Rimworld-Ticket-Dispatcher/scripts/Submit-PickleRun.ps1 -Mod EbbbsRenew -Owner local_97069b1a-bbbd-4ae6-9bf1-337ff49bcc92 -Label "Ebbbs Renew P2 minimal French" -Language French -Filter 'Ebbbs Renew - Pickle tests,!@en-only,!@save' -EvidenceDir EbbbsRenew/Tests/Pickle/Evidence/p2-french

# P3, the original mod beside it
powershell.exe -ExecutionPolicy Bypass -File Rimworld-Ticket-Dispatcher/scripts/Submit-PickleRun.ps1 -Mod EbbbsRenew -Owner local_97069b1a-bbbd-4ae6-9bf1-337ff49bcc92 -Label "Ebbbs Renew P3 incompatibility" -Language English -DepMap wsl-deps.incompat-original.map -Filter '05-original-mod-incompatibility' -EvidenceDir EbbbsRenew/Tests/Pickle/Evidence/p3-incompat

# P4, A Dog Said 2 beside it
powershell.exe -ExecutionPolicy Bypass -File Rimworld-Ticket-Dispatcher/scripts/Submit-PickleRun.ps1 -Mod EbbbsRenew -Owner local_97069b1a-bbbd-4ae6-9bf1-337ff49bcc92 -Label "Ebbbs Renew P4 A Dog Said 2" -Language English -DepMap wsl-deps.avec-ads2.map -Filter '01-the-mod-loads,08-animal-prosthetics-2' -EvidenceDir EbbbsRenew/Tests/Pickle/Evidence/p4-ads2
```

| Pass | Scenarios it should play | Skipped by requirement |
|---|---|---|
| P1, minimal, English | 15: `01` x4, `02` x2, `03` x3, `04`, `06` x5 | `05` (1), `08` (4) |
| P2, minimal, French | 9: `01` x4, `07` x5 | `05` (1), `08` (4) |
| P3, incompat-original | 1: `05` | none |
| P4, avec-ads2 | 8: `01` x4, `08` x4 | none |

Compare those numbers with what a report says it discovered and played, and read `exitReason` before the
counts. A skipped scenario is not a passed one: `05` and `08` are skipped in every pass but their own, and
have to have run in the pass that gives them their condition.

**Three small requests rather than one big one, and the right size for each.** A ticket to explore or to fix
plays as few scenarios as it can, one scenario named with `-Filter '::<scenario name>'`, never the whole suite
for a correction: it holds the machine for nothing and makes the others wait. A first or a final validation
plays every scenario of its pass, that is the filters above, which only leave out what belongs to another
language or another pass. One pass is one request.

There is nothing to watch. No `Monitor`, no heartbeat, no cron, no loop and no script left running in the
background: the dispatcher sends `START`, `END` (the lock returned, not the verdict) and `RUN_DONE` (the
launcher's exit code, the attempts, the evidence folder and the journal). Exit code 7 means the queue was
abandoned and nothing was played; 2 is the only one worth retrying, for a busy machine.

The French pass plays no map: what a French player reads is the loaded def, and `07` asserts that. The
language is fixed at staging by `-Language French`, never switched inside a scenario. Whether a long French
text fits its window is not asserted, see `../../TESTING.md`.

## Before queuing

```powershell
dotnet build Tests/Pickle/Source/EbbbsRenew.PickleSteps.csproj -c Release
powershell -NoProfile -ExecutionPolicy Bypass -File Tests/Pickle/Check-Steps.ps1
```

The build writes the step DLL into `Mod/Pickle/Assemblies/`, which git ignores: rebuild before every run,
because Pickle loads step DLLs when the game starts. `Check-Steps.ps1` matches every step line against
Pickle's own vocabulary read from the installed assemblies and against this suite's ten steps, and fails
on an undefined or ambiguous one before a ticket is taken. It is static: it proves the text of a step exists,
not that the step does what the scenario hopes. Checked on 2026-09-24: 377 step lines, all resolved. A
deliberately wrong line was reported as undefined, so the check does bite.

## Not verified

- **Nothing has been run.** Every scenario, including its expected values, is unverified until a pass plays it.
- The species cells `(140..156, 155)` come from other suites of this collection on the same fixture. Whether
  each is free on `test-colony` is not known, and Pickle's spawn step places the pawn exactly there.
- The butchering step sets an adult's age with `ageTracker.AgeBiologicalTicks` and checks the life stage it
  landed in. That the setter recomputes the stage is read from the API, not from a run; the step fails
  saying so when it does not.
- `Then a "X" exists` waits for a thing of that def on the map. That it counts an animal is read from the
  step's description, not from a run.
- Whether `Coolie.Ebbbs` is the original's packageId is not known: the original is not installed here, and it
  has not been downloaded into the WSL install's Workshop cache.
- `Mod/About/About.xml` carried an XML comment saying a duplicate defName "logs nothing". The game's source
  says it logs an error and renames the later def, and the comment was corrected on 2026-09-24 when the
  file was edited for A Dog Said 2. `05` is what settles it in a running game.
- **A Dog Said 2, feature `08`.** That the recipes end up in `ThingDef.AllRecipes` of each species is read
  from the way the game builds that list from `recipeUsers`, not from a run. That a concrete recipe such as
  `InstallBionicLegAnimal` inherits its `recipeUsers` from the abstract recipe the category lists are copied
  into is XML inheritance as the game documents it, and was not seen. What was checked offline: the patch,
  applied to that mod's own category file from its repository, matches each list exactly once and leaves
  each species in the right lists, and that mod's last patch then copies them to the recipes. Neither the
  order of two mods in a mod list nor the game's reading of the result was exercised. The item has not been
  downloaded into the WSL install's Workshop cache.
- Which recipes the four names in `08` are: they were read from that mod's repository, not from an installed copy,
  and a rename there fails the scenario at its first step saying the recipe is not loaded.
