require_relative "page_object"

class SubmitedForm < PageObject

def initialize
  @username = "//*[@name='username']"
  @email= "//*[@name='email']"
end

def verify_username
  return $driver.find_element(:xpath, @username).text
  end

def verify_email
  return $driver.find_element(:xpath, @email).text
end

  def werthj
    $driver


  end

end