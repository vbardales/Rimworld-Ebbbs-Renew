# The loaded-game half of what Tests/MANUAL.md M1 and M3 ask a person to read from Player.log and from the
# information cards.
#
# No save is loaded, on purpose. The errors this mod can produce are logged while the defs load, before any
# scenario is armed, and Pickle's own "no errors were logged" only sees what is logged after it is armed, so
# it would pass on a mod that failed to load. These scenarios read RimWorld's own log instead, through this
# suite's local steps (Source/EbbbsSteps.cs), and they need no map.
#
# Every species is a ThingDef AND a PawnKindDef of the same name. Pickle's "def X field Y is Z" and
# "def X raw stat Y is Z" throw on a name held by two def databases, so the values are read by this suite's
# own steps, which name the def type.
#
# Played in every pass but the incompatibility one, where two mods define the same defs on purpose.
Feature: the mod loads clean and defines its nine species

  Scenario: the mod is loaded and its defs exist
    Given Ebbbs Renew: the game has finished starting
    And the main menu is open
    Then mod "nelim.ebbbsrenew" is loaded
    And def "Ebbb" of type "ThingDef" exists
    And def "Beee" of type "ThingDef" exists
    And def "Ebbbomination" of type "ThingDef" exists
    And def "Goliebbb" of type "ThingDef" exists
    And def "Ebbberration" of type "ThingDef" exists
    And def "Drebbbd" of type "ThingDef" exists
    And def "Bebbbholder" of type "ThingDef" exists
    And def "Crebbb" of type "ThingDef" exists
    And def "Thrumebbb" of type "ThingDef" exists
    And def "Ebbb" of type "PawnKindDef" exists
    And def "Beee" of type "PawnKindDef" exists
    And def "Ebbbomination" of type "PawnKindDef" exists
    And def "Goliebbb" of type "PawnKindDef" exists
    And def "Ebbberration" of type "PawnKindDef" exists
    And def "Drebbbd" of type "PawnKindDef" exists
    And def "Bebbbholder" of type "PawnKindDef" exists
    And def "Crebbb" of type "PawnKindDef" exists
    And def "Thrumebbb" of type "PawnKindDef" exists
    And def "Leather_Ebbb" of type "ThingDef" exists
    And def "ThrumebbbHorn" of type "ThingDef" exists
    And def "Filth_BloodEbbb" of type "ThingDef" exists
    And def "Ebbbish" of type "FleshTypeDef" exists
    And def "Damage_HitEbbb" of type "EffecterDef" exists
    And def "Ebbb" of type "BodyDef" exists
    And def "Ebbbomination" of type "BodyDef" exists
    And def "Ebbberration" of type "BodyDef" exists
    And def "Bebbbholder" of type "BodyDef" exists
    And def "Crebbb" of type "BodyDef" exists

  # "ebbb" is a substring of every name this mod owns but one, the beee, so two searches cover the lot: the
  # species, their body plans, the blood, the leather, the horn, the flesh type and the effecter. A missing
  # texture, an unresolved reference or a def that failed to load is logged naming one of them. In the French
  # pass this is also where a translation key the game cannot resolve would show up.
  Scenario: nothing logged while the defs loaded names one of them
    Given Ebbbs Renew: the game has finished starting
    And the main menu is open
    Then Ebbbs Renew: nothing logged as an error or a warning names "ebbb"
    And Ebbbs Renew: nothing logged as an error or a warning names "beee"

  Scenario: the mod's own identifier appears in no error or warning
    Given Ebbbs Renew: the game has finished starting
    And the main menu is open
    Then Ebbbs Renew: nothing logged as an error or a warning names "nelim.ebbbsrenew"
    And no warnings from mod "nelim.ebbbsrenew"

  # The one defect this port exists to fix, in its loaded form. wildness stopped being a field of
  # RaceProperties in 1.6 and became a stat under statBases. The old form is not an error: nothing reads it,
  # the stat falls back to its default of -1, and every species tames for almost nothing while looking
  # normal. This asserts the statBases entry the game loaded, and the step fails on a missing entry instead of
  # comparing the default. The values are the ones Tests/Validate-Mod.ps1 checks in the XML; what only the
  # game can say is that it read them. The taming success rate itself is the engine's arithmetic and is not
  # asserted here, see TESTING.md.
  Scenario: every species carries the wildness the game loaded
    Given Ebbbs Renew: the game has finished starting
    And the main menu is open
    Then Ebbbs Renew: the ThingDef "Ebbb" has the stat "Wildness" at 0.7
    And Ebbbs Renew: the ThingDef "Beee" has the stat "Wildness" at 0.8
    And Ebbbs Renew: the ThingDef "Ebbbomination" has the stat "Wildness" at 1
    And Ebbbs Renew: the ThingDef "Goliebbb" has the stat "Wildness" at 1
    And Ebbbs Renew: the ThingDef "Ebbberration" has the stat "Wildness" at 0.4
    And Ebbbs Renew: the ThingDef "Drebbbd" has the stat "Wildness" at 1
    And Ebbbs Renew: the ThingDef "Bebbbholder" has the stat "Wildness" at 0.7
    And Ebbbs Renew: the ThingDef "Crebbb" has the stat "Wildness" at 0.2
    And Ebbbs Renew: the ThingDef "Thrumebbb" has the stat "Wildness" at 1
