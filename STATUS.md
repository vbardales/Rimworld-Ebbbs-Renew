---
mod:          Ebbbs Renew
packageId:    nelim.ebbbsrenew
repo:         Rimworld-Ebbbs-Renew
visibility:   public
detached:     yes
stage:        showcase
licence:      silent
licence_at:   five places, the About, the README the mod ships and the Steam page among them; none states a licence and none states a refusal
dependencies: none
showcase:     none
tested_on:
workshop:
remaining:
  - unverified: never seen running in game
  - feature: no `Mod/About/ModIcon.png` and no `Mod/About/Preview.png`, which the first release needs
  - defect: the goliebbb shows in game as `ebbb`, upstream and left alone on purpose
session:      local_8fb9b3b3-6745-46f1-93b9-0dc96c4c4ced
updated:      2026-09-12, by the session that holds this mod
---

# Ebbbs Renew — status

A status sheet, read by a sweep over every mod rather than by asking each thread one at a time.
It lives at the root, never inside `Mod/`, so Steam never receives it.

The sweep deduces from disk what disk can tell it. The fields it cannot are filled in here by the
session that holds this mod:

- **`stage: showcase`** — the port itself is finished. Nine creatures, five def files, no C#, no
  patch, no dependency, and the one 1.6 change made nine times over: `<Wildness>` now sits under
  `statBases` on all nine, with no `wildness` field left anywhere under `Defs/`. What the mod
  still lacks is its two images, which is the stage it is now at.
- **`tested_on`** — empty, and that is the honest state: this mod has never been loaded by
  RimWorld. The taming change is exactly the kind that a log will not show. A wildness read at
  `-1` produces no error, so the only proof is a colonist taming a goliebbb at a plausible rate
  rather than instantly.
- **`dependencies: none`** — literal here. The About declares no `modDependencies`, and its six
  `loadAfter` entries are Core and the five DLCs, nothing else. No DLC is required. The value
  means the mod needs nothing, as against `declared` when every mod it needs is named in the
  About's `modDependencies`, and `to check` when a non-vanilla `loadAfter` suggests one that is
  not. An undeclared dependency is not cosmetic: on 2026-09-11 Reequilibrage animaux took 47
  vanilla animals down with it, Muffalo included, because the class it injects belongs to a mod
  that was neither declared nor loaded.
- **`remaining`** — three entries. The `unverified` one is the never-run state above. The
  `feature` one is the missing pair of images. The `defect` one is inherited rather than
  introduced: the goliebbb's `ThingDef` carries `<label>ebbb</label>` while its `PawnKindDef`
  says `goliebbb`, and the `ThingDef` label is the one the game shows, so the largest of the nine
  is named after the smallest. It is upstream, present in the 1.5 files as in the earlier ones,
  and a label rather than breakage, so `ATTRIBUTION.md` records it instead of quietly rewriting
  it. One word fixes it the day that is the right call.

`detached: yes` since 2026-09-12: this folder is its own git repository, on `main`, with one
remote pointing at the public repository above. The monorepo ignores it and tracks none of its
files.

`licence: silent` — Coolie's original states no licence anywhere, and each of the five places was
read looking for a refusal rather than for a permission, in English and in the Japanese and
Chinese forms a refusal usually takes. `ATTRIBUTION.md` lists them one by one. Silence grants
nothing and forbids nothing, so this port rests on the Workshop's own custom for abandoned mods:
named credit, and a takedown on request. The source last supported 1.5 and was last updated in
July 2024. Abandoned, not withdrawn.

`showcase: none` — `Mod/About/` holds `About.xml` and nothing else. No `Art/` directory and no
build script either, so the two images have to be made before a first release, not just exported.

`workshop` is empty because nothing has been uploaded. The name, the description and the
`packageId` are frozen when a Workshop item is created, so they are worth a last reading before
the upload rather than after it.

Vocabulary for `licence`: `open` an explicit licence, `silent` no licence and a dead source,
`alive` no licence but a living source, `forbidden` a written refusal, `original` owing nothing
to anyone — not a name, not an idea traceable to one mod, not a value derived from its assets.

Vocabulary for `stage`: `port`, `showcase`, `preTest`, `done`, `tested`, `published`.

Vocabulary for `remaining`: `feature` for something missing from a first release, `defect` for a
known fault left unfixed, `unverified` for what could not be checked.
