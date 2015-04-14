Given(/^I am looking for a puppy to adopt$/) do
  @browser.goto 'http://puppies.herokuapp.com'
end

And(/^I adopt puppy (\d+)$/) do |puppy_number|
  index = (puppy_number.to_i)-1
  @browser.button(:value => 'View Details', :index => index).click
  @browser.button(:value => 'Adopt Me!').click
  @shopping_cart_page = ShoppingCartPage.new(@browser)
end

And(/^I adopt another puppy$/) do
  @browser.button(:value => 'Adopt Another Puppy').click
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


