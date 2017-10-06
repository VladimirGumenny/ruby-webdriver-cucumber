@three
  Feature: Feature three
    @three1
      Scenario: Validate responsive UI behaviour
      Given I navigate to "http://skryabin.com/webdriver/html/sample.html"var
      #And I wait for 3 sec
      And I maximize browser window
      Then element having xpath "//*[text()='Location']" should be present
      Then element having xpath "//*[text()='Date']" should be present
      Then element having xpath "//*[text()='Time']" should be present
      And I resize browser window size to width 600 and height 600
      Then element having xpath "//*[text()='Location']" should not be present
      Then element having xpath "//*[text()='Date']" should not be present
      Then element having xpath "//*[text()='Time']" should not be present

    @three2
      Scenario: Fill out and validate Username field
      Given I navigate to "http://skryabin.com/webdriver/html/sample.html"
      And I maximize browser window
      And I enter "1" into input field having xpath ".//*[@name='username']"
      And I click on element having xpath ".//*[@name='email']"
      Then element having xpath ".//*[@id='username-error']" should have text as "Please enter at least 2 characters."

    @three3
    Scenario: Validate Email field behaviour
      Given I navigate to "http://skryabin.com/webdriver/html/sample.html"
      And I maximize browser window
      And I enter "1343221" into input field having xpath ".//*[@name='email']"
      And I click on element having xpath ".//*[@name='username']"
      Then element having xpath ".//*[@id='email-error']" should have text as "Please enter a valid email address."

     @three4
     Scenario: Fill out and validate Password set of fields
       Given I navigate to "http://skryabin.com/webdriver/html/sample.html"
       And I maximize browser window
       And I clear input field having xpath ".//*[@id='password']"
       Then element having xpath ".//*[@id='confirmPassword']" should be disabled

     @three5
     Scenario: Validate Name field behaviour
     Given I navigate to "http://skryabin.com/webdriver/html/sample.html"
       And I maximize browser window
       When I click on element having xpath ".//*[@id='name']"
       Then element having xpath "//*[@aria-describedby='nameDialog']" should be present
       When I enter "qwe" into input field having xpath ".//*[@id='firstName']"
       When I enter "asd" into input field having xpath ".//*[@id='middleName']"
       When I enter "zxc" into input field having xpath ".//*[@id='lastName']"
       And I click on element having xpath "//div//*[contains(text(), 'Save')]"
       Then element having xpath ".//*[@id='name']" should have attribute "value" with value "qwe asd zxc"


     @three6
     Scenario: Validate Accepting Privacy Policy is required
       Given I navigate to "http://skryabin.com/webdriver/html/sample.html"
       And I maximize browser window
       When I click on element having xpath ".//*[@id='formSubmit']"
       Then element having xpath ".//*[@id='agreedToPrivacyPolicy-error']" should have partial text as "Must check"

     @three7
     Scenario: Entering Non-required fields
       Given I navigate to "http://skryabin.com/webdriver/html/sample.html"
       And I maximize browser window
       When I enter "4073712041" into input field having xpath "//*[@name='phone']"
       When I click on element having xpath "//*[@name='countryOfOrigin']"
       And I click on element having xpath "//select/*[@value='Russia']"
       When I click on element having xpath "//*[@value='male']"
       When I click on element having xpath "//*[@name='allowedToContact']"
       When I enter "380 Spence Ave" into input field having xpath "//*[@id='address']"
       When I click on element having xpath "//select/option[@value='BMW']"
       When I click on element having xpath ".//*[@id='thirdPartyButton']"
       And I accept alert
       When I click on element having xpath ".//*[@id='dateOfBirth']"
       And I click on element having xpath "//select/option[@value='4']/.."
       And I click on element having xpath "//select/option[@value='4']"
       And I click on element having xpath "//select/option[@value='1981']/.."
       And I click on element having xpath "//select/option[@value='1981']"
       And I click on element having xpath "//td/a[text()='15']"
       And I wait for 4 sec

      @three8
      Scenario: Fill out required fields and submit
        Given I navigate to "http://skryabin.com/webdriver/html/sample.html"
        And I maximize browser window
        When I enter "MikeChe" into input field having xpath ".//*[@name='username']"
        And I enter "mike@qwe.com" into input field having xpath ".//*[@name='email']"
        And I enter "password" into input field having xpath ".//*[@name='password']"
        And I enter "password" into input field having xpath ".//*[@name='confirmPassword']"
        And I enter "Mike" into input field having xpath ".//*[@name='name']"
        And I click on element having xpath ".//*[@name='agreedToPrivacyPolicy']"
        And I click on element having xpath ".//*[@id='formSubmit']"
        Then element having xpath ".//b[@name='username']" should have text as "MikeChe"

        And I wait for 6 sec
      
      