Given(/^I am shopping for puppies$/) do
  visit_page(HomePage)
end

Then(/^I should see "([^"]*)"$/) do |expected_message|
  expect(@current_page.text).to include expected_message
end

When(/^I complete the adoption$/) do
  navigate_all
end