# TEMPORARY. Not part of the suite: it exists to make the game print its load order. Pickle's "mod X is loaded"
# names every loaded mod in its failure message, and the first passes with Nocturnal Animals and Better
# Crossbreeding skipped their scenarios as "not loaded" with nothing in Player.log to say what was loaded instead.
# Delete this file once the cause is known.
Feature: diagnostic, what the game loaded

  Scenario: the load order is printed by a failure
    Given Ebbbs Renew: the game has finished starting
    And the main menu is open
    Then mod "Mlie.XNDNocturnalAnimals" is loaded