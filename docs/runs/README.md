# Runs

One text file per day of testing, written by hand from what was seen. It is the only record of a
run that lives in git.

This mod has never been run in the game, so this folder holds nothing else yet. The first line of
history goes here the day a pass of [`TESTING.md`](../../TESTING.md) is executed.

The evidence itself - `Player.log`, reports, screenshots - stays **on disk**: Pickle reports under
`Tests/Pickle/Evidence/<pass>/`, anything played by hand under
`Tests/Manual/evidence/<date>/<check>/`. Both are ignored by git. `<pass>` is `p1`, `p2` or `p3`, and
`<check>` is `load`, `spawn`, `butcher`, `save`, `l10n` or `incompat`. None of it is backed up: if the
machine is lost, the summaries here and the history are what remains.

A summary must carry, since the media are not beside it:

- the game version and expansions, the mod list, and the revision of this repository that was tested
- for each scenario of `TESTING.md`, pass or fail, and for a failure the cause as read from the log,
  not the assumed one
- what a person actually opened and saw in each capture, and what it did not show
- where the media are on disk, so the next reader can find them

A summary without those is a claim, not a record. One text line per run is enough for the history;
never a folder per run.

## What to keep, and how

The disk is shared by every mod, and evidence of a superseded build proves nothing about the current
one. So a run's evidence is cut down as soon as a newer one replaces it.

**Keep, for the revision now in the repository, one proof per check:**

| Check | The one proof to keep |
|---|---|
| Clean load | the `Player.log` of the pass as text, and one capture of the mod list showing the title and the icon |
| The nine species spawn | one capture of the nine together, and the log as text: a missing texture is written there, not visible in a still |
| Wildness | the nine displayed values written in the summary, and one capture of one information card showing the stat |
| Butchering | one capture of the health tab per body plan, five in all, and one of the products of a thrumebbb including the horn |
| Save and reload | the counts before and after as text, and the load log |
| English and French | per language, one capture of one species description and one health tab: four in all, not one per action |
| The original enabled alongside (P3) | the `Player.log` of the pass as text, and the lines that assert the documented symptom |
| Every Pickle pass | the four text files of its report (`summary.json`, `summary.md`, `junit.xml`, `Player.log`), copied by the launcher's `-EvidenceDir` under `Tests/Pickle/Evidence/<pass>/`, with `exitReason` and the played and discovered counts read before anything else. `report.html` and `messages.ndjson` are deleted: they are large and add nothing the four files do not carry |

**Keep an older report only** when it is the sole proof of a check the latest run did not repeat.

**Delete** anything about a revision the latest run replaced, failed attempts once their cause is
written in the day's summary, and a second capture of a state that one capture already shows.

**Minify what stays.** Review a capture at full size **before** converting it, then keep it as JPEG:

```bash
ffmpeg -i capture.png -q:v 3 capture.jpg && rm capture.png
```

About 250 KB instead of 3 MB, and small text stays legible at native size. A capture is evidence of
what was seen, not of pixels, so lossy is fine here. It is not fine for anything that will be
measured or diffed later.

**Before deleting a report, check that no `STATUS.md` field points at it**, repoint the field first,
and list what goes and what stays. Then add its line to the day's summary in this folder.

## Git

`Tests/Pickle/Evidence/`, `Tests/Manual/evidence/` and any `evidence/` are ignored, and so is `*.dds`.
Nothing under them is ever tracked. If a capture is needed in a commit, write what it shows in the
summary instead.
