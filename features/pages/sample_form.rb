require_relative "page_object"

class SampleForm < PageObject

  def initialize
    @url = "http://skryabin.com/webdriver/html/sample.html"
    @header = ".//*[@id='sampleForm']/fieldset/legend"
    @username = "//*[@name='username']"
    @email= "//*[@name='email']"
    @password = "//*[@name='password']"
    @confirm_password = "//*[@name='confirmPassword']"
    @name = "//*[@id='name']"
    @submit = "//*[@id='formSubmit']"
    @refresh = "//*[@id='formRefresh']"
    @email_error = "//*[@id='email-error']"
    @checkbox = "//*[@name='agreedToPrivacyPolicy']"
  end

  def click_submit

    submit_btn = $driver.find_element(:xpath, @submit)
    $driver.execute_script("arguments[0].scrollIntoView(true);", submit_btn)
    submit_btn.click
  end

  def click_checkbox
    $driver.find_element(:xpath, @checkbox).click
  end

  def fill_username(text)
    $driver.find_element(:xpath, @username).send_keys(text)
  end

  def fill_email(email)
    $driver.find_element(:xpath, @email).send_keys(email)
  end

  def fill_password(psswrd)
    $driver.find_element(:xpath, @password).send_keys(psswrd)
  end

  def fill_confirm_password(psswrd)
    $driver.find_element(:xpath, @confirm_password).send_keys(psswrd)
    end

  def fill_name(name)
    $driver.find_element(:xpath, @name).send_keys(name)
  end





  def click_refresh
    $driver.find_element(:xpath, @refresh).click
  end

  def visit
    $driver.get(@url)
  end

  def get_email_error
    return $driver.find_element(:xpath, @email_error).text
  end




end