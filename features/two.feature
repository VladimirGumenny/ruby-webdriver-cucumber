@two
Feature: Feature Two

  @two1
  Scenario: Cucumber embedded steps for Google
    Given I navigate to "https://google.com"
    Then I resize browser window size to width 800 and height 400
    Then I wait for 1 sec
    When I maximize browser window
    Then element having xpath "//input[@name='q']" should be present
    When I enter "Ruby" into input field having xpath "//input[@name='q']"
    Then I wait for 1 sec
    Then I click on element having xpath "//*[@value='Google Search'][@class='lsb']"
    Then I wait for 2 sec
    Then I take screenshot
    Then element having xpath "//*[@id='ires']" should have partial text as "Ruby"

   @two2
   Scenario: Verify Bing Search
     Given I navigate to "https://bing.com"
     Then element having xpath "//*[@id='sb_form_q']" should be present
     When I enter "Cucumber" into input field having xpath "//*[@id='sb_form_q']"
     Then I click on element having xpath "//*[@id='sb_form_go']"
     And I wait for 1 sec
     Then element having xpath "//*[@id='b_content']" should have partial text as "Cucumber"


