# Created by Viacheslav (Slava) Skryabin 01/01/2016
require 'selenium-webdriver'
require 'selenium-cucumber'
require 'test/unit'
require 'time'
require 'yaml'
require 'faker'

include Faker

Test::Unit::AutoRunner.need_auto_run = false
include Test::Unit::Assertions

# Will be executed before beginning of all Scenarios - after initial Cucumber configuration
AfterConfiguration do
 Selenium::WebDriver::Chrome.driver_path = './drivers/chromedriver.exe'
 Selenium::WebDriver::Firefox.driver_path = './drivers/geckodriver.exe'


  caps = Selenium::WebDriver::Remote::Capabilities.chrome(
      "chromeOptions" => {"detach" => false})
  #$driver = Selenium::WebDriver.for(:chrome, detach: false, :desired_capabilities => caps, :switches => %w[--start-maximized --disable-cache --ignore-certificate-errors --disable-popup-blocking --test-type --disable-extensions --disable-download-notification --disable-translate])

  $driver - Selenium::WebDriver.for(:firefox)
 # $driver - Selenium::WebDriver.for(:chrome)

  $data = YAML.load_file(Dir.pwd+"/features/resources/data.yml")
end

# Will be executed before start of each Scenario
Before do
  if (!$driver.nil?)
    $driver.manage.delete_all_cookies

    # below needed for browser to get to foreground
    $driver.execute_script("alert('Bringing to foreground!')")
    $driver.switch_to.alert.accept
  end
end

# Will be executed before start of specific Scenario with mentioned tags
Before('@one1, @one2') do

end

# Will be executed after finish of each Scenario
After do |scenario|

end

# Will be executed after each Scenario Step
AfterStep do

end

# Will be executed after all Scenarios are finished and completed
at_exit do
  if (!$driver.nil? && $driver.browser != :phantomjs && $driver.browser != :chrome)
    $driver.quit
  end

end