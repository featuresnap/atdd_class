Given(/^I have no cheese$/) do
  @cheese = nil
  puts 'I have no cheese'
end

When(/^I press the make (.*) button$/) do |cheese_type|
  puts 'make cheese button pressed.'
  @cheese = "#{cheese_type} cheese"    #equivalent to: @cheese = cheese_type + 'cheese'
end

Then(/^I expect to have cheese$/) do
  puts 'Checking whether I have cheese...'
  expect(@cheese).not_to be_nil
  puts "Yay, I have #{@cheese}!"
end

