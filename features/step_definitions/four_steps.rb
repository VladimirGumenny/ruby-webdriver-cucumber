Given(/^I perform multiple operations$/) do
  puts "Sum of 2 and 3: "
  puts 2+3

  var1=3*2
  puts "Product of 2 and 3 is #{var1}"


end

And(/^I print division of "([^"]*)" and "([^"]*)"$/) do |arg1, arg2|
  result = arg1.to_f/arg2.to_f
  puts "Division result is #{result}"
end

And(/^I verify if "([^"]*)" equals "([^"]*)"$/) do |arg1, arg2|
  if arg1==arg2
    puts "They are equal: #{arg1} equals #{arg2}"
  else
    fail "They are NOT equal"
  end
end