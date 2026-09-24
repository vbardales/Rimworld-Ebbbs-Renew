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

Seven features, twenty-one scenarios. `06` and `07` are **generated** by `New-LabelFeatures.ps1` from
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

One at a time, from the collection root, each through the shared queue and never by hand. Read
`../../../AUDIT.md` first: the machine has one RimWorld, and nothing here launches the game on Windows.

```powershell
# minimal, English
powershell.exe -ExecutionPolicy Bypass -File scripts/Run-PickleWsl.ps1 -Mod EbbbsRenew -Language English -Filter 'Ebbbs Renew - Pickle tests,!@fr-only' -EvidenceDir EbbbsRenew/Tests/Pickle/Evidence/p1-english

# minimal, French: no map to load, so no @save
powershell.exe -ExecutionPolicy Bypass -File scripts/Run-PickleWsl.ps1 -Mod EbbbsRenew -Language French -Filter 'Ebbbs Renew - Pickle tests,!@en-only,!@save' -EvidenceDir EbbbsRenew/Tests/Pickle/Evidence/p2-french

# the original mod beside it
powershell.exe -ExecutionPolicy Bypass -File scripts/Run-PickleWsl.ps1 -Mod EbbbsRenew -DepMap wsl-deps.incompat-original.map -Language English -Filter '05-original-mod-incompatibility' -EvidenceDir EbbbsRenew/Tests/Pickle/Evidence/p3-incompat
```

| Pass | Scenarios it should play | Skipped by requirement |
|---|---|---|
| P1, minimal, English | 15: `01` x4, `02` x2, `03` x3, `04`, `06` x5 | `05` (1) |
| P2, minimal, French | 9: `01` x4, `07` x5 | `05` (1) |
| P3, incompat-original | 1: `05` | none |

Compare those numbers with what a report says it discovered and played, and read `exitReason` before the
counts. A skipped scenario is not a passed one: `05` is skipped in every pass but its own, and has to have
run in the pass that gives it its condition.

The French pass plays no map: what a French player reads is the loaded def, and `07` asserts that. The
language is fixed at staging by `-Language French`, never switched inside a scenario. Whether a long French
text fits its window is not asserted, see `../../TESTING.md`.

A session waits for its ticket with the `Monitor` tool on a read-only poll of `scripts/Pickle-Status.ps1`,
which is what a heartbeat is under Codex, never with a cron and never with a script launched in the
background from a shell.

## Before queuing

```powershell
dotnet build Tests/Pickle/Source/EbbbsRenew.PickleSteps.csproj -c Release
powershell -NoProfile -ExecutionPolicy Bypass -File Tests/Pickle/Check-Steps.ps1
```

The build writes the step DLL into `Mod/Pickle/Assemblies/`, which git ignores: rebuild before every run,
because Pickle loads step DLLs when the game starts. `Check-Steps.ps1` matches every step line against
Pickle's own vocabulary read from the installed assemblies and against this suite's eight steps, and fails
on an undefined or ambiguous one before a ticket is taken. It is static: it proves the text of a step exists,
not that the step does what the scenario hopes. Checked on 2026-09-24: 347 step lines, all resolved. A
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
- `Mod/About/About.xml` carries an XML comment saying a duplicate defName "logs nothing". The game's source
  says it logs an error and renames the later def. The comment is not shown to players and was left alone,
  because `Mod/` is what Steam receives; `05` is what settles it in a running game.
