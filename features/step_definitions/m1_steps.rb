require_relative "../support/hooks"

Given(/^I take an array$/) do
  $a=Array[3,7,4,2,2,1,4,4,9,1,5]
  puts ("Initial Array is: \n #{$a}")
end

And(/^I sort array$/) do
    puts $a.sort
end

And(/^I sort array and leave "([^"]*)" on the places$/) do |number|
  number_i=number.to_i
  #duplicate of array to store values
  b=$a.dup

  #sort of array
  $a=$a.sort

  # delete all desired numbers
  $a.delete(number_i)

  #counter
  k=0

  #loop for replacing desired value in the target array
  for i in b
    if i==number_i
      $a.insert(k, number_i)
    end
    k=k+1
  end

  puts ("New Array is: \n #{$a}. \nMake shure the #{number}s are on the places")
end



And(/^I delete "([^"]*)" from array$/) do |arg|
  $a.delete(arg.to_i)
  puts $a
end