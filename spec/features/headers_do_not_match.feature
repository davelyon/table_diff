Feature: Headers do not match

  @table
  Scenario: Headers do not match
    Given the following table:
      | Rat   | Cat  | Bat   |
      | Yes   | No   | Maybe |
    When I compare it with the following table:
      | Hat   | Cat  | Bat   |
      | Yes   | No   | Maybe |
    Then a different headers error is raised
