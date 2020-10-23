class OfficeApp

  def login
    sleep 5
    # AutomationId	phone
    @driver.find_element(:AutomationId => 'phone').send_keys("1456")
    # @driver.find_element(:id => 'extension').send_keys("1456")
    # @driver.find_element(:id => 'password').send_keys("1456")
    # @driver.find_element(:id => 'login-button').click
    sleep 5
  end

end