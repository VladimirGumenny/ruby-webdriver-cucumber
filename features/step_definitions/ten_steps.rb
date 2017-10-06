require_relative "../pages/sample_form"
require_relative "../pages/submited_form"

And(/^I enter data into required fields and submit$/) do
  sample=SampleForm.new
  sample.fill_username("Skryabin")
  sample.fill_email("skaryabin@gmail.com")
  sample.fill_password("1234567")
  sample.fill_confirm_password("1234567")
  sample.fill_name("Slava Skryabin")
  sample.click_checkbox


  sample.click_submit

end

Then(/^I verify required fields precesed$/) do
  submit=SubmitedForm.new
  assert(submit.verify_username, "Skryabin")
  assert(submit.verify_email, "skaryabin@gmail.com")
end