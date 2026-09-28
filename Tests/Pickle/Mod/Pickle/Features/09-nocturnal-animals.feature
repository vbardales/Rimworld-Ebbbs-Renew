# The native support for [XND] Nocturnal Animals (Continued), read in the loaded game: each species carries the
# body clock decided for it (Mod/Patches/NocturnalAnimals.xml), through that mod's own extension class.
#
# The clocks follow that mod's choices for vanilla animals (rodent-likes and ambushing predators nocturnal,
# grazing herds crepuscular, what fits nothing cathemeral) and each species' description; see BACKLOG.md and the
# comment in the patch. The value is only the default, the player can change it per species in that mod's options,
# and that setting is the mod's own and is not tested here.
#
# The guard is a PatchOperationFindMod on the mod's name, which the game compares with ==. If its author renames
# the mod, the patch silently does nothing and this scenario goes red at its first assertion: that is what the pass
# is for. It also asserts nothing was logged naming the mod's defs, since an extension of a class that does not
# exist logs an XML error at load.
#
# Played only in the pass that stages that mod (wsl-deps.avec-na.map) and skipped by requirement in every other,
# where it counts as skipped and not as passed. It starts from the main menu: extensions exist once the defs have
# resolved, so no map is needed.
@requires:Mlie.XNDNocturnalAnimals
Feature: the species carry the body clock chosen for them in Nocturnal Animals

  Scenario: the nine species carry their clock
    Given Ebbbs Renew: the game has finished starting
    And the main menu is open
    Then mod "Mlie.XNDNocturnalAnimals" is loaded
    And mod "nelim.ebbbs" is loaded
    And Ebbbs Renew: the ThingDef "Ebbb" carries the extension "NocturnalAnimals.ExtendedRaceProperties" whose bodyClock reads "Nocturnal"
    And Ebbbs Renew: the ThingDef "Beee" carries the extension "NocturnalAnimals.ExtendedRaceProperties" whose bodyClock reads "Nocturnal"
    And Ebbbs Renew: the ThingDef "Crebbb" carries the extension "NocturnalAnimals.ExtendedRaceProperties" whose bodyClock reads "Crepuscular"
    And Ebbbs Renew: the ThingDef "Drebbbd" carries the extension "NocturnalAnimals.ExtendedRaceProperties" whose bodyClock reads "Cathemeral"
    And Ebbbs Renew: the ThingDef "Ebbberration" carries the extension "NocturnalAnimals.ExtendedRaceProperties" whose bodyClock reads "Diurnal"
    And Ebbbs Renew: the ThingDef "Ebbbomination" carries the extension "NocturnalAnimals.ExtendedRaceProperties" whose bodyClock reads "Nocturnal"
    And Ebbbs Renew: the ThingDef "Goliebbb" carries the extension "NocturnalAnimals.ExtendedRaceProperties" whose bodyClock reads "Cathemeral"
    And Ebbbs Renew: the ThingDef "Thrumebbb" carries the extension "NocturnalAnimals.ExtendedRaceProperties" whose bodyClock reads "Nocturnal"
    And Ebbbs Renew: the ThingDef "Bebbbholder" carries the extension "NocturnalAnimals.ExtendedRaceProperties" whose bodyClock reads "Cathemeral"

  Scenario: nothing logged while the defs loaded names the patch or the mod
    Given Ebbbs Renew: the game has finished starting
    And the main menu is open
    Then Ebbbs Renew: nothing logged as an error or a warning names "ExtendedRaceProperties"
    And Ebbbs Renew: nothing logged as an error or a warning names "nelim.ebbbs"
