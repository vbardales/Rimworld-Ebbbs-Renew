# Preview composition

Run `node ../scripts/Render-Preview.cjs` from the repository root. The shared renderer captures at
896 × 504 after the image and fonts load, then writes the final PNG, HTML and QA artifacts.

- `Preview.png`: retained text-free illustration at its original 1536 × 1024 resolution.
- `preview-copy.json`: exact title hierarchy, copy, top-left panel, echo and ModIcon placement.
- `echo.png`: final-size transparent 3 px line-art of the tall ebbb. The renderer consumes it
  unchanged (`preSized: true`), colors it with the accent, mirrors it horizontally and applies no
  directional fade or veil.
- `ModIcon-cutout.png`: high-resolution true-alpha mascot source regenerated from the original
  design. `ModIcon-badge.png` is the alpha-trimmed composition derivative; intentional black areas
  remain opaque.
- `preview-palette.json`: the only source of overlay colors.
- `Preview-layout.html`, `preview-qa.json` and `Preview-background-qa.png`: shared-renderer QA
  artifacts.
- `Gallery/0-preview.png`: byte-for-byte copy of `Mod/About/Preview.png`.

The title uses RimWord for `Ebbbs`; `(Continued)` and the description use Segoe UI. The icon is
anchored bottom-left, rotated +15°, and deliberately crosses the image edge by 12.5%. After every
render, inspect the full-size preview and its 268 px thumbnail, refresh the gallery copy, and
regenerate `Art/Preview.ico` from the delivered preview.
