require 'rubygems'
require 'watir-webdriver'

def goto_puppy_adoption_site
  @browser=Watir::Browser.new
  @browser.goto 'http://puppies.herokuapp.com'
end

def adopt_puppy_number(puppy_number)
  @browser.button(:value => 'View Details', :index => puppy_number - 1).click
  @browser.button(:value => 'Adopt Me!').click
end

def continue_adopting_puppies
  @browser.button(:value => 'Adopt Another Puppy').click
end

def checkout_with(name, address, email, pay_type)
  @browser.button(:value => 'Complete the Adoption').click
  @browser.text_field(:id => 'order_name').value = name 
  @browser.text_field(:id => 'order_address').value = address 
  @browser.text_field(:id => 'order_email').value = email
  @browser.select_list(:id => 'order_pay_type').select pay_type
  @browser.button(:value => 'Place Order').click
end

def verify_page_contains(text)
  fail 'Something went wrong adopting a puppy' unless @browser.text.include? text
end

def close_the_browser
  @browser.close
end

goto_puppy_adoption_site
adopt_puppy_number 1 
checkout_with('Jim Bob', "123 Main Street\nCleveland, OH 44113", 'jimbob@atdd.com', 'Check')
verify_page_contains 'Thank you for adopting a puppy!' 
close_the_browser
