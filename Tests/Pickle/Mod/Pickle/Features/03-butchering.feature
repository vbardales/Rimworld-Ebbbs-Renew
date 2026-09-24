# Tests/MANUAL.md M5, the part a game has to answer: what butchering each species leaves. The step
# (Source/EbbbsSteps.cs) generates an adult of the kind on the loaded map, kills it and asks the game for
# its butcher products, at an efficiency high enough that a small animal's fractional yield cannot round to
# nothing. So what is asserted is the wiring, that the meat, the leather and the horn belong to the species,
# and not how much of each a colonist would get.
#
# Three scenarios and not one per species: each starts from a reloaded map, and a reload is the slow part.
# The horn is its own scenario because it is not meat or leather: it comes from the body part group of the
# thrumebbb's adult life stage (Pawn.ButcherProducts, race.butcherBodyPart) and is produced once.
#
# Every species but the ebbb reuses the ebbb's meat (useMeatFrom), so Meat_Ebbb is the expectation for all
# nine. The generated meat def is named after the race it comes from.
#
# @save: test-colony, see 02.
@save
Feature: butchering leaves what the species are defined to leave

  Scenario: every species leaves ebbb meat
    Given the save "test-colony" is loaded
    Then Ebbbs Renew: butchering an adult "Ebbb" leaves "Meat_Ebbb"
    And Ebbbs Renew: butchering an adult "Beee" leaves "Meat_Ebbb"
    And Ebbbs Renew: butchering an adult "Ebbbomination" leaves "Meat_Ebbb"
    And Ebbbs Renew: butchering an adult "Goliebbb" leaves "Meat_Ebbb"
    And Ebbbs Renew: butchering an adult "Ebbberration" leaves "Meat_Ebbb"
    And Ebbbs Renew: butchering an adult "Drebbbd" leaves "Meat_Ebbb"
    And Ebbbs Renew: butchering an adult "Bebbbholder" leaves "Meat_Ebbb"
    And Ebbbs Renew: butchering an adult "Crebbb" leaves "Meat_Ebbb"
    And Ebbbs Renew: butchering an adult "Thrumebbb" leaves "Meat_Ebbb"

  Scenario: every species leaves ebbb leather
    Given the save "test-colony" is loaded
    Then Ebbbs Renew: butchering an adult "Ebbb" leaves "Leather_Ebbb"
    And Ebbbs Renew: butchering an adult "Beee" leaves "Leather_Ebbb"
    And Ebbbs Renew: butchering an adult "Ebbbomination" leaves "Leather_Ebbb"
    And Ebbbs Renew: butchering an adult "Goliebbb" leaves "Leather_Ebbb"
    And Ebbbs Renew: butchering an adult "Ebbberration" leaves "Leather_Ebbb"
    And Ebbbs Renew: butchering an adult "Drebbbd" leaves "Leather_Ebbb"
    And Ebbbs Renew: butchering an adult "Bebbbholder" leaves "Leather_Ebbb"
    And Ebbbs Renew: butchering an adult "Crebbb" leaves "Leather_Ebbb"
    And Ebbbs Renew: butchering an adult "Thrumebbb" leaves "Leather_Ebbb"

  Scenario: the thrumebbb leaves its horn
    Given the save "test-colony" is loaded
    Then Ebbbs Renew: butchering an adult "Thrumebbb" leaves "ThrumebbbHorn"
    And no errors were logged
