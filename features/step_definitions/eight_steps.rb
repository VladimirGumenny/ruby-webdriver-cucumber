require_relative "../support/functions"

And(/^I verify form header presents$/) do
  wait_for("//*[@id='sampleForm']//legend")
  assert(get_text("//*[@id='sampleForm']//legend").include?("Sample"), "Text incorrect!")
end

When(/^I Lookup ZIP page$/) do
   click("//span[contains(text(), 'Mail & Ship')]")
   click("//nav[@class='left-nav']//*[contains(text(), 'ZIP')]")

end


Then(/^I validate "([^"]*)" zip code exists in the result$/) do |zip|
  result_list = get_text(".//*[@id='result-list']")
  assert(result_list.include?(zip))
end

And(/^I verify form header present$/) do
  wait_for("//*[@id='sampleForm']//legend")
  header_text = get_text("//*[@id='sampleForm']//legend")
  assert(header_text.include?("Sample"), "Text incorrect!")
end


Given(/^I open "([^"]*)" page$/) do |site|
  if site == "usps"
    $driver.get("http://www.usps.com")
    wait_for("//img[contains(@src, 'logo-sb')]")
  end
end

When(/^I 1 go to Lookup ZIP page$/) do
  click("//*[text()='Mail & Ship']")
  click("//*[contains(@href, 'zip4')]")
end

When(/^I go to "([^"]*)" under "([^"]*)" tab$/) do |submenu, tab|
  element = $driver.find_element(:xpath, "//a[contains(@class, 'menu--item')]//*[text()='#{tab}']")
  $driver.action.move_to(element).perform
  wait_for("//*[text()='#{submenu}']")
  click("//*[text()='#{submenu}']")
end

And(/^I fill out "([^"]*)" street, "([^"]*)" city, "([^"]*)" state$/) do |street, city, state|
  fill("//*[@id='tAddress']", street)
  fill("//*[@id='tCity']", city)

  click("//span[@class='select-current-text']")
  click("//a[@rel='#{state}']")

  click("//*[@id='lookupZipFindBtn']")
end