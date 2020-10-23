Given(/^I perform multiple operations$/) do
  log "Sum of 2 and 3: "
  log 2+3

  var1=3*2
  log "Product of 2 and 3 is #{var1}"


end

And(/^I print division of "([^"]*)" and "([^"]*)"$/) do |arg1, arg2|
  result = arg1.to_f/arg2.to_f
  log "Division result is #{result}"
end

And(/^I verify if "([^"]*)" equals "([^"]*)"$/) do |arg1, arg2|
  if arg1==arg2
    log "They are equal: #{arg1} equals #{arg2}"
  else
    fail "They are NOT equal"
  end
end