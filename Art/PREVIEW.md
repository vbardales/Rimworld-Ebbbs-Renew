# Preview composition

Run `node ../scripts/Render-Preview.cjs` from the repository root. The shared renderer reads
`Art/Preview.config.json`, captures at 896 × 504 after the image and fonts load, and writes
`Mod/About/Preview.png`. Its temporary diagnostics go to `Art/.render/`, which git ignores.

- `Preview.config.json`: the one place for the copy, title hierarchy, layout, palette, echo and
  ModIcon placement. The title is `Ebbbs Renew`.
- `Preview-source.png`: the text-free illustration the renderer starts from.
- `echo.png`: final-size transparent line-art of the tall ebbb, used as the echo.
- `ModIcon-source.png` and `ModIcon-original.png`: the icon artwork; the delivered icon is
  `Mod/About/ModIcon.png`.
- `Gallery/0-preview.png`: byte-for-byte copy of `Mod/About/Preview.png`. The Workshop gallery
  images are numbered `1-`, `2-` ... in this folder (the staged shots of feature `11`, see
  `PUBLICATION.md`).
- `Preview.ico` and `ModIcon.ico`: local Explorer folder icons, derived from the delivered images and
  kept out of `Mod/`.

After every render, inspect the full-size preview and its 268 px thumbnail, refresh the gallery copy,
and regenerate `Art/Preview.ico` from the delivered preview. The rendered `Preview.png` shows the
title: a title change means a new render.
