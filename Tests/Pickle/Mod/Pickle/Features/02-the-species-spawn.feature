# Tests/MANUAL.md M2, in a loaded map: each of the nine species is generated and stands on it, and
# generating them logs nothing. Generating a pawn resolves its graphics for the life stage, its body and its
# race, which is where a missing texture or a broken body plan shows up as an error.
#
# @save: it loads test-colony, a save written without this mod. Loading it with the mod active is also what
# adding the mod to an existing save looks like, which M6 asks for. The cells are the row z = 155 that the
# other suites of this collection already use on the same fixture; whether each is free is not known, and
# Pickle's spawn step places the pawn exactly there.
#
# Pickle's spawn step refers to the pawn by kind. The kind's defName is the species name.
@save
Feature: the nine species spawn on a map

  Scenario: each species can be generated and stands on the map
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

  # A capture for a person to look at: Pickle's green says the steps ran, not that no texture is pink or that
  # the goliebbb is not sitting on a wall. The state is asserted before the capture is taken.
  @review
  Scenario: the nine together, for a person to look at
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
    Then a "Thrumebbb" exists
    When I move the camera to (148, 155)
    And I take a screenshot "ebbbs-nine"
    Then no errors were logged
