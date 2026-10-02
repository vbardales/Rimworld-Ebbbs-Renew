# Images for the Workshop page, on the owner's showcase colony (her ruling of 2026-09-25: the rules of
# Work Studio's PUBLICATION.md, "Workshop screenshots", apply here).
#
# Her ruling of 2026-10-02, which this feature obeys: every gallery capture is a staged photograph, the menus
# excepted. The gallery is promotional, nothing in it stays at the default settings. A story for the series,
# then arranged as a photographer would: one common set that ties the series together, and for each image a
# subject whose every detail suits what it shows (hair, clothes in a palette that makes the subject stand out,
# a chosen body and face, never a random silhouette), a little decor when it tells something. The same
# background from one image to the next: set the decor down, take the photograph, remove it, go on to the next.
# Menus and interface windows are screenshots of what they are and are not staged.
#
# THE STORY: "Cheese night at the goo pen". At dusk Miel, the keeper of the flower glade, carries the evening's
# cheese to her nine goo animals. She sits at the little table by the lamp, the stools are pulled out, pots
# of herbs stand around, the shelf holds the day's wheels, the fire is lit; the nine species come in a half
# circle because they all know what the table holds. The keeper is dressed in cheese colours (a mustard shirt,
# brown trousers, copper hair): warm tones against creatures that are dark goo, so that the creatures, not
# the keeper, are what the eye lands on. No tattoo: nothing in the story calls for one.
#   1. Wide shot: the keeper at her table, the nine species gathered round her (the whole content of the mod).
#   2. Close shot: the keeper with an ebbb and a beee beside her, the same decor (the gentle side of the goo).
#   3. The information card of an ebbb showing Wildness: a MENU, so a plain capture, not staged.
#
#   - The scene is the fixture "nelim-zen-meadow-studio" of PickleTools/ScreenshotStudio, staged only by
#     wsl-deps.studio.map. Every other pass skips this feature.
#   - The keeper is Miel, a colonist of the fixture who stands at the cell 154,98 in the flower glade. The set
#     is built around her: the table south of her, the lamp, the pots and the shelf at her sides, the fire
#     further west. "The decor is removed" ends each staged scenario, so the next image has the same
#     background (cells the game cleared of grass stay bare: the camera never looks at them for long).
#   - Run it in English: the Workshop page is English.
#   - The information card is this mod's own window in front of the interface: screenshot mode hides the HUD
#     around it, the pattern of DalmatiansRenew's 07-publication-shots. The runner starts the game
#     with developer mode on; the staged shots turn it off for the capture.
#   - The mouse at the screen centre would draw a tooltip over the picture: the pointer is moved to bare
#     grass before the capture.
#   - Each image is opened and looked at before it is called ready; its composition is the owner's call
#     (every cell and zoom below is a first guess, to be judged on the capture).
#   - Not here: the A Dog Said 2 recipe (image 4) and the Nocturnal Animals clock (image 5) need other maps
#     and other passes; no scenario is written for them yet.
#   - The thrumebbb with its horn is not a scenario of its own: no step frames one animal yet.
#
# Raw captures land outside the committed gallery and the finished images are copied into
# Art/Gallery/ numbered 1-, 2-, 3-; 0-preview.png is already there.
@review @requires:nelim.pickletools.screenshotmode @requires:nelim.pickletools.screenshotstudio @requires:nelim.pickletools.colonistrace @requires:nelim.pickletools.stagedecor @requires:nelim.pickletools.camerazoom
Feature: images for the Workshop page

  Background:
    Given the save "nelim-zen-meadow-studio" is loaded
    And game speed is paused

  Scenario: wide shot, the keeper at her table with the nine species gathered round her
    Given a colonist "Miel" exists
    And Nelim's Pickle Tools: "Miel" body type is Female
    And Nelim's Pickle Tools: "Miel" hairstyle is "Flowy"
    And Nelim's Pickle Tools: "Miel" hair colour is rgb (176, 82, 38)
    And Nelim's Pickle Tools: "Miel" wears "Apparel_CollarShirt" dyed rgb (222, 170, 60)
    And Nelim's Pickle Tools: "Miel" wears "Apparel_Pants" dyed rgb (92, 58, 38)
    And Nelim's Pickle Tools: "Miel" stands at (154, 98) facing South
    And Nelim's Pickle Tools: I place the decor "Table2x2c" at (153, 95)
    And Nelim's Pickle Tools: I place the decor "Stool" at (152, 95)
    And Nelim's Pickle Tools: I place the decor "Stool" at (155, 96)
    And Nelim's Pickle Tools: I place the decor "StandingLamp" at (150, 99)
    And Nelim's Pickle Tools: I place the decor "PlantPot" at (151, 97)
    And Nelim's Pickle Tools: I place the decor "PlantPot" at (157, 99)
    And Nelim's Pickle Tools: I place the decor "Shelf" at (157, 101)
    And Nelim's Pickle Tools: I place the decor "Campfire" at (149, 94)
    And Ebbbs Renew: the nine species gather in a half circle south of the cell 154 95 at 6 cells
    When I move the camera to (154, 94)
    And Nelim's Pickle Tools: the camera root size is set to 8
    And Nelim's Pickle Tools: I move the mouse to (960, 1000)
    And Nelim's Pickle Tools: developer mode is turned off for the capture
    Then I take a screenshot "Workshop page, the keeper and the nine species"
    When Nelim's Pickle Tools: the decor is removed
    And Nelim's Pickle Tools: "Miel" gets back the clothes it had

  Scenario: close shot, the keeper with an ebbb and a beee beside her
    Given a colonist "Miel" exists
    And Nelim's Pickle Tools: "Miel" body type is Female
    And Nelim's Pickle Tools: "Miel" hairstyle is "Flowy"
    And Nelim's Pickle Tools: "Miel" hair colour is rgb (176, 82, 38)
    And Nelim's Pickle Tools: "Miel" wears "Apparel_CollarShirt" dyed rgb (222, 170, 60)
    And Nelim's Pickle Tools: "Miel" wears "Apparel_Pants" dyed rgb (92, 58, 38)
    And Nelim's Pickle Tools: "Miel" stands at (154, 98) facing South
    And Nelim's Pickle Tools: I place the decor "Table2x2c" at (153, 95)
    And Nelim's Pickle Tools: I place the decor "Stool" at (152, 95)
    And Nelim's Pickle Tools: I place the decor "Stool" at (155, 96)
    And Nelim's Pickle Tools: I place the decor "StandingLamp" at (150, 99)
    And Nelim's Pickle Tools: I place the decor "PlantPot" at (151, 97)
    And Nelim's Pickle Tools: I place the decor "PlantPot" at (157, 99)
    And Nelim's Pickle Tools: I place the decor "Shelf" at (157, 101)
    And Nelim's Pickle Tools: I place the decor "Campfire" at (149, 94)
    And Ebbbs Renew: spawns the player animal "Ebbb1" as "Ebbb" close to the cell 152 98
    And Ebbbs Renew: spawns the player animal "Beee1" as "Beee" close to the cell 156 98
    When I move the camera to (154, 97)
    And Nelim's Pickle Tools: the camera root size is set to 5
    And Nelim's Pickle Tools: I move the mouse to (960, 1000)
    And Nelim's Pickle Tools: developer mode is turned off for the capture
    Then I take a screenshot "Workshop page, the keeper with an ebbb and a beee"
    When Nelim's Pickle Tools: the decor is removed
    And Nelim's Pickle Tools: "Miel" gets back the clothes it had

  # A menu: a capture of what it is, nothing staged.
  Scenario: the information card of an ebbb, with Wildness
    Given Ebbbs Renew: spawns the player animal "Ebbb1" as "Ebbb" near the cell 154 98
    When Ebbbs Renew: centres the camera two cells south of "Ebbb1"
    And Ebbbs Renew: opens the information card of "Ebbb1"
    Then Ebbbs Renew: the information card of "Ebbb1" lists the stat "Wildness"
    When Ebbbs Renew: filters the open information card to "wildness"
    And Nelim's Pickle Tools: screenshot mode is enabled around the open windows
    Then I take a screenshot "Workshop page, the information card"
    And Nelim's Pickle Tools: screenshot mode is disabled
