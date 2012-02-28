Feature: Comparing tables

  # @table
  # Scenario: Tables are the same
  #   Given the following table:
  #     | Hat   | Cat  | Bat   |
  #     | Yes   | No   | Maybe |
  #     | Hello | WUT  | OooO  |
  #   When I compare it with the following table:
  #     | Hat   | Cat  | Bat   |
  #     | Yes   | No   | Maybe |
  #     | Hello | WUT  | OooO  |
  #   Then the tables are the same

  @table
  Scenario: Actual table has one more row
    Given the following table:
      | Hat   | Cat  | Bat   |
      | Yes   | No   | Maybe |
      | Hello | WUT  | OooO  |
    When I compare it with the following table:
      | Hat   | Cat  | Bat   |
      | Yes   | No   | Maybe |
      | Hello | WUT  | OooO  |
      | Foo   | Bar  | Qux   |
    Then the actual table should have the extra rows
      | Foo   | Bar  | Qux   |

  @table
  Scenario: Expected table has one more row
    Given the following table:
      | Hat   | Cat  | Bat   |
      | Yes   | No   | Maybe |
      | Hello | WUT  | OooO  |
      | Foo   | Bar  | Qux   |
    When I compare it with the following table:
      | Hat   | Cat  | Bat   |
      | Yes   | No   | Maybe |
      | Hello | WUT  | OooO  |
      | Derp  | Herp | Lerp  |
    Then the actual table should be missing the rows
      | Foo   | Bar  | Qux   |
