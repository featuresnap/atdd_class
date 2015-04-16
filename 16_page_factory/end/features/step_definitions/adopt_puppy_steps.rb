Given(/^I am looking for a puppy to adopt$/) do
  visit HomePage
end

And(/^I adopt puppy (\d+)$/) do |puppy_number|
  on(HomePage).view_details_for_puppy(puppy_number.to_i)
  on(DetailsPage).adopt_me
  end

And(/^I complete the adoption$/) do
  on(ShoppingCartPage).proceed_to_checkout
  end

And(/^I adopt another puppy$/) do
  on(ShoppingCartPage).continue_shopping
end

And(/^I checkout with:$/) do |checkout_data_table|
  checkout_data = checkout_data_table.hashes.first
  on(CheckoutPage) do |checkout_page|
    checkout_page.customer_name = checkout_data["name"]
    checkout_page.address = checkout_data["address"]
    checkout_page.email = checkout_data["email"]
    checkout_page.payment_method = checkout_data["payment type"]
    checkout_page.place_order
  end
end

Then(/^I should see "([^"]*)" as the name for line item (\d+)$/) do |expected_name, line_item|
  on(ShoppingCartPage) do |page|
    expect(page.name_for_line line_item.to_i).to include expected_name
  end
end

Then(/^I should see "([^"]*)" as the subtotal for line item (\d+)$/) do |expected_subtotal, line_item|
  on(ShoppingCartPage) do |page|
    expect(page.price_for_line line_item.to_i).to eql expected_subtotal
  end
end

Then(/^I should see "([^"]*)" as the total for the cart$/) do |expected_total|
  on(ShoppingCartPage) do |page|
    expect(page.total_amount).to eql expected_total
  end
end


Then(/^I should be informed the adoption was successful$/) do

  on(HomePage) do |page|
    expect(page.adoption_completed).to be true
  end
end