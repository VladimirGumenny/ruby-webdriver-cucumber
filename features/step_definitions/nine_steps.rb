require_relative "../support/functions"
require_relative "../pages/sample_form"

And(/^I fill out the country "([^"]*)"$/) do |country|
  click(".//*[@id='CountryID']")
  click(".//select/option[contains(text(), '#{country}')]")
end

And(/^I select shape "([^"]*)"$/) do |shape|
  click(".//*[@value='#{shape}']")
end

And(/^I select quantity "([^"]*)"$/) do |quantity|
  fill(".//*[@id='quantity-0']",quantity.to_i)
end

And(/^I submit the result$/) do
  click(".//*[@value='Calculate']")
  end

Then(/^I validate that the price is "([^"]*)"$/) do |price|
  total=get_text(".//*[@id='total']")
  assert(total,price)
end

Given(/^I navigate to sample page$/) do
  sample = SampleForm.new
  sample.visit
end

And(/^I fill out username with "([^"]*)"$/) do |username|
  sample = SampleForm.new
  sample.fill_username(username)
end

And(/^I submit my form$/) do
  sample = SampleForm.new
  sample.click_submit
end

Then(/^I verify email error message$/) do
  sample = SampleForm.new
  assert(sample.get_email_error == "This field is required.", "Incorrect message!")
end