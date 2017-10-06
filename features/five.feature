@five
  Feature: Day five

    @five1
    Scenario: Basic WebDriver function
      Given I open url "http://google.com" and print page details

    @five2
      Scenario: Basic navigation
      Given I go to "yahoo" url
      Then I go back and forward, then refresh the page

    @five3
      Scenario: Resolution changes
      Given I go to "google" url
      And change resolution to phone
      And I maximize the window
      And I set resolution  to "300" "700"

     @five4
     Scenario: Sample page required fields
       Given I go to "sample" url
       When I fill out required fields
       And I fill the rest fields
       And I submit the page
       
       And I wait for 4 sec

