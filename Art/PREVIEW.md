# Recomposing the Preview

Unmodified illustration: `Preview.png`, recovered on 2026-09-12 from the delivered
file, which did not yet contain any overlay. The illustration was not replaced.
The old HTML in `_tools/preview.html` supplied the summary, preserved exactly.

Composition: `preview.html`, 896 × 504; single palette: `preview-palette.json`.
The version is read from the delivered About.xml and sorted numerically.
The browser waits for `document.fonts.ready` and image decoding.

To rebuild, install Node.js, `playwright`, `sharp` and Chrome:

```powershell
# Adjust NODE_PATH if the modules are not installed locally.
$env:NODE_PATH = 'C:/Users/nelim/.cache/codex-runtimes/codex-primary-runtime/dependencies/node/node_modules'
node Art/render-preview.cjs
```

`PREVIEW_BROWSER` can specify another Chromium executable.
The script starts a temporary HTTP server on loopback, captures at native size,
saves `../Mod/About/Preview.png`, then the `preview-268.png` thumbnail, the
text-free `preview-background.png` background and the `preview-qa.json` measurements.
These verification files remain outside the distributed mod.

The dominant color family is ochre/brown: wood, crates and the pool of light.
The veil comes from dark wood; the secondary ink uses its lighter ochre tones.
Since this illustration is almost monochromatic apart from neutrals, the accent
extends the lamp's warm palette with copper orange (revised on 2026-09-13):
redder and more saturated than the secondary ink, with a different lightness.
The rule and badge make this difference visible.

Validation examines every pixel of the rendered background within the title,
suffix, tag and summary rectangles, beyond the required four-corner check.
The digits are checked against the triangle's opaque accent background. The font
actually used is queried through the Chrome DevTools Protocol. Supplement these
checks with a visual inspection of the final PNG and thumbnail after each change.
