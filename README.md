# ruby-webdriver-cucumber
Automated testing with Ruby, Selenium Webdriver and Cucumber


##Winium Installation
	1. Install wix tools set: https://wixtoolset.org/releases/
	2. Install inspection tool https://accessibilityinsights.io/docs/en/windows/overview/
	3. Install windows application driver: https://github.com/microsoft/WinAppDriver.git => Releases => download WindowsApplicationDriver.msi and install it; store location where it is installed (like C:\Program Files (x86)\Windows Application Driver\)
	4. Enable developer mode in Windows: https://docs.microsoft.com/en-us/windows/apps/get-started/enable-your-device-for-development
Go to the WinAppDriver folder from above and Launch WinDriverApp.exe

run:  winappdriver.exe 127.0.0.1 4723/wd/hub



---
`source 'https://rubygems.org'

ruby '2.5.3'
gem 'activesupport', '6.0.3.3'
gem 'allure-cucumber', '2.13.6.3'
gem 'byebug', '11.1.3'
gem 'clipboard', '1.3.5'
gem 'cucumber', '5.1.2'
gem 'cuke_modeler', '3.4.0'
gem 'faker', '2.14.0'
gem 'faraday', '1.0.1'
gem 'ffi', '1.13.1'
gem 'google-api-client', '0.45.1'
gem 'mysql2', '0.5.3'
gem 'nokogiri', '1.10.10'
gem 'page-object', '2.2.6'
gem 'parallel_tests', '3.3.0'
gem 'phony', '2.18.15'
gem 'rspec-expectations', '3.9.2'
gem 'selenium-webdriver', '3.142.7'
gem 'test-unit', '3.3.6'
gem 'webdrivers', '4.4.1'`