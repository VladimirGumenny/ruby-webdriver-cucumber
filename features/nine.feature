@nine
  Feature: USPS testing

    @nine1
    Scenario: Calculate price
      Given I go to "usps" url
      When I go to "Calculate a Price" under "Mail & Ship" tab
      And I fill out the country "United Kingdom"
      And I select shape "Postcard"
      And I select quantity "2"
      And I submit the result
      Then I validate that the price is "2.30"

     @nine2
      Scenario: Sample page object
       Given I navigate to sample page
       And I fill out username with "skryabin"
       And I submit my form
       Then I verify email error message

      And I wait for 3 sec
