Given(/^I am looking for a puppy to adopt$/) do
  @browser.goto 'http://puppies.herokuapp.com'
  @home_page = HomePage.new(@browser)
end

And(/^I adopt puppy (\d+)$/) do |puppy_number|
  @home_page.view_details_for_puppy(puppy_number.to_i)
  @details_page = DetailsPage.new(@browser)
  @details_page.adopt_me
  @shopping_cart_page=ShoppingCartPage.new(@browser)
end

And(/^I complete the adoption$/) do
  @shopping_cart_page.proceed_to_checkout
  @checkout_page=CheckoutPage.new(@browser)
end

And(/^I adopt another puppy$/) do
  @shopping_cart_page.continue_shopping
end

And(/^I checkout with:$/) do |checkout_data_table|
  checkout_data = checkout_data_table.hashes.first
  @checkout_page.customer_name = checkout_data["name"]
  @checkout_page.address = checkout_data["address"]
  @checkout_page.email = checkout_data["email"]
  @checkout_page.payment_method = checkout_data["payment type"]
  @checkout_page.place_order
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


Then(/^I should be informed the adoption was successful$/) do
  expect(@home_page.adoption_completed).to be true
end