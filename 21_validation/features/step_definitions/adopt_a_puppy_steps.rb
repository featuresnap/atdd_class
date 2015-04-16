Given(/^I am shopping for puppies$/) do
  visit_page(HomePage)
end

And(/^I checkout with the name blank$/) do
  on(OrderPage).checkout({:name => ''})
end

When(/^I view the puppy "([^"]*)"$/) do |puppy_name|
  on(HomePage).select_puppy puppy_name
end

And(/^I click the adopt me button$/) do
  on(DetailsPage).adopt_me
end

And(/^I click the complete adoption button$/) do
  on(CartPage).complete_adoption
end

Then(/^I should see "([^"]*)"$/) do |expected_message|
  expect(on(OrderPage).errors).to include expected_message
end
