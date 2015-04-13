Given(/^I have no cheese$/) do
  @cheese = nil
  puts 'I have no cheese'
end

When(/^I press the make blue cheese button$/) do
  puts 'Make cheese button pressed' 
  #Comment the following line out to verify that the test works correctly
  @cheese = 'blue cheese'
end

When(/^I press the make swiss cheese button$/) do
  puts 'Make cheese button pressed'
  #Comment the following line out to verify that the test works correctly
  @cheese = 'swiss cheese'
end

Then(/^I expect to have cheese$/) do
  puts 'Checking whether I have cheese...'
  expect(@cheese).not_to be_nil
  puts "Yay, I have #{@cheese}!"
end

