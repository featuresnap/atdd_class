require 'rubygems'
require 'watir-webdriver'

def adopt_puppy_number(puppy_number)
  @browser.button(:value => 'View Details', :index => puppy_number - 1).click
  @browser.button(:value => 'Adopt Me!').click
end


@browser=Watir::Browser.new
@browser.goto 'http://puppies.herokuapp.com'
adopt_puppy_number 1 
@browser.button(:value => 'Adopt Another Puppy').click
adopt_puppy_number 2 
@browser.button(:value => 'Complete the Adoption').click

@browser.text_field(:id => 'order_name').value = 'Jim Bob' 
@browser.text_field(:id => 'order_address').value = '123 Main Street' 
@browser.text_field(:id => 'order_email').value = 'jimbob@atdd.com'
@browser.select_list(:id => 'order_pay_type').select 'Check'
@browser.button(:value => 'Place Order').click
