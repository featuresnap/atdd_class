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
  expect(@browser.text).to include expected_message
end

Then(/^I should see "([^"]*)" as the name for line item (\d+)$/) do |expected_name, line_item|
  line_item_first_row_index = (line_item.to_i - 1) * 6
  line_item_first_row = @browser.table(:index => 0)[line_item_first_row_index]
  expect(line_item_first_row.text).to include expected_name
end

Then(/^I should see (\$\d+\.\d+) as the subtotal for line item (\d+)$/) do |expected_subtotal, line_item|
  line_item_first_row_index = (line_item.to_i - 1) * 6
  item_price_cell = @browser.table[line_item_first_row_index][3]
  expect(item_price_cell.text).to eql expected_subtotal
end

Then(/^I should see (\$\d+\.\d+) as the total for the cart$/) do |expected_total|
  #Ruby trick: Array index [-1] points to the last item in the array, which in our table gives us the last row
  total_cell = @browser.table(:index => 0)[-1][2]
  expect(total_cell.text).to eql expected_total
end


