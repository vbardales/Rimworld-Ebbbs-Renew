# Images for the Workshop page, played in Nelim's Sanctuary Backlot (GALLERY.md).
#
# Every gallery capture is a staged photograph, the menus excepted. One story for the series, one common
# place, and for each image a subject whose every detail suits what it shows.
#
# THE STORY: "Milk night in the clearing". The ebbbs like cheese, and cheese starts as milk. At the end of the
# afternoon Nelim, the protagonist (owner rule 2026-10-14), carries the evening's milk to her nine goo animals
# in the cream clearing of the Sanctuary (`calm-zone`, a bare 11 x 9 square ringed with flowers). Two guests
# share the little table with her, a lamp and a fire are lit, and the evening goes from golden dusk to night.
# Dressing: warm, saturated cloth against creatures that are black goo, so that the creatures are what the eye
# lands on. Nelim keeps her own hair, face and eyes (they are the fixture's identity); she wears a mustard
# collar shirt, brown trousers and a deep-red knitted cap. Her guests are dressed for the same table: Tomi
# (afro, teal shirt, sand trousers) and Sori (bob, plum shirt, grey trousers). All smile calmly (SocialRelax).
#   1. 17h, golden dusk. Wide shot, tightened after the owner's review of 2026-10-17 (frame 21 x 12 cells on (200, 186),
#      half circle of radius 3 cells, so that the nine really gather round the table and Nelim is not tiny): Nelim at the table with the jug, her guests on the stools, the nine species
#      arriving in a half circle, all facing the camera (the whole content of the mod).
#   2. 18h, the lamp and the fire lit, the thrumebbb (the star of the mod, drawn 4.8 cells wide) arrives.
#      Portrait: Nelim with the thrumebbb seen from the front, a jug in her hands.
#   3. 19h, the lamp and the fire lit. Close shot: Nelim with an ebbb and a beee
#      beside her, a jug in her hands (the gentle side of the goo).
#   4. 20h, night. The ebbb family: one ebbb as a baby, a juvenile and an adult side by side with a crebbb
#      behind them, Nelim watching (the ages and the colour variants of the ebbb).
#   5. A MENU: the information card of an ebbb showing Wildness, a plain capture on the full-screen-window
#      backdrop `window-backdrop-for-height`, cropped on the sides (GALLERY.md).
#
#   - Pass: wsl-deps.sanctuary.map, English. Every other pass skips this feature.
#   - There is no cheese mod loaded: the only dairy the game has is Milk, which is what Nelim carries.
#   - The clearing is x 195-205, z 183-191. The keeper stands at (200, 189) facing South; the table is south of
#     her, the guests on the stools, the lamp, the pots and the shelf at the sides, the fire south-west.
#   - Not here: the A Dog Said 2 recipe and the Nocturnal Animals clock need other maps and other passes.
#
# SHOTLIST ESTIMATE (owner rule 2026-10-18: every scene at 4 or more before it is played). Score 1 to 5 after rework; risk = what could still hold it back.
#   1 wide 17h, score 4 (was 2 on the first capture, redone): nine may not all face the camera or stay in the half circle; Nelim larger after the tighter frame. Verdict after run: pending.
#   2 portrait 18h, score 4 (was 3: zoom 5.5 on a 4.8-cell animal could crop it; now zoom 4.5): thrumebbb may turn away; Nelim hidden by its bulk. Verdict: pending.
#   3 close 19h, score 4 (capture 2-keeper-ebbb-beee accepted by owner 2026-10-17): ebbb and beee may not face front. Verdict: accepted earlier.
#   4 family 20h, score 4 (was 3: a merged line dropped the spawn step, night too dark; fixed, second lamp added): life-stage local step unproven in a run; crebbb may hide behind the three. Verdict: pending.
#   5 card, score 4 (old capture scored 3, taken on exhibition-zone; retake on window-backdrop-for-height): crop width. Verdict: pending.
#
# Raw captures land outside the committed gallery; the finished images go to Art/Gallery/ numbered 1- to 5- (subtitles on 1 to 4, none on the card).
@review @requires:nelim.sanctuarybacklot @requires:nelim.pickletools.screenshotmode @requires:nelim.pickletools.screenshotstudio @requires:nelim.pickletools.colonistrace @requires:nelim.pickletools.stagedecor @requires:nelim.pickletools.camerazoom @requires:nelim.pickletools.clearscreen
Feature: images for the Workshop page

  Background:
    Given the save "Nelims-tribe" is loaded

  Scenario: wide shot, Nelim at her table with her guests and the nine species gathered round her
    Given I set the hour to 17
    And I set the weather to "Clear"
    And Nelim's Pickle Tools: the colonists are sent to the map corner
    And Nelim's Sanctuary: I am at the sanctuary "calm-zone"
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: all animals are removed
    And Nelim's Pickle Tools: I place the decor "Table2x2c" at (199, 186)
    And Nelim's Pickle Tools: I place the decor "Stool" at (198, 186)
    And Nelim's Pickle Tools: I place the decor "Stool" at (201, 187)
    And Nelim's Pickle Tools: I place the decor "Milk" at (199, 187)
    And Nelim's Pickle Tools: I place the decor "TorchLamp" at (196, 190)
    And Nelim's Pickle Tools: the decor "TorchLamp" at (196, 190) is lit
    And Nelim's Pickle Tools: I place the decor "PlantPot" at (197, 188)
    And Nelim's Pickle Tools: I place the decor "PlantPot" at (203, 190)
    And Nelim's Pickle Tools: I place the decor "Shelf" at (204, 188)
    And Nelim's Pickle Tools: I place the decor "Campfire" at (195, 185)
    And Nelim's Pickle Tools: the decor "Campfire" at (195, 185) is lit
    And Nelim's Pickle Tools: I let 60 ticks pass
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_CollarShirt" dyed rgb (222, 170, 60)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Pants" dyed rgb (92, 58, 38)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Tuque" dyed rgb (140, 30, 40)
    And Nelim's Pickle Tools: "Nelim" stands at (200, 189) facing South
    And Nelim's Sanctuary: Nelim has her own face
    And Nelim's Pickle Tools: "Nelim" facial expression is "SocialRelax"
    And Nelim's Pickle Tools: "Nelim" carries the item "Milk"
    And a colonist "Tomi" exists
    And Nelim's Pickle Tools: "Tomi" body type is Male
    And Nelim's Pickle Tools: "Tomi" hairstyle is "Afro"
    And Nelim's Pickle Tools: "Tomi" hair colour is rgb (40, 28, 24)
    And Nelim's Pickle Tools: "Tomi" wears "Apparel_CollarShirt" dyed rgb (40, 130, 140)
    And Nelim's Pickle Tools: "Tomi" wears "Apparel_Pants" dyed rgb (200, 175, 120)
    And Nelim's Pickle Tools: "Tomi" stands at (198, 186) facing East
    And Nelim's Pickle Tools: "Tomi" facial expression is "SocialRelax"
    And a colonist "Sori" exists
    And Nelim's Pickle Tools: "Sori" body type is Female
    And Nelim's Pickle Tools: "Sori" hairstyle is "Bob"
    And Nelim's Pickle Tools: "Sori" hair colour is rgb (120, 70, 40)
    And Nelim's Pickle Tools: "Sori" wears "Apparel_CollarShirt" dyed rgb (110, 40, 90)
    And Nelim's Pickle Tools: "Sori" wears "Apparel_Pants" dyed rgb (110, 110, 115)
    And Nelim's Pickle Tools: "Sori" stands at (201, 187) facing West
    And Nelim's Pickle Tools: "Sori" facial expression is "SocialRelax"
    And Ebbbs Renew: the nine species gather in a half circle south of the cell 199 186 at 3 cells
    And Nelim's Pickle Tools: time is paused for the capture
    When Nelim's Pickle Tools: I frame the cell (200, 186) at zoom 6
    And Nelim's Pickle Tools: the map is shown alone for a capture
    Then I take a screenshot "Workshop page, Nelim and the nine species"
    When Nelim's Pickle Tools: the interface is shown again
    And Nelim's Pickle Tools: the decor is removed
    And Nelim's Pickle Tools: "Nelim" gets back the clothes it had

  Scenario: portrait, Nelim and the thrumebbb
    Given I set the hour to 18
    And I set the weather to "Clear"
    And Nelim's Pickle Tools: the colonists are sent to the map corner
    And Nelim's Sanctuary: I am at the sanctuary "calm-zone"
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: all animals are removed
    And Nelim's Pickle Tools: I place the decor "TorchLamp" at (196, 190)
    And Nelim's Pickle Tools: the decor "TorchLamp" at (196, 190) is lit
    And Nelim's Pickle Tools: I place the decor "TorchLamp" at (204, 190)
    And Nelim's Pickle Tools: the decor "TorchLamp" at (204, 190) is lit
    And Nelim's Pickle Tools: I place the decor "PlantPot" at (197, 187)
    And Nelim's Pickle Tools: I place the decor "PlantPot" at (203, 187)
    And Nelim's Pickle Tools: I place the decor "Campfire" at (195, 185)
    And Nelim's Pickle Tools: the decor "Campfire" at (195, 185) is lit
    And Nelim's Pickle Tools: I let 60 ticks pass
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_CollarShirt" dyed rgb (222, 170, 60)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Pants" dyed rgb (92, 58, 38)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Tuque" dyed rgb (140, 30, 40)
    And Nelim's Pickle Tools: "Nelim" stands at (200, 189) facing South
    And Nelim's Sanctuary: Nelim has her own face
    And Nelim's Pickle Tools: "Nelim" facial expression is "SocialRelax"
    And Nelim's Pickle Tools: "Nelim" carries the item "Milk"
    And Ebbbs Renew: spawns the player animal "Thrumebbb1" as "Thrumebbb" close to the cell 200 185
    And Nelim's Pickle Tools: time is paused for the capture
    When Nelim's Pickle Tools: I frame the cell (200, 187) at zoom 4.5
    And Nelim's Pickle Tools: the map is shown alone for a capture
    Then I take a screenshot "Workshop page, Nelim and the thrumebbb"
    When Nelim's Pickle Tools: the interface is shown again
    And Nelim's Pickle Tools: the decor is removed
    And Nelim's Pickle Tools: "Nelim" gets back the clothes it had

  Scenario: close shot, Nelim with an ebbb and a beee beside her
    Given I set the hour to 19
    And I set the weather to "Clear"
    And Nelim's Pickle Tools: the colonists are sent to the map corner
    And Nelim's Sanctuary: I am at the sanctuary "calm-zone"
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: all animals are removed
    And Nelim's Pickle Tools: I place the decor "Table2x2c" at (199, 186)
    And Nelim's Pickle Tools: I place the decor "Stool" at (198, 186)
    And Nelim's Pickle Tools: I place the decor "Stool" at (201, 187)
    And Nelim's Pickle Tools: I place the decor "Milk" at (199, 187)
    And Nelim's Pickle Tools: I place the decor "TorchLamp" at (196, 190)
    And Nelim's Pickle Tools: the decor "TorchLamp" at (196, 190) is lit
    And Nelim's Pickle Tools: I place the decor "PlantPot" at (197, 188)
    And Nelim's Pickle Tools: I place the decor "PlantPot" at (203, 190)
    And Nelim's Pickle Tools: I place the decor "Shelf" at (204, 188)
    And Nelim's Pickle Tools: I place the decor "Campfire" at (195, 185)
    And Nelim's Pickle Tools: the decor "Campfire" at (195, 185) is lit
    And Nelim's Pickle Tools: I let 60 ticks pass
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_CollarShirt" dyed rgb (222, 170, 60)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Pants" dyed rgb (92, 58, 38)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Tuque" dyed rgb (140, 30, 40)
    And Nelim's Pickle Tools: "Nelim" stands at (200, 189) facing South
    And Nelim's Sanctuary: Nelim has her own face
    And Nelim's Pickle Tools: "Nelim" facial expression is "SocialRelax"
    And Nelim's Pickle Tools: "Nelim" carries the item "Milk"
    And Ebbbs Renew: spawns the player animal "Ebbb1" as "Ebbb" close to the cell 198 189
    And Ebbbs Renew: spawns the player animal "Beee1" as "Beee" close to the cell 202 189
    And Nelim's Pickle Tools: time is paused for the capture
    When Nelim's Pickle Tools: I frame the cell (200, 188) at zoom 4.5
    And Nelim's Pickle Tools: the map is shown alone for a capture
    Then I take a screenshot "Workshop page, Nelim with an ebbb and a beee"
    When Nelim's Pickle Tools: the interface is shown again
    And Nelim's Pickle Tools: the decor is removed
    And Nelim's Pickle Tools: "Nelim" gets back the clothes it had

  Scenario: the ebbb family, three ages side by side
    Given I set the hour to 20
    And I set the weather to "Clear"
    And Nelim's Pickle Tools: the colonists are sent to the map corner
    And Nelim's Sanctuary: I am at the sanctuary "calm-zone"
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: all animals are removed
    And Nelim's Pickle Tools: I place the decor "TorchLamp" at (196, 190)
    And Nelim's Pickle Tools: the decor "TorchLamp" at (196, 190) is lit
    And Nelim's Pickle Tools: I place the decor "PlantPot" at (197, 187)
    And Nelim's Pickle Tools: I place the decor "PlantPot" at (203, 187)
    And Nelim's Pickle Tools: I place the decor "Campfire" at (204, 185)
    And Nelim's Pickle Tools: the decor "Campfire" at (204, 185) is lit
    And Nelim's Pickle Tools: I place the decor "TorchLamp" at (204, 190)
    And Nelim's Pickle Tools: the decor "TorchLamp" at (204, 190) is lit
    And Nelim's Pickle Tools: I let 60 ticks pass
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_CollarShirt" dyed rgb (222, 170, 60)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Pants" dyed rgb (92, 58, 38)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Tuque" dyed rgb (140, 30, 40)
    And Nelim's Pickle Tools: "Nelim" stands at (200, 189) facing South
    And Nelim's Sanctuary: Nelim has her own face
    And Nelim's Pickle Tools: "Nelim" facial expression is "SocialRelax"
    And Ebbbs Renew: spawns the player animal "EbbbBaby" as "Ebbb" at life stage 0 close to the cell 198 187
    And Ebbbs Renew: spawns the player animal "EbbbJuvenile" as "Ebbb" at life stage 1 close to the cell 200 187
    And Ebbbs Renew: spawns the player animal "EbbbAdult" as "Ebbb" at life stage 2 close to the cell 202 187
    And Ebbbs Renew: spawns the player animal "Crebbb1" as "Crebbb" close to the cell 200 184
    And Nelim's Pickle Tools: time is paused for the capture
    When Nelim's Pickle Tools: I frame the cell (200, 187) at zoom 4.5
    And Nelim's Pickle Tools: the map is shown alone for a capture
    Then I take a screenshot "Workshop page, the ebbb family"
    When Nelim's Pickle Tools: the interface is shown again
    And Nelim's Pickle Tools: the decor is removed
    And Nelim's Pickle Tools: "Nelim" gets back the clothes it had

  # A menu: a capture of what it is, nothing staged.
  Scenario: the information card of an ebbb, with Wildness
    Given I set the hour to 12
    And I set the weather to "Clear"
    And Nelim's Pickle Tools: the colonists are sent to the map corner
    And Nelim's Sanctuary: I am at the sanctuary "window-backdrop-for-height"
    And Nelim's Pickle Tools: all animals are removed
    And Ebbbs Renew: spawns the player animal "Ebbb1" as "Ebbb" near the cell 90 140
    When Ebbbs Renew: centres the camera two cells south of "Ebbb1"
    And Ebbbs Renew: opens the information card of "Ebbb1"
    Then Ebbbs Renew: the information card of "Ebbb1" lists the stat "Wildness"
    When Ebbbs Renew: filters the open information card to "wildness"
    And Nelim's Pickle Tools: screenshot mode is enabled around the open windows
    Then I take a screenshot "Workshop page, the information card"
    And Nelim's Pickle Tools: screenshot mode is disabled
    When Ebbbs Renew: closes the information card
