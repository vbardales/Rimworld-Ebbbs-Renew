# Scénarios fonctionnels — RimWorld 1.6

État au 2026-09-12 : **non exécutés**. Utiliser une nouvelle sauvegarde de test,
Core + ce mod uniquement, sans l'original. Activer le mode développement.
Consigner version exacte, mods/DLC actifs, résultat par scénario et Player.log.

| ID | Actions | Résultat attendu |
|---|---|---|
| M1 | Activer le mod, redémarrer, créer une colonie sans DLC. Ouvrir sa description. | Aucun défaut XML/référence du mod dans le journal ; titre unofficial, lien GitHub, icône et Preview visibles. |
| M2 | Faire apparaître Ebbb, Beee, Crebbb, Drebbbd, Ebbberration, Ebbbomination, Goliebbb, Thrumebbb, Bebbbholder. Les déplacer dans les quatre directions ; tester leurs âges disponibles. | Neuf espèces utilisables, aucune texture rose/manquante ; variantes Ebbb visibles sur plusieurs individus. Goliebbb affiche bien goliebbb, et Ebbb reste nommé ebbb. |
| M3 | Lire la sauvagerie des neuf espèces ; tenter un apprivoisement normal avec nourriture et compétence adaptée, sans action debug de dressage. | Valeurs : Ebbb 70 %, Beee 80 %, Crebbb 20 %, Drebbbd 100 %, Ebbberration 40 %, Ebbbomination 100 %, Goliebbb 100 %, Thrumebbb 100 %, Bebbbholder 70 %. Aucune valeur -1 ; les espèces non apprivoisables doivent être traitées comme telles. Un succès unique ne prouve pas un taux correct. |
| M4 | Donner de la nourriture compatible aux animaux ; observer faim, chasse des prédateurs et entraînements autorisés. | Alimentation et entraînements cohérents avec leurs définitions, aucune exception. |
| M5 | Blesser puis soigner un animal de chaque plan corporel ; tuer et dépecer un spécimen de chaque espèce, dont Thrumebbb. Laisser un cadavre se dessécher. | Anatomie exploitable, sang noir, viande/cuir et corne selon les définitions ; cadavres visibles sans erreur. |
| M6 | Sauvegarder avec animaux et ressources, quitter puis recharger. | Animaux, âges, entraînements et ressources conservés ; aucune référence perdue. |
| M7 | Dans une configuration jetable, sélectionner aussi Coolie.Ebbbs sans charger de sauvegarde. | Incompatibilité signalée dans la liste des mods. Désactiver ensuite l'original. |
| M8 | Répéter chargement et apparition avec les DLC disponibles ; observer les apparitions naturelles dans un biome à poids positif. | Pas de conflit DLC ni erreur lors des apparitions. Consigner les DLC réellement testés. |

Tests automatisés : `powershell -NoProfile -ExecutionPolicy Bypass -File Tests/Validate-Mod.ps1`.
Ils contrôlent les XML et ressources locales ; ils ne remplacent pas le chargement,
la résolution des références Core et les comportements dans le moteur du jeu.

## M9 — English and French translation display

Not executed. Run once in English and once in French, restarting after changing
language. With Core and this mod, spawn all nine races and their available ages.
Inspect species descriptions, juvenile Thrumebbb labels, health tabs for all five
custom body plans, and melee tool labels. Inspect blood, leather and the horn,
then butcher animals and inspect generated meat and corpses. Check leather item
names when used as a material and battle log text containing body parts.

Expected: readable localized text, preserved species names and attribution, no raw
keys, unintended English fallback in French, broken accents, formatting or clipping.
Record exact game version, language, screenshots and translation-related Player.log
messages. Static checks do not establish success for this scenario.

Resource coverage check:
`powershell -NoProfile -ExecutionPolicy Bypass -File Tests/Validate-Translations.ps1`.
