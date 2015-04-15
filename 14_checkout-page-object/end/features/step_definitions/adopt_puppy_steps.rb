Given(/^I am looking for a puppy to adopt$/) do
  @browser.goto 'http://puppies.herokuapp.com'
end

And(/^I adopt puppy (\d+)$/) do |puppy_number|
  index = (puppy_number.to_i)-1
  @browser.button(:value => 'View Details', :index => index).click
  @browser.button(:value => 'Adopt Me!').click
  @shopping_cart_page=ShoppingCartPage.new(@browser)
end

And(/^I complete the adoption$/) do
  @shopping_cart_page.proceed_to_checkout
  @checkout_page=CheckoutPage.new(@browser)
end

And(/^I adopt another puppy$/) do
  @shopping_cart_page.continue_shopping
end

And(/^I enter the name "([^"]*)"$/) do |name|
  @checkout_page.customer_name = name
end

And(/^I enter the address "([^"]*)"$/) do |address|
  @checkout_page.address = address
end

And(/^I enter the contact email "([^"]*)"$/) do |email|
  @checkout_page.email = email
end

And(/^I enter "([^"]*)" as the payment type$/) do |payment_method|
  @checkout_page.payment_method = payment_method
end

When(/^I place my order$/) do
  @browser.button(:value => 'Place Order').click
end

Then(/^I should see the message "([^"]*)"$/) do |expected_message|
  expect(@browser.text).to include expected_message
end

Then(/^I should see "([^"]*)" as the name for line item (\d+)$/) do |expected_name, line_item|
  expect(@shopping_cart_page.name_for_line line_item.to_i).to include expected_name
end

Then(/^I should see "([^"]*)" as the subtotal for line item (\d+)$/) do |expected_subtotal, line_item|
  expect(@shopping_cart_page.price_for_line line_item.to_i).to eql expected_subtotal
end

Then(/^I should see "([^"]*)" as the total for the cart$/) do |expected_total|
  expect(@shopping_cart_page.total_amount).to eql expected_total
end


