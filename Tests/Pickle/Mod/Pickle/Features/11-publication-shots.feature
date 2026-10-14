# Images for the Workshop page, played in Nelim's Sanctuary Backlot (GALLERY.md; since 2026-10-09 the gallery
# scenarios play there and no longer in the ScreenshotStudio fixture "nelim-zen-meadow-studio", which is retired).
#
# Every gallery capture is a staged photograph, the menus excepted. The gallery is promotional, nothing in it
# stays at the default settings. One story for the series, one common set, and for each image a subject whose
# every detail suits what it shows. Menus and interface windows are screenshots of what they are, not staged.
#
# THE STORY: "Cheese night in the clearing". At dusk Miel, the keeper, carries the evening's cheese to her nine
# goo animals in the cream clearing of the Sanctuary (`calm-zone`, a bare 11 x 9 square ringed with flowers: no
# building, no other animal). She sits at the little table by the lamp, the stools are pulled out, pots of
# herbs stand around, the shelf holds the day's wheels, the fire is lit; the nine species come in a half
# circle because they all know what the table holds. The keeper is dressed in cheese colours (a mustard
# shirt, brown trousers, copper hair): warm tones against creatures that are dark goo, so that the creatures,
# not the keeper, are what the eye lands on. No tattoo: nothing in the story calls for one.
#   1. Wide shot: the keeper at her table, the nine species gathered round her (the whole content of the mod).
#   2. Close shot: the keeper with an ebbb and a beee beside her, the same set (the gentle side of the goo).
#   3. The information card of an ebbb showing Wildness: a MENU, so a plain capture, not staged, on the
#      exhibition zone (a full-screen window takes the carpet backdrop).
#
#   - Pass: wsl-deps.sanctuary.map (the Backlot's minimum list plus this mod), English: the Workshop page is
#     English. Every other pass skips this feature.
#   - The clearing is x 195-205, z 183-191 (SANCTUAIRE-CASES.md, free cells). The keeper stands at (200, 189)
#     facing South; the table is south of her, the lamp, the pots and the shelf at her sides, the fire at the
#     south-west corner. "The decor is removed" ends each staged scenario, so the next image has the same
#     background.
#   - Dusk: hour 18, clear weather. The lamp and the fire are lit.
#   - Every cell and zoom below is a first guess, to be judged on the capture; each image is opened and looked at
#     before it is called ready.
#   - Not here: the A Dog Said 2 recipe and the Nocturnal Animals clock need other maps and other passes.
#   - The thrumebbb with its horn is not a scenario of its own: no step frames one animal yet.
#
# Raw captures land outside the committed gallery and the finished images are copied into
# Art/Gallery/ numbered 1-, 2-, 3-; 0-preview.png is already there.
@review @requires:nelim.sanctuarybacklot @requires:nelim.pickletools.screenshotmode @requires:nelim.pickletools.screenshotstudio @requires:nelim.pickletools.colonistrace @requires:nelim.pickletools.stagedecor @requires:nelim.pickletools.camerazoom @requires:nelim.pickletools.clearscreen
Feature: images for the Workshop page

  Background:
    Given the save "Nelims-tribe" is loaded

  Scenario: wide shot, the keeper at her table with the nine species gathered round her
    Given I set the hour to 18
    And I set the weather to "Clear"
    And Nelim's Pickle Tools: the colonists are sent to the map corner
    And Nelim's Sanctuary: I am at the sanctuary "calm-zone"
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: all animals are removed
    And Nelim's Pickle Tools: I place the decor "Table2x2c" at (199, 186)
    And Nelim's Pickle Tools: I place the decor "Stool" at (198, 186)
    And Nelim's Pickle Tools: I place the decor "Stool" at (201, 187)
    And Nelim's Pickle Tools: I place the decor "TorchLamp" at (196, 190)
    And Nelim's Pickle Tools: the decor "TorchLamp" at (196, 190) is lit
    And Nelim's Pickle Tools: I place the decor "PlantPot" at (197, 188)
    And Nelim's Pickle Tools: I place the decor "PlantPot" at (203, 190)
    And Nelim's Pickle Tools: I place the decor "Shelf" at (204, 188)
    And Nelim's Pickle Tools: I place the decor "Campfire" at (195, 185)
    And Nelim's Pickle Tools: I let 60 ticks pass
    And a colonist "Miel" exists
    And Nelim's Pickle Tools: "Miel" body type is Female
    And Nelim's Pickle Tools: "Miel" hairstyle is "Flowy"
    And Nelim's Pickle Tools: "Miel" hair colour is rgb (176, 82, 38)
    And Nelim's Pickle Tools: "Miel" wears "Apparel_CollarShirt" dyed rgb (222, 170, 60)
    And Nelim's Pickle Tools: "Miel" wears "Apparel_Pants" dyed rgb (92, 58, 38)
    And Nelim's Pickle Tools: "Miel" stands at (200, 189) facing South
    And Nelim's Pickle Tools: "Miel" facial expression is "SocialRelax"
    And Ebbbs Renew: the nine species gather in a half circle south of the cell 199 186 at 3 cells
    And Nelim's Pickle Tools: time is paused for the capture
    When Nelim's Pickle Tools: I frame the cell (200, 185) at zoom 8
    And Nelim's Pickle Tools: the map is shown alone for a capture
    Then I take a screenshot "Workshop page, the keeper and the nine species"
    When Nelim's Pickle Tools: the interface is shown again
    And Nelim's Pickle Tools: the decor is removed
    And Nelim's Pickle Tools: "Miel" gets back the clothes it had

  Scenario: close shot, the keeper with an ebbb and a beee beside her
    Given I set the hour to 18
    And I set the weather to "Clear"
    And Nelim's Pickle Tools: the colonists are sent to the map corner
    And Nelim's Sanctuary: I am at the sanctuary "calm-zone"
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: all animals are removed
    And Nelim's Pickle Tools: I place the decor "Table2x2c" at (199, 186)
    And Nelim's Pickle Tools: I place the decor "Stool" at (198, 186)
    And Nelim's Pickle Tools: I place the decor "Stool" at (201, 187)
    And Nelim's Pickle Tools: I place the decor "TorchLamp" at (196, 190)
    And Nelim's Pickle Tools: the decor "TorchLamp" at (196, 190) is lit
    And Nelim's Pickle Tools: I place the decor "PlantPot" at (197, 188)
    And Nelim's Pickle Tools: I place the decor "PlantPot" at (203, 190)
    And Nelim's Pickle Tools: I place the decor "Shelf" at (204, 188)
    And Nelim's Pickle Tools: I place the decor "Campfire" at (195, 185)
    And Nelim's Pickle Tools: I let 60 ticks pass
    And a colonist "Miel" exists
    And Nelim's Pickle Tools: "Miel" body type is Female
    And Nelim's Pickle Tools: "Miel" hairstyle is "Flowy"
    And Nelim's Pickle Tools: "Miel" hair colour is rgb (176, 82, 38)
    And Nelim's Pickle Tools: "Miel" wears "Apparel_CollarShirt" dyed rgb (222, 170, 60)
    And Nelim's Pickle Tools: "Miel" wears "Apparel_Pants" dyed rgb (92, 58, 38)
    And Nelim's Pickle Tools: "Miel" stands at (200, 189) facing South
    And Nelim's Pickle Tools: "Miel" facial expression is "SocialRelax"
    And Ebbbs Renew: spawns the player animal "Ebbb1" as "Ebbb" close to the cell 198 189
    And Ebbbs Renew: spawns the player animal "Beee1" as "Beee" close to the cell 202 189
    And Nelim's Pickle Tools: time is paused for the capture
    When Nelim's Pickle Tools: I frame the cell (200, 188) at zoom 4.5
    And Nelim's Pickle Tools: the map is shown alone for a capture
    Then I take a screenshot "Workshop page, the keeper with an ebbb and a beee"
    When Nelim's Pickle Tools: the interface is shown again
    And Nelim's Pickle Tools: the decor is removed
    And Nelim's Pickle Tools: "Miel" gets back the clothes it had

  # A menu: a capture of what it is, nothing staged.
  Scenario: the information card of an ebbb, with Wildness
    Given I set the hour to 12
    And I set the weather to "Clear"
    And Nelim's Pickle Tools: the colonists are sent to the map corner
    And Nelim's Sanctuary: I am at the sanctuary "exhibition-zone"
    And Nelim's Pickle Tools: all animals are removed
    And Ebbbs Renew: spawns the player animal "Ebbb1" as "Ebbb" near the cell 218 166
    When Ebbbs Renew: centres the camera two cells south of "Ebbb1"
    And Ebbbs Renew: opens the information card of "Ebbb1"
    Then Ebbbs Renew: the information card of "Ebbb1" lists the stat "Wildness"
    When Ebbbs Renew: filters the open information card to "wildness"
    And Nelim's Pickle Tools: screenshot mode is enabled around the open windows
    Then I take a screenshot "Workshop page, the information card"
    And Nelim's Pickle Tools: screenshot mode is disabled
    When Ebbbs Renew: closes the information card
