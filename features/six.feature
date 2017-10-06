@six
  Feature: Day 6

    @six1
    Scenario: Assertions
      Given I go to "sample" url
      Then I verify page title is "Sample Page"
      Then I verify page rendered correctly
      When I fill out required fields
      And I submit the page
      Then I verify required fields saved correctly

     @six2
     Scenario: Switching between windows
       Given I go to "sample" url
       And I verify related documents page contains "Document 2"
#       When I fill out required fields
 #      And I submit the page
  #     Then I verify required fields saved correctly
