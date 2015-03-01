module AdoptionHelper
 
  def adopt_puppy_number(puppy_number)
    @browser.button(:value => 'View Details', :index => puppy_number - 1).click
    @browser.button(:value => 'Adopt Me!').click
  end

  def complete_order_with(name, address, email, pay_type)
    @browser.text_field(:id => 'order_name').value = name 
    @browser.text_field(:id => 'order_address').value = address 
    @browser.text_field(:id => 'order_email').value = email
    @browser.select_list(:id => 'order_pay_type').select pay_type
    @browser.button(:value => 'Place Order').click
  end

end
