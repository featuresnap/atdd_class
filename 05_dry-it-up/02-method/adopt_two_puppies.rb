require 'rubygems'
require 'watir-webdriver'

def adopt_puppy_number(puppy_number, browser)
  browser.button(:value => 'View Details', :index => puppy_number - 1).click
  browser.button(:value => 'Adopt Me!').click
end


browser=Watir::Browser.new
browser.goto 'http://puppies.herokuapp.com'
adopt_puppy_number(1, browser)
browser.button(:value => 'Adopt Another Puppy').click
adopt_puppy_number(2, browser)
browser.button(:value => 'Complete the Adoption').click

browser.text_field(:id => 'order_name').set 'Jim Bob'
browser.text_field(:id => 'order_address').set "123 Main Street\nCleveland, OH 44113" 
browser.text_field(:id => 'order_email').set 'jimbob@atdd.com'
browser.select_list(:id => 'order_pay_type').select 'Check'
browser.button(:value => 'Place Order').click

fail 'Something went wrong adopting a puppy' unless browser.text.include? 'Thank you for adopting a puppy!' 
