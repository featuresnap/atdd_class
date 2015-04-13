Given(/^I have no cheese$/) do
  @cheese=nil
end


When(/^I press the make cheese button$/) do
  @cheese = CheeseMaker.make_cheese
end

Then(/^I expect to have cheese$/) do
  expect(@cheese).to_not be nil
end