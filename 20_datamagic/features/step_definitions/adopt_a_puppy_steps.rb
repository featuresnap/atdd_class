Given(/^I am shopping for puppies$/) do
  visit_page(HomePage)
end

When(/^I checkout$/) do
  on(OrderPage).checkout
end

When(/^I checkout using a purchase order$/) do
  on(OrderPage).checkout({:pay_type => 'Purchase order'})
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
  expect(@current_page.text).to include expected_message
end