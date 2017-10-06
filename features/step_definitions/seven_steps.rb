require_relative '../support/functions'

When(/^I fill out additional info with "([^"]*)" and "([^"]*)"$/) do |name, phone|
  ifame=$driver.find_element(:xpath, "//iframe[@name='additionalInfo']")
  $driver.switch_to.frame(ifame)
  $driver.find_element(:xpath, "//*[@id='contactPersonName']").send_keys(name)
  $driver.find_element(:xpath, ".//*[@id='contactPersonPhone']").send_keys(phone)
  $driver.switch_to.parent_frame



end

And(/^I "([^"]*)" 3rd party agreement$/) do |arg|
#  $driver.find_element(:xpath, ".//*[@id='thirdPartyButton']").click
  click("//*[@id='thirdPartyButton']")
  if arg == "accept"
    $driver.switch_to.alert.accept
  elsif arg == "dismis" or arg == "decline"
    $driver.switch_to.alert.dismiss
  else
    puts "Error! Parameter is not correct. Actual is: #{arg}"
  end
    sleep 1

end

And(/^I attach the file$/) do
  btn=$driver.find_element(:xpath, "//*[@id='attachment']")
  btn.send_keys(Dir.pwd + "/README - Copy.md")
end

And(/^I put phone "([^"]*)" and select gender "([^"]*)"$/) do |phone, sex|
  fill("//*[@name='phone']",phone)
  click("//*[@name='gender'][@value='#{sex}']")
end

And(/^I fill out address field$/) do
  fill(".//*[@id='address']", $data["address"])
end

And(/^I sleep "([^"]*)" seconds$/) do |seconds|
  sleep seconds.to_i
end