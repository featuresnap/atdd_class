Given(/^I am looking for a puppy to adopt$/) do
  @browser.goto 'http://puppies.herokuapp.com'
end

And(/^I adopt puppy (\d+)$/) do |puppy_number|
  index = (puppy_number.to_i)-1
  @browser.button(:value => 'View Details', :index => index).click
  @browser.button(:value => 'Adopt Me!').click
end

And(/^I complete the adoption$/) do
  @browser.button(:value => 'Complete the Adoption').click
end

And(/^I enter the name "([^"]*)"$/) do |name|
  @browser.text_field(:id => 'order_name').value = name
end

And(/^I enter the address "([^"]*)"$/) do |address|
  puts address
  @browser.textarea(:id => 'order_address').value = address
end

And(/^I enter the contact email "([^"]*)"$/) do |email|
  @browser.text_field(:id => 'order_email').value = email
end

And(/^I enter "([^"]*)" as the payment type$/) do |payment_method|
  @browser.select(:id => 'order_pay_type').select(payment_method)
end

When(/^I place my order$/) do
  @browser.button(:value => 'Place Order').click
end

Then(/^I should see the message "([^"]*)"$/) do |expected_message|
  fail unless @browser.text.include? expected_message
end