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

And(/^I adopt another puppy$/) do
  @browser.button(:value => 'Adopt Another Puppy').click
end

Then(/^I should see the message "([^"]*)"$/) do |expected_message|
  expect(@browser.text).to include expected_message
end

And(/^I checkout with:$/) do |checkout_data_table|
  checkout_data = checkout_data_table.hashes.first
  @browser.text_field(:id => 'order_name').set(checkout_data["name"])
  @browser.textarea(:id => 'order_address').set(checkout_data["address"])
  @browser.text_field(:id => 'order_email').set(checkout_data["email"])
  @browser.select(:id => 'order_pay_type').select(checkout_data["payment type"])
  @browser.button(:value => 'Place Order').click
end