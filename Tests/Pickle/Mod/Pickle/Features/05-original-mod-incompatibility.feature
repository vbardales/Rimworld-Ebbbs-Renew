# A pass of its own: this file plays only when the original mod (Workshop 2817264755) is staged, with
#
#   Run-PickleWsl.ps1 -Mod EbbbsRenew -DepMap wsl-deps.incompat-original.map `
#     -Filter '05-original-mod-incompatibility'
#
# and is skipped by requirement in every other pass, where it counts as skipped and not as passed.
#
# About.xml declares the two incompatible because they define the same nine defNames. What the game does
# with two defs of one name is read from its own source (Verse.DefDatabase.AddAllInMods) and was seen in a
# running game on 2026-09-25: NOTHING is logged. Only a duplicate inside one mod is an error. The def of
# the mod loaded later silently replaces the one of the mod loaded earlier, and the earlier mod goes on
# listing its own copy. So the symptom asserted here is not a log line but who owns what:
#   - both mods define the species, in their own lists;
#   - the game runs the ThingDef and the PawnKindDef of the later mod, this one, and the original's copy is gone;
#   - the original still writes wildness into RaceProperties, which 1.6 rejects: nine errors at load, which is
#     what this port was made to fix, and the reason to stay away from it.
# It stays green while the incompatibility is still true; if the original stops defining the species, or
# stops loading on 1.6, the scenario goes red, and that is the day the incompatibleWith line can be
# reconsidered.
#
# It starts from the main menu, not from a save: the conflict is settled while the defs load. The tag below
# stops the errors it is about from failing it on their own account.
#
# The packageId Coolie.Ebbbs is the one About.xml names, and it is the one the original's own About.xml declares:
# the item was downloaded into the WSL Workshop cache on 2026-09-25 and the download printed it. The pass
# map stages the original first, so this mod loads after it.
@requires:Coolie.Ebbbs @allow-errors
Feature: the declared incompatibility with the original mod is still true

  Scenario: the two mods define the same species and this one silently wins
    Given Ebbbs Renew: the game has finished starting
    And the main menu is open
    Then mod "Coolie.Ebbbs" is loaded
    And mod "nelim.ebbbsrenew" is loaded
    And Ebbbs Renew: the mod "Coolie.Ebbbs" defines a ThingDef named "Ebbb"
    And Ebbbs Renew: the mod "nelim.ebbbsrenew" defines a ThingDef named "Ebbb"
    And Ebbbs Renew: the mod "Coolie.Ebbbs" defines a PawnKindDef named "Ebbb"
    And Ebbbs Renew: the mod "nelim.ebbbsrenew" defines a PawnKindDef named "Ebbb"
    And Ebbbs Renew: the ThingDef "Ebbb" that the game runs comes from the mod "nelim.ebbbsrenew"
    And Ebbbs Renew: the PawnKindDef "Ebbb" that the game runs comes from the mod "nelim.ebbbsrenew"
    And Ebbbs Renew: the ThingDef "Thrumebbb" that the game runs comes from the mod "nelim.ebbbsrenew"
    And Ebbbs Renew: the PawnKindDef "Thrumebbb" that the game runs comes from the mod "nelim.ebbbsrenew"

  Scenario: the original still writes the wildness that 1.6 rejects
    Given Ebbbs Renew: the game has finished starting
    And the main menu is open
    Then Ebbbs Renew: an error or a warning was logged naming "doesn't correspond to any field in type RaceProperties" and "wildness"
