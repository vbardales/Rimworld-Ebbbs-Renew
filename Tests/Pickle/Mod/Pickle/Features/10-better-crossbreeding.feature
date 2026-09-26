# The native support for Better Crossbreeding, read in the loaded game (Mod/Patches/BetterCrossbreeding.xml): four
# pairs among the nine species, each written for both mothers, and what each pairing gives.
#
# Two things are read, in two places. canCrossBreedWith is a vanilla 1.6 field of the ThingDef's race. What the
# offspring is comes from that mod's extension on the mother's PawnKindDef: its outcomes are named after the father,
# and say Maternal, Paternal, Random or Other, with weights for Other. The pairs are inside the family only:
# ebbb with crebbb, ebbb with bebbbholder and crebbb with ebbberration, a coin flip per child, and ebbb with
# drebbbd, three ebbbs to one drebbbd. The beee (the ebbbs' predator), the ebbbomination, the thrumebbb and the
# goliebbb are paired with nothing, and the last scenario says so.
#
# The guard is a PatchOperationFindMod on the mod's name ("Better Crossbreeding"), which the game compares with ==.
# If its author renames it, the patch silently does nothing and this feature goes red at its first assertion.
# Without the mod the species are not given canCrossBreedWith at all, which the passes that do not stage it show
# through the offline check of the guard and through "nothing logged" in feature 01.
#
# What is NOT tested: an actual breeding, which needs a pair of animals of both sexes, a long mating delay and
# the mod's own Harmony patches running in a colony. The mod's arithmetic on the outcomes is that mod's.
#
# Played only in the pass that stages that mod (wsl-deps.avec-crossbreeding.map) and skipped by requirement in
# every other. It starts from the main menu.
@requires:DizzyEevee.BetterCrossbreeding
Feature: four pairs of species can crossbreed with Better Crossbreeding

  Scenario: the four pairs are compatible in both directions
    Given Ebbbs Renew: the game has finished starting
    And the main menu is open
    Then mod "DizzyEevee.BetterCrossbreeding" is loaded
    And mod "nelim.ebbbsrenew" is loaded
    And Ebbbs Renew: the ThingDef "Ebbb" can cross with "Crebbb"
    And Ebbbs Renew: the ThingDef "Crebbb" can cross with "Ebbb"
    And Ebbbs Renew: the ThingDef "Ebbb" can cross with "Bebbbholder"
    And Ebbbs Renew: the ThingDef "Bebbbholder" can cross with "Ebbb"
    And Ebbbs Renew: the ThingDef "Crebbb" can cross with "Ebbberration"
    And Ebbbs Renew: the ThingDef "Ebbberration" can cross with "Crebbb"
    And Ebbbs Renew: the ThingDef "Ebbb" can cross with "Drebbbd"
    And Ebbbs Renew: the ThingDef "Drebbbd" can cross with "Ebbb"

  Scenario: what each pairing gives, by mother
    Given Ebbbs Renew: the game has finished starting
    And the main menu is open
    Then Ebbbs Renew: the PawnKindDef "Ebbb" bred with "Crebbb" gives "Random"
    And Ebbbs Renew: the PawnKindDef "Crebbb" bred with "Ebbb" gives "Random"
    And Ebbbs Renew: the PawnKindDef "Ebbb" bred with "Bebbbholder" gives "Random"
    And Ebbbs Renew: the PawnKindDef "Bebbbholder" bred with "Ebbb" gives "Random"
    And Ebbbs Renew: the PawnKindDef "Crebbb" bred with "Ebbberration" gives "Random"
    And Ebbbs Renew: the PawnKindDef "Ebbberration" bred with "Crebbb" gives "Random"
    And Ebbbs Renew: the PawnKindDef "Ebbb" bred with "Drebbbd" gives "Other Ebbb=3 Drebbbd=1"
    And Ebbbs Renew: the PawnKindDef "Drebbbd" bred with "Ebbb" gives "Other Ebbb=3 Drebbbd=1"

  Scenario: the predator, the amalgams and the colossus are paired with nothing
    Given Ebbbs Renew: the game has finished starting
    And the main menu is open
    Then Ebbbs Renew: the ThingDef "Beee" cannot cross with "Ebbb"
    And Ebbbs Renew: the ThingDef "Ebbb" cannot cross with "Beee"
    And Ebbbs Renew: the ThingDef "Ebbbomination" cannot cross with "Ebbb"
    And Ebbbs Renew: the ThingDef "Thrumebbb" cannot cross with "Ebbb"
    And Ebbbs Renew: the ThingDef "Goliebbb" cannot cross with "Ebbb"
    And Ebbbs Renew: the ThingDef "Ebbb" cannot cross with "Goliebbb"

  Scenario: nothing logged while the defs loaded names the patch or the mod
    Given Ebbbs Renew: the game has finished starting
    And the main menu is open
    Then Ebbbs Renew: nothing logged as an error or a warning names "CrossBreeding.Extension"
    And Ebbbs Renew: nothing logged as an error or a warning names "nelim.ebbbsrenew"
