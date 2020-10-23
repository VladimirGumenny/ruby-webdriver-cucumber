# require 'selenium-webdriver'
require 'em/pure_ruby'
require 'selenium-cucumber'
require 'webdrivers'
require 'test/unit'
require 'time'
require 'yaml'
require 'faker'
require 'rubygems'
require 'appium_lib'

include Faker

# Test::Unit::AutoRunner.need_auto_run = false
# include Test::Unit::Assertions

AfterConfiguration do
  win_app_testing = true

  if win_app_testing
    caps = Selenium::WebDriver::Remote::Capabilities.new
    caps['app'] = 'C:\Users\vladimir.gumennyy\AppData\Local\Programs\office-desktop\Ooma Office.exe'
    # caps['app'] = 'com.ooma.office.desktop'
    caps['platformName'] = 'WINDOWS'
    caps['deviceName'] = 'WindowsPC'
    opts =
      {
        caps: {
          platformName: 'WINDOWS',
          platform: 'WINDOWS',
          deviceName: 'WindowsPC',
          # app: 'Microsoft.WindowsCalculator_8wekyb3d8bbwe!App'
          app: 'C:\Users\vladimir.gumennyy\AppData\Local\Programs\office-desktop\Ooma Office.exe'
          # app: 'com.ooma.office.desktop'
        },
        # appium_lib: {
        #   wait_timeout: 30,
        #   wait_interval: 0.5
        # }
      }

    @driver = Appium::Driver.new(opts, false).start_driver

    # wait = Selenium::WebDriver::Wait.new :timeout => 20

    # @driver = Selenium::WebDriver.for(:remote,
    #                                   url: 'http://127.0.0.1:4723/wd/hub',
    #                                   capabilities: opts)
    #                                   # desired_capabilities: caps)

    # Test.login
    sleep 5
  else
    caps = Selenium::WebDriver::Remote::Capabilities.chrome(
        'chromeOptions' => {'detach' => false})
    # $driver = Selenium::WebDriver.for(:chrome, detach: false, :desired_capabilities => caps, :switches => %w[--start-maximized --disable-cache --ignore-certificate-errors --disable-popup-blocking --test-type --disable-extensions --disable-download-notification --disable-translate])
    $driver = Selenium::WebDriver.for(:chrome)
  end

  $data = YAML.load_file(Dir.pwd + '/features/resources/data.yml')
end

# Will be executed before start of each Scenario
Before do
  if (!$driver.nil?)
    $driver.manage.delete_all_cookies

    # below needed for browser to get to foreground
    # $driver.execute_script("alert('Bringing to foreground!')")
    # $driver.switch_to.alert.accept
  end
end

After do |scenario|

end

AfterStep do

end

at_exit do
  if (!$driver.nil? && $driver.browser != :phantomjs && $driver.browser != :chrome)
    $driver.quit
  end
end