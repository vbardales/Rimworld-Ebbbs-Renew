# Pickle suite for Ebbbs Renew

In-game scenarios for a mod that ships nine species, five body plans, a flesh type, leather and a horn, with
no code and one patch that only acts when A Dog Said 2 is loaded. They are **written and statically checked; P1 and P2 have been played once, see "Not verified" below, and no pass is green as a whole yet.** `../../TESTING.md`
says what belongs here, what stays out and why. Nothing in this folder is part of `Mod/`, which is what
Steam receives whole.

## What is asserted

| Feature | Pass | Asserts |
|---|---|---|
| `01-the-mod-loads` | every pass but the incompatibility one | the mod is loaded, its defs exist, **nothing logged while the defs loaded names one of them**, and each of the nine species carries the `Wildness` entry the game loaded |
| `02-the-species-spawn` | minimal, English | each species is generated on the colony map and nothing is logged; one `@review` capture of the nine together |
| `03-butchering` | minimal, English | butchering an adult of each species leaves the ebbb's meat and leather, and the thrumebbb leaves its horn |
| `04-save-and-reload` | minimal, English | the nine species come back from a save and a reload, and nothing is logged |
| `05-original-mod-incompatibility` | `incompat-original` | with `Coolie.Ebbbs` beside it, both mods define the species and the game silently keeps the later one (**being rewritten**: the first version asserted a log line the game does not write, see `docs/runs/2026-09-25.md`) |
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
$sha = git -C EbbbsRenew rev-parse --short HEAD   # goes in every label: a request carries no SHA of its own

# P1, minimal, English
powershell.exe -ExecutionPolicy Bypass -File Rimworld-Ticket-Dispatcher/scripts/Submit-PickleRun.ps1 -Mod EbbbsRenew -Owner local_97069b1a-bbbd-4ae6-9bf1-337ff49bcc92 -Label "EbbbsRenew local_97069b1a-bbbd-4ae6-9bf1-337ff49bcc92 $sha P1 minimal English" -Language English -Filter 'Ebbbs Renew - Pickle tests,!@fr-only' -EvidenceDir EbbbsRenew/Tests/Pickle/Evidence/p1-english

# P2, minimal, French: no map to load, so no @save
powershell.exe -ExecutionPolicy Bypass -File Rimworld-Ticket-Dispatcher/scripts/Submit-PickleRun.ps1 -Mod EbbbsRenew -Owner local_97069b1a-bbbd-4ae6-9bf1-337ff49bcc92 -Label "EbbbsRenew local_97069b1a-bbbd-4ae6-9bf1-337ff49bcc92 $sha P2 minimal French" -Language French -Filter 'Ebbbs Renew - Pickle tests,!@en-only,!@save' -EvidenceDir EbbbsRenew/Tests/Pickle/Evidence/p2-french

# P3, the original mod beside it
powershell.exe -ExecutionPolicy Bypass -File Rimworld-Ticket-Dispatcher/scripts/Submit-PickleRun.ps1 -Mod EbbbsRenew -Owner local_97069b1a-bbbd-4ae6-9bf1-337ff49bcc92 -Label "EbbbsRenew local_97069b1a-bbbd-4ae6-9bf1-337ff49bcc92 $sha P3 incompatibility" -Language English -DepMap wsl-deps.incompat-original.map -Filter '05-original-mod-incompatibility' -EvidenceDir EbbbsRenew/Tests/Pickle/Evidence/p3-incompat

# P4, A Dog Said 2 beside it
powershell.exe -ExecutionPolicy Bypass -File Rimworld-Ticket-Dispatcher/scripts/Submit-PickleRun.ps1 -Mod EbbbsRenew -Owner local_97069b1a-bbbd-4ae6-9bf1-337ff49bcc92 -Label "EbbbsRenew local_97069b1a-bbbd-4ae6-9bf1-337ff49bcc92 $sha P4 A Dog Said 2" -Language English -DepMap wsl-deps.avec-ads2.map -Filter '01-the-mod-loads,08-animal-prosthetics-2' -EvidenceDir EbbbsRenew/Tests/Pickle/Evidence/p4-ads2
```

| Pass | Scenarios it should play | Skipped by requirement |
|---|---|---|
| P1, minimal, English | 15: `01` x4, `02` x2, `03` x3, `04`, `06` x5 | `05` (2), `08` (4) |
| P2, minimal, French | 9: `01` x4, `07` x5 | `05` (2), `08` (4) |
| P3, incompat-original | 2: `05` x2 | none |
| P4, avec-ads2 | 8: `01` x4, `08` x4 | none |

Compare those numbers with what a report says it discovered and played, and read `exitReason` before the
counts. A skipped scenario is not a passed one: `05` and `08` are skipped in every pass but their own, and
have to have run in the pass that gives them their condition.

**The order in P4.** The staging script activates the mods a pass map names in the order of the map, before the mod under
test, and does not sort by `loadBefore`. The first run of P4 loaded A Dog Said 2 first and no species was offered a
surgery. The map now names this mod's own folder on its first line, which the staging treats as an overlay of the mod
under test, so the pass stages the order `About.xml` declares. Any future map for an integration that depends on
order does the same.

**Every scenario that starts from the menu waits for the game first.** Pickle gives the step "the main menu is open"
five seconds, and it took 4.4 s in a plain pass and 5.2 s with the original mod beside this one. The local step "the
game has finished starting" waits up to two minutes and comes first.

**Three small requests rather than one big one, and the right size for each.** A ticket to explore or to fix
plays as few scenarios as it can, one scenario named with `-Filter '::<scenario name>'`, never the whole suite
for a correction: it holds the machine for nothing and makes the others wait. A first or a final validation
plays every scenario of its pass, that is the filters above, which only leave out what belongs to another
language or another pass. One pass is one request.

**The tree is frozen until the request is done.** A request carries no SHA: the mod and this companion are
staged when the request is played, from the working tree of that moment, sometimes hours after it was
submitted, and the queue is long. So nothing under `Mod/` or `Tests/Pickle/Mod/` changes, for this work or for
any other, between the submission and `RUN_DONE`, and the SHA goes in the label to find the revision again in
the report. Documents outside those two folders can change. Evidence is emptied with `robocopy`, from an empty
folder onto the target, in mirror mode, and then the shell that is left is removed: a plain removal stalls on
capture names longer than MAX_PATH. A `report.html` or a `messages.ndjson` is not kept, `summary.json` and
`junit.xml` are enough.

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
Pickle's own vocabulary read from the installed assemblies and against this suite's thirteen steps, and fails
on an undefined or ambiguous one before a ticket is taken. It is static: it proves the text of a step exists,
not that the step does what the scenario hopes. Checked on 2026-09-25: 405 step lines, all resolved. A
deliberately wrong line was reported as undefined, so the check does bite.

## Not verified

- **Played once, on 2026-09-24, and not yet green.** P1 and P2 ran (`../../docs/runs/2026-09-24.md`): every
  scenario that plays passed except two, which failed on lines the game logged about the test companion and
  not about the mod. The steps and the companion were fixed and the two scenarios are requested again. The
  passes P3 and P4, and their features `05` and `08`, have not been played at all, and no pass has yet been
  green as a whole.
- **Settled by that run, and no longer open:** the species cells `(140..156, 155)` on `test-colony` take a
  pawn each, the butchering step's age setter does reach the last life stage (the thrumebbb left its horn),
  and `Then a "X" exists` counts an animal.
- `Coolie.Ebbbs` is the original's packageId: read from the item's own `About.xml` after it was downloaded into
  the WSL Workshop cache on 2026-09-25 (Workshop 2817264755). The incompatibility itself is what P3 is for.
- **What the game does with a defName that two mods define** was first read wrongly from `DefDatabase.Add`, which logs
  an error for a duplicate. Its caller, `AddAllInMods`, first removes the earlier def, so a later mod silently
  replaces an earlier one and only a duplicate inside one mod is logged. The first run of `05` showed it: no such line
  in the log. The comment in `About.xml` was rewritten wrongly on 2026-09-24. It is corrected (2026-09-25, after the final
  passes were done) and `05` now asserts the silent replacement: both mods define the species, the game runs the later
  one's copy, and the original's `wildness` errors are logged.
- **A Dog Said 2, feature `08`.** That the recipes end up in `ThingDef.AllRecipes` of each species is read
  from the way the game builds that list from `recipeUsers`, not from a run. That a concrete recipe such as
  `InstallBionicLegAnimal` inherits its `recipeUsers` from the abstract recipe the category lists are copied
  into is XML inheritance as the game documents it, and was not seen. What was checked offline: the patch,
  applied to that mod's own category file from its repository, matches each list exactly once and leaves
  each species in the right lists, and that mod's last patch then copies them to the recipes. Neither the
  order of two mods in a mod list nor the game's reading of the result was exercised. The item is installed
  on this machine and in the WSL cache (checked 2026-09-25: version 1.3.7, packageId `SamBucher.ADogSaidAnimalProsthetics2`),
  so pass P4 can be staged.
- The recipe names in `08` were checked against the installed copy on 2026-09-25: all five, and the abstract
  bionic recipe, are defined in its 1.6 files, and its category file is identical to the one from its repository.
  A rename in a later version fails the scenario at its first step, saying the recipe is not loaded.
