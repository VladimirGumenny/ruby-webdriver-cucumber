@eight
Feature: Day 8

  @eight1
  Scenario: Using wait until
    Given I go to "sample" url
    And I verify page title is "Sample Page"

  @eight2
  Scenario Outline: Validate ZIP code for Portnov Computer School
    Given I go to "<url>" url
    When I go to "<submenu>" under "<tab>" tab
    And I fill out "<street>" street, "<city>" city, "<state>" state
    Then I validate "<zip>" zip code exists in the result
    Examples:
      | url  | submenu            | tab         | street              | city      | state | zip   |
      | usps | Look Up a ZIP Code | Mail & Ship | 4970 El Camino Real | Los Altos | CA    | 94022 |
      | usps | Look Up a ZIP Code | Mail & Ship | 1600 Amphitheatre Parkway | Mountain View | CA    | 94043 |

  @eight3
  Scenario: Validate ZIP code for Company
    Given I go to "usps" url
    When I go to "Look Up a ZIP Code" under "Mail & Ship" tab
    And I fill out "1600 Amphitheatre Parkway" street, "Mountain View" city, "CA" state
    Then I validate "94043" zip code exists in the result

  And I wait for 3 sec
