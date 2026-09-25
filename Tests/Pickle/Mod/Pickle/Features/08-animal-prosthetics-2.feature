# The native support for A Dog Said... Animal Prosthetics 2 (Mod/Patches/AnimalProsthetics2.xml), read in the
# loaded game: each species is offered the surgeries of its category and none of a higher one.
#
# That mod sorts animals into three cumulative lists, ADS_Cat1 (basic replacements), ADS_Cat2 (simple
# prosthetics) and ADS_Cat3 (bionics), and copies them into its real recipes in its own last patch. Adding a
# name to a list after that copy does nothing, so the patch only works if this mod loads first, which
# About.xml declares with loadBefore. The three last scenarios assert the effect, through ThingDef.AllRecipes,
# which is what the health tab reads.
#
# The first scenario asserts the order the pass STAGED, and only that. The staging script writes ModsConfig in
# a fixed order and does not sort by loadBefore: the mods a pass map names load before the mod under test. The
# first run of this pass, with the map naming only A Dog Said 2, loaded it before this mod, and every effect
# scenario failed: the recipes were there, and no species had the peg leg. That is the reason loadBefore
# exists, seen by accident. The map now names this mod's own folder first, so the pass stages the order
# About.xml declares, the one the game's own sorting produces. What the game does with the declaration is the
# game's business and is not tested here, only that the declaration is present (Tests/Validate-Mod.ps1).
#
# One recipe stands for each step up: the peg leg for the basic replacements, the simple prosthetic leg for
# the second category, the bionic leg for the third. The power claw is a fourth, in the "misc" recipe that
# ADS 2 copies from the bionic list, so it has to follow the bionic leg.
#
# Played only in the pass that stages ADS 2 (wsl-deps.avec-ads2.map) and skipped by requirement in every
# other, where it counts as skipped and not as passed. It starts from the main menu: the recipes exist once
# the defs have resolved, so no map is needed.
@requires:SamBucher.ADogSaidAnimalProsthetics2
Feature: the species are offered the surgeries of their A Dog Said 2 category

  Scenario: this mod loads before A Dog Said 2, which is what lets its lists be read
    Given Ebbbs Renew: the game has finished starting
    And the main menu is open
    Then mod "SamBucher.ADogSaidAnimalProsthetics2" is loaded
    And mod "nelim.ebbbsrenew" is loaded
    And mod "nelim.ebbbsrenew" loads before "SamBucher.ADogSaidAnimalProsthetics2"

  Scenario: the two smallest are critters and get the basic replacements only
    Given Ebbbs Renew: the game has finished starting
    And the main menu is open
    Then Ebbbs Renew: the ThingDef "Ebbb" can be operated on with "InstallPegLegAnimal"
    And Ebbbs Renew: the ThingDef "Ebbb" cannot be operated on with "InstallSimpleProstheticLegAnimal"
    And Ebbbs Renew: the ThingDef "Ebbb" cannot be operated on with "InstallBionicLegAnimal"
    And Ebbbs Renew: the ThingDef "Bebbbholder" can be operated on with "InstallPegLegAnimal"
    And Ebbbs Renew: the ThingDef "Bebbbholder" cannot be operated on with "InstallSimpleProstheticLegAnimal"
    And Ebbbs Renew: the ThingDef "Bebbbholder" cannot be operated on with "InstallBionicLegAnimal"

  Scenario: the four trained to Intermediate also get the simple prosthetics
    Given Ebbbs Renew: the game has finished starting
    And the main menu is open
    Then Ebbbs Renew: the ThingDef "Crebbb" can be operated on with "InstallPegLegAnimal"
    And Ebbbs Renew: the ThingDef "Crebbb" can be operated on with "InstallSimpleProstheticLegAnimal"
    And Ebbbs Renew: the ThingDef "Crebbb" cannot be operated on with "InstallBionicLegAnimal"
    And Ebbbs Renew: the ThingDef "Ebbberration" can be operated on with "InstallSimpleProstheticLegAnimal"
    And Ebbbs Renew: the ThingDef "Ebbberration" cannot be operated on with "InstallBionicLegAnimal"
    And Ebbbs Renew: the ThingDef "Drebbbd" can be operated on with "InstallSimpleProstheticLegAnimal"
    And Ebbbs Renew: the ThingDef "Drebbbd" cannot be operated on with "InstallBionicLegAnimal"
    And Ebbbs Renew: the ThingDef "Goliebbb" can be operated on with "InstallSimpleProstheticLegAnimal"
    And Ebbbs Renew: the ThingDef "Goliebbb" cannot be operated on with "InstallBionicLegAnimal"

  Scenario: the three trained to Advanced get the bionics too
    Given Ebbbs Renew: the game has finished starting
    And the main menu is open
    Then Ebbbs Renew: the ThingDef "Beee" can be operated on with "InstallPegLegAnimal"
    And Ebbbs Renew: the ThingDef "Beee" can be operated on with "InstallSimpleProstheticLegAnimal"
    And Ebbbs Renew: the ThingDef "Beee" can be operated on with "InstallBionicLegAnimal"
    And Ebbbs Renew: the ThingDef "Beee" can be operated on with "InstallPowerClawAnimal"
    And Ebbbs Renew: the ThingDef "Ebbbomination" can be operated on with "InstallBionicLegAnimal"
    And Ebbbs Renew: the ThingDef "Ebbbomination" can be operated on with "InstallPowerClawAnimal"
    And Ebbbs Renew: the ThingDef "Thrumebbb" can be operated on with "InstallBionicLegAnimal"
    And Ebbbs Renew: the ThingDef "Thrumebbb" can be operated on with "InstallPowerClawAnimal"
