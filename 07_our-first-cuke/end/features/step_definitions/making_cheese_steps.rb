Given(/^I have no cheese$/) do
  puts "I am sad because I have no cheese."
end

When(/^I press the make cheese button$/) do
  puts "There is hope. I hope this works!"  
end

Then(/^I should have (\d+) piece of cheese$/) do |num_pieces|
  puts "I now have #{num_pieces} piece(s) of cheese."  
end

