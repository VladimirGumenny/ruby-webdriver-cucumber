require_relative "../support/hooks"

class PageObject

  def get_element(xpath)
    wait_for(xpath)
    return $driver.find_element(:xpath, xpath)
  end

  def click(xpath)
    get_element(xpath).click
  end

  def fill(xpath, text)
    get_element(xpath).send_keys(text)
  end

  def click_with_js(xpath)
    $driver.execute_script("arguments[0].click();", get_element(xpath))
  end

  def get_text(xpath)
    return get_element(xpath).text
  end

  def wait_for(xpath)
    wait = Selenium::WebDriver::Wait.new(:timeout => 30)
    wait.until {$driver.find_element(:xpath, xpath).displayed?}
  end

end