# A pass of its own: this file plays only when the original mod (Workshop 2817264755) is staged, with
#
#   Run-PickleWsl.ps1 -Mod EbbbsRenew -DepMap wsl-deps.incompat-original.map `
#     -Filter '05-original-mod-incompatibility'
#
# and is skipped by requirement in every other pass, where it counts as skipped and not as passed.
#
# About.xml declares the two incompatible because they define the same nine defNames. What the game does
# with two defs of one name is read from its own source (Verse.DefDatabase.Add): it logs an ERROR,
# "Adding duplicate <type> name: <defName>", and renames the later def by appending a random number to its
# defName, so both survive under different names. That is the symptom asserted, for the ThingDef and for
# the PawnKindDef. It stays green while the incompatibility is still true; if the original stops defining
# the species, or stops loading on 1.6, the scenario goes red, and that is the day the incompatibleWith
# line can be reconsidered.
#
# The XML comment above <incompatibleWith> in Mod/About/About.xml used to say the game "logs nothing" on a
# duplicate. The game's source says otherwise, the comment was corrected on 2026-09-24, and this scenario is
# what settles it in a running game.
#
# It starts from the main menu, not from a save: the conflict is settled while the defs load, and a save
# that failed to load because of it would end the scenario before it could show the symptom. The tag below
# stops the errors it is about from failing it on their own account.
#
# The packageId Coolie.Ebbbs is the one About.xml names, and it is the one the original's own About.xml declares:
# the item was downloaded into the WSL Workshop cache on 2026-09-25 and the download printed it.
@requires:Coolie.Ebbbs @allow-errors
Feature: the declared incompatibility with the original mod is still true

  Scenario: the two mods define the same species and the game logs the duplicates
    Given the main menu is open
    Then mod "Coolie.Ebbbs" is loaded
    And mod "nelim.ebbbsrenew" is loaded
    And Ebbbs Renew: an error or a warning was logged naming "Adding duplicate ThingDef" and "Ebbb"
    And Ebbbs Renew: an error or a warning was logged naming "Adding duplicate PawnKindDef" and "Ebbb"
