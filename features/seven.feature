@seven
  Feature: Day 7

    @seven1
    Scenario: Switch to iframe
      Given I go to "sample" url
      When I fill out additional info with "John Doe" and "123-45-67"
      And I "accept" 3rd party agreement
      And I attach the file
      And I fill out required fields
      And I submit the page
      Then I verify required fields saved correctly

      @seven2
      Scenario: Using methods
        Given I go to "sample" url
        And I put phone "1234567" and select gender "male"
        And I fill out address field
        And I sleep "5" seconds