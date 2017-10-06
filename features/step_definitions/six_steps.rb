require_relative '../support/hooks'

  Then(/^I verify required fields saved correctly$/) do
  email = $driver.find_element(:xpath, ".//b[@name='email']").text
  assert(email.include?("@"), "Correct Email is not present! Actual is: #{email}")

  agreed = $driver.find_element(:xpath, "//b[@name='agreedToPrivacyPolicy']").text
  assert(agreed == "true", "Doesnt't agreed to Privacy Policy!")

  header = $driver.find_element(:xpath, ".//*[@id='samplePageResult']//legend").text
  assert(header.include?("Submitted"), "Header is not correct! Actual header is: #{header}")

  return_button = $driver.find_element(:xpath, "//*[@id='return']")
  assert(return_button.displayed?, "Return button is not displayed!")

  attachment=$driver.find_element(:xpath, "//*[@name='attachmentName']")
  assert(attachment.text == "README - Copy.md", "Attachment is not present!")

  name = $driver.find_element(:xpath, "//b[@name='name']")
  assert(name.text == $data["first_name"]+" "+$data["last_name"], "Name is not correct!")


end

Then(/^I verify page rendered correctly$/) do
  title = $driver.title
  if title != "Sample Page"
    fail("Wrong Title! Actual Title is #{title}")
  end
  form_header=$driver.find_element(:xpath, "//*[@id='sampleForm']//legend")
  assert(form_header.text == "Sample form with input elements", "Form header incorrect. Actual: #{form_header.text}")

  location = $driver.find_element(:xpath, "//*[@id='location']")
  assert(location.text.include?("Los Altos"), "Location is not correct! Actual is #{location.text}")

  form_time = $driver.find_element(:xpath, ".//*[@id='currentDate']")
  assert(form_time.text.include?(Time.now.year.to_s), "Date is not correct! Actual is: #{form_time.text}")

end

Then(/^I verify page title is "([^"]*)"$/) do |expected_title|
  actual_title = $driver.title
  if actual_title != expected_title
    fail("Wrong Title! Actual Title is #{actual_title}. Expected Title is: #{expected_title}")
  end
end

And(/^I verify related documents page contains "([^"]*)"$/) do |document_text|

  doc_button=$driver.find_element(:xpath, "//*[contains(@onclick, 'new_window')]")
  doc_button.click

  last_window=$driver.window_handles.last
  $driver.switch_to.window(last_window)

  new_window_source=$driver.page_source
  assert(new_window_source.include?(document_text), "#{document_text} is not present")

  first_window=$driver.window_handles.first
  $driver.switch_to.window(first_window)

end