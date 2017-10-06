require_relative "../support/functions"

Given(/^I open url "([^"]*)" and print page details$/) do |url|
  $driver.get(url)
  sleep 3
  puts $driver.title
  puts $driver.current_url
  puts $driver.window_handles
  puts $driver.page_source


end

And(/^I go to "([^"]*)" url$/) do |url|
  if url == "google"
    $driver.get("http://google.com")
  end

  if url == "yahoo"
    $driver.get("http://yahoo.com")
  end

  if url == "sample"
    $driver.get("http://skryabin.com/webdriver/html/sample.html")
  end

  if url == "usps"
    $driver.get("http://usps.com")
  end

end


Then(/^I go back and forward, then refresh the page$/) do
  $driver.navigate.back
  $driver.navigate.forward
  $driver.navigate.refresh
end

And(/^I maximize the window$/) do
  $driver.manage.window.maximize
end

And(/^change resolution to phone$/) do
  $driver.manage.window.resize_to(400, 400)


end

And(/^I set resolution  to "([^"]*)" "([^"]*)"$/) do |arg1, arg2|
  $driver.manage.window.resize_to(arg1, arg2)
end

When(/^I fill out required fields$/) do
  username=$driver.find_element(:xpath,"//*[@name='username']")
  username.send_keys("SlavaSkryabin")

  email=$driver.find_element(:xpath,"//*[@name='email']")
  email.send_keys("sss@mail.com")

  password=$driver.find_element(:xpath,"//*[@id='password']")
  password.send_keys("1234567")

  conf_password= $driver.find_element(:xpath,"//*[@id='confirmPassword']")
  conf_password.send_keys("1234567")

  name=$driver.find_element(:xpath,"//*[@id='name']")
  name.click

  first_name=$driver.find_element(:xpath,"//*[@id='firstName']")
  first_name.send_keys($data["first_name"])

  last_name=$driver.find_element(:xpath,"//*[@id='lastName']")
  last_name.send_keys($data["last_name"])

  click_btn=$driver.find_element(:xpath,"//*[text()='Save']")
  click_btn.click

  agree_policy=$driver.find_element(:xpath,"//*[@name='agreedToPrivacyPolicy']")
  agree_policy.click

  sleep 3

end


And(/^I submit the page$/) do

  submit=$driver.find_element(:xpath,".//*[@id='formSubmit']")
  submit.click

  sleep 2

end

And(/^I fill the rest fields$/) do
  phone=$driver.find_element(:xpath, "//*[@name='phone']")
  phone.send_keys("4073712041")

  dob_main=$driver.find_element(:xpath, "//*[@id='dateOfBirth']")
  dob_main.click

  dob_month_out=$driver.find_element(:xpath, "//select/option[@value='4']/..")
  dob_month_out.click
  dob_month_in=$driver.find_element(:xpath, "//select/option[@value='4']")
  dob_month_in.click
  dob_year_out=$driver.find_element(:xpath, "//select/option[text()='1981']/..")
  dob_year_out.click
  dob_year_in=$driver.find_element(:xpath, "//select/option[text()='1981']")
  dob_year_in.click
  dob_date=$driver.find_element(:xpath, "//a[text()='15']")
  dob_date.click

  country_out=$driver.find_element(:xpath, "//select/option[@value='Russia']/..")
  country_out.click
  country_in=$driver.find_element(:xpath, "//select/option[@value='Russia']")
  country_in.click

  gender=$driver.find_element(:xpath,"//*[@value='male']")
  gender.click

  allowed_to_contact=$driver.find_element(:xpath,"//*[@name='allowedToContact']")
  allowed_to_contact.click

  fill("//*[@name='address']", Address.full_address)
  # address=$driver.find_element(:xpath,"//*[@name='address']")
  # address.send_keys("389 Spence Ave")

  car=$driver.find_element(:xpath, "//select/option[@value='BMW']")
  car.click

  third_party_agreement=$driver.find_element(:xpath, ".//*[@id='thirdPartyButton']")
  third_party_agreement.click
  $driver.switch_to.alert.accept

  related_documents=$driver.find_element(:xpath, "//button[contains(text(), 'documents')]")
  window1=$driver.window_handle
  puts ("Window1 is: "+window1)
  related_documents.click
  $driver.switch_to.window($driver.window_handles.last)
  $driver.close
  $driver.switch_to.window($driver.window_handles.first)

  add_info_out=$driver.find_element(:xpath,"//iframe[@name='additionalInfo']")
  $driver.switch_to.frame(add_info_out)
  add_info_in_name=$driver.find_element(:xpath,"//*[@id='contactPersonName']")
  add_info_in_name.send_keys("Qwerty")
  add_info_in_phone=$driver.find_element(:xpath,".//*[@id='contactPersonPhone']")
  add_info_in_phone.send_keys("4443332211")
  $driver.switch_to.default_content

  filename="some-file.txt"
  file=File.join(Dir.pwd, filename)
  browse_btn=$driver.find_element(:xpath,".//*[@id='attachment']")
  browse_btn.send_keys file

end