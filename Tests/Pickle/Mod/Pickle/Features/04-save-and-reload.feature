# Tests/MANUAL.md M6: the animals survive a save and a reload. Pickle saves the running game, reloads it and
# the scenario carries on, so what is asserted is that the nine species come back from a save file with
# their defs resolved, and that reading them back logs nothing.
#
# The save Pickle writes holds the mod's own content, which test-colony did not: this is the round trip
# M6 describes, with animals of this mod in it.
#
# @save: test-colony, see 02.
@save
Feature: the species survive a save and a reload

  Scenario: the nine species are still there after a reload
    Given the save "test-colony" is loaded
    When I spawn a "Ebbb" pawn at (140, 155)
    And I spawn a "Beee" pawn at (142, 155)
    And I spawn a "Ebbbomination" pawn at (144, 155)
    And I spawn a "Goliebbb" pawn at (146, 155)
    And I spawn a "Ebbberration" pawn at (148, 155)
    And I spawn a "Drebbbd" pawn at (150, 155)
    And I spawn a "Bebbbholder" pawn at (152, 155)
    And I spawn a "Crebbb" pawn at (154, 155)
    And I spawn a "Thrumebbb" pawn at (156, 155)
    And I save and reload
    Then a "Ebbb" exists
    And a "Beee" exists
    And a "Ebbbomination" exists
    And a "Goliebbb" exists
    And a "Ebbberration" exists
    And a "Drebbbd" exists
    And a "Bebbbholder" exists
    And a "Crebbb" exists
    And a "Thrumebbb" exists
    And no errors were logged
