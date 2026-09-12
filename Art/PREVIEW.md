# Recomposer la Preview

Illustration intacte : `Preview.png`, récupérée le 2026-09-12 depuis le fichier
livré qui ne contenait encore aucune surcouche. Aucun remplacement d'illustration.
L'ancien HTML `_tools/preview.html` a fourni le résumé, conservé exactement.

Composition : `preview.html`, 896 × 504 ; palette unique : `preview-palette.json`.
La version est lue dans l'About.xml livré et triée numériquement.
Le navigateur attend `document.fonts.ready` et le décodage de l'image.

Pour reconstruire, disposer de Node.js, `playwright`, `sharp` et Chrome :

```powershell
# Adapter NODE_PATH si les modules ne sont pas installés localement.
$env:NODE_PATH = 'C:/Users/nelim/.cache/codex-runtimes/codex-primary-runtime/dependencies/node/node_modules'
node Art/render-preview.cjs
```

`PREVIEW_BROWSER` permet de préciser un autre exécutable Chromium.
Le script lance un serveur HTTP temporaire sur loopback, capture à taille native,
enregistre `../Mod/About/Preview.png`, puis la vignette `preview-268.png`, le fond
sans texte `preview-background.png` et les mesures `preview-qa.json`.
Ces fichiers de contrôle restent hors du mod distribué.

La famille dominante est ocre/brun : bois, caisses et flaque de lumière.
Le voile vient du bois sombre ; l'encre secondaire reprend son ocre éclairci.
Cette illustration étant presque monochromatique hors neutres, l'accent reste
dans le prolongement chaud de la lampe, en orange cuivré (révision du 2026-09-13) : plus rouge et plus saturé que la secondaire,
avec une clarté différente. Le filet et le badge rendent cette différence visible.

La validation parcourt tous les pixels du fond rendu dans les rectangles du
titre, suffixe, tag et résumé, au-delà du contrôle des quatre coins demandé.
Les chiffres sont contrôlés sur l'accent opaque du triangle. La police réellement
utilisée est interrogée via le Chrome DevTools Protocol. Compléter par une
inspection visuelle du PNG final et de la vignette à chaque modification.
