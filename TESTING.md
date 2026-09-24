# Testing — Ebbbs Renew

Nine species, five def files, no assembly, no patch. Everything a file checker can settle is settled
offline; what remains needs a running game. [`Tests/MANUAL.md`](Tests/MANUAL.md) holds the scenarios
M1 to M9 as written. This file says how they get run, and when the mod counts as tested.

**An empty log is not a pass.** The original fault, a `wildness` field that 1.6 no longer reads, made
no error at all: every species loaded and looked normal, and tamed for almost nothing. Only the
information card of each species settles it.

## Settled without the game

From the repository root. All three passed on 2026-09-24, revision `0fe6c02`, and are rerun after any
change to `Mod/Defs` or `Mod/Languages`:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File Tests/Validate-Mod.ps1
powershell -NoProfile -ExecutionPolicy Bypass -File Tests/Validate-Translations.ps1
powershell -NoProfile -ExecutionPolicy Bypass -File ../scripts/Check-DefInjected.ps1 -TransMod Mod
```

204 checks over nine XML files; 104 owned texts with their French entries; 104 injection keys, zero
errors. None of it loads a def through the engine: Core inheritance, texture loading and behaviour
still need the passes below.

## Passes

The mod is validated by three passes, and a report has to say which one it is.

| Pass | Mod set | Language | What it proves |
|---|---|---|---|
| **P1** | Core, the five expansions, Harmony, RimLogging, Pickle and this mod | English | The mod stands alone, with every expansion present. M1, M2, M3, M5, M6 |
| **P2** | The same set | French, by `-Language French` at staging | What the mod displays in French, and that no key falls back to accented developer-mode gibberish. M9 |
| **P3** | P1 plus the original, `Coolie.Ebbbs` | English | Whether the declared incompatibility is still true. The documented symptom is **asserted**, so a green pass means the incompatibility behaves as declared |

There is no pass "with the optional mods": `loadAfter` names Core and the five official expansions,
which the minimal set already carries, and the mod has no dependency map. If one is ever added, its
passes are added here. M8, "repeat with the available expansions", is covered by every pass for the
same reason.

P3 is replayed when the original mod moves, not at every publication: its update is what ages the
verdict. The original is not in the Steam workshop folder of this machine (checked 2026-09-24), so it
has to be fetched before P3 can be staged.

## What only a running game can show

Proposed scope, **not yet written**: each line is a scenario to write or a reason not to. It waits for
the owner's confirmation before any Gherkin is committed.

| Scenario | Verdict |
|---|---|
| M1 clean load, title, icon | Gherkin: no error logged from this mod. The icon and Preview in the mod list are a `@review` capture |
| M2 nine species spawn, textures | Gherkin: spawn each species, no `Could not load UnityEngine.Texture2D` in the log. One `@review` capture of the nine together |
| M3 wildness, taming | The nine values are asserted offline. In game: the information card of each species reads them, by a step that reads the stat or by a `@review` capture. The taming success rate is the engine's arithmetic and one success proves nothing, so it is **not automated**, with that reason |
| M4 diet, hunger, training | **Not applicable as a scenario**: it exercises what the game does with fields the defs merely declare |
| M5 injure, butcher, corpse | Gherkin: butcher one of each species, assert meat, leather and the thrumebbb horn. Anatomy display is a `@review` capture, one per body plan |
| M6 save and reload | Gherkin: the animals survive a reload |
| M7 original enabled alongside | **Replaced by P3**: the mod-list warning is the game's own behaviour, and what is worth asserting is the symptom |
| M8 expansions | Covered by every pass, see above |
| M9 English and French | P1 and P2, one language each, `@review` captures of labels and health tabs |

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
   is not a scenario passed. Today the only conditional set is P3's, on `Coolie.Ebbbs`.
5. **No manual test left to validate.** Each of M1 to M9 is green as an automated scenario, or is
   listed above as not applicable with its reason. The `@review` captures still get looked at, but that
   is reading an image a scenario already proved to be in the wanted state, not one more manual test.

## Evidence

Which proofs to keep, and how to cut them down, is written in
[`docs/runs/README.md`](docs/runs/README.md): one proof per check, the log of every pass as text,
nothing about a superseded revision, captures reviewed at full size and then minified. Evidence stays
on disk and is ignored by git; what is versioned is the day's summary in `docs/runs/`.
