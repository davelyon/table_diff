Feature: Same tables

  @table
  Scenario: Tables are the same
    Given the following table:
      | Hat   | Cat  | Bat   |
      | Yes   | No   | Maybe |
      | Hello | WUT  | OooO  |
      | Derp  | Herp | Lerp  |
    When I compare it with the following table:
      | Hat   | Cat  | Bat   |
      | Yes   | No   | Maybe |
      | Hello | WUT  | OooO  |
      | Derp  | Herp | Lerp  |
    Then the tables are the same
