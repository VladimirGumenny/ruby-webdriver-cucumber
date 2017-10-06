@m1
  Feature: m1

    @m11
    Scenario: Sort array
      Given I take an array
      And I sort array


    @m12
    Scenario: Sort array and leave "1" on the places
      Given I take an array
      And I sort array and leave "4" on the places

    @m13
    Scenario: test of "delete" function
      Given I take an array
      And I delete "1" from array
