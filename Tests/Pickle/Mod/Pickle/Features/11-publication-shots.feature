# Images for the Workshop page, on the owner's showcase colony (her ruling of 2026-09-25: the rules of
# Work Studio's PUBLICATION.md, "Workshop screenshots", apply here).
#
#   - The scene is the fixture "nelim-zen-meadow-studio" of PickleTools/ScreenshotStudio, staged only by
#     wsl-deps.studio.map. Every other pass skips this feature.
#   - Run it in English: the Workshop page is English.
#   - The animals stand in the flower glade, around cell 154,98 (the studio's "flowers" preset).
#   - The map shot shows a game window the mod changes: the whole interface, uncropped, screenshot mode off.
#     The information card is this mod's own window in front of the interface: screenshot mode hides the HUD
#     around it, the pattern of DalmatiansRenew's 07-publication-shots. The runner starts the game
#     with developer mode on: it is turned off for the map capture.
#   - A capture on the map aims at the glade, never at the black tiles.
#   - The mouse at the screen centre would draw a tooltip over the picture: the pointer is moved to bare
#     grass before the capture.
#   - Each image is opened and looked at before it is called ready; its composition is the owner's call
#     (the spacing of the row and the zoom below are a first guess, to be judged on the capture).
#   - Not here: the A Dog Said 2 recipe (image 3) and the Nocturnal Animals clock (image 4) need other maps
#     and other passes; no scenario is written for them yet.
#   - The thrumebbb with its horn is not a scenario of its own: no step frames one animal yet.
#
# Raw captures land outside the committed gallery and the finished images are copied into
# Art/Gallery/ numbered 1-, 2-; 0-preview.png is already there.
@review @requires:nelim.pickletools.screenshotmode @requires:nelim.pickletools.screenshotstudio
Feature: images for the Workshop page

  Background:
    Given the save "nelim-zen-meadow-studio" is loaded
    And game speed is paused

  Scenario: the nine species together in the flower glade
    Given Ebbbs Renew: the nine species stand in a row along the cell 154 98 with 3 cells between them
    When Ebbbs Renew: the camera frames the row of nine
    And Nelim's Pickle Tools: I move the mouse to (960, 1000)
    And Nelim's Pickle Tools: developer mode is turned off for the capture
    Then I take a screenshot "Workshop page, the nine species"

  Scenario: the information card of an ebbb, with Wildness
    Given Ebbbs Renew: spawns the player animal "Ebbb1" as "Ebbb" near the cell 154 98
    When Ebbbs Renew: centres the camera two cells south of "Ebbb1"
    And Ebbbs Renew: opens the information card of "Ebbb1"
    Then Ebbbs Renew: the information card of "Ebbb1" lists the stat "Wildness"
    When Ebbbs Renew: filters the open information card to "wildness"
    And Nelim's Pickle Tools: screenshot mode is enabled around the open windows
    Then I take a screenshot "Workshop page, the information card"
    And Nelim's Pickle Tools: screenshot mode is disabled
