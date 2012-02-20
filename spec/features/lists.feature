Feature: Comparable lists

  Scenario: Same lists
    Given the following list:
      | Lorem |
      | Ipsum |
      | Dolor |
    When I compare it to the following list:
      | Lorem |
      | Ipsum |
      | Dolor |
    Then the lists are the same
