require 'rubygems'
require 'watir-webdriver'
require_relative 'adoption_helper_module'

include AdoptionHelper

@browser=Watir::Browser.new
@browser.goto 'http://puppies.herokuapp.com'
adopt_puppy_number 1
@browser.button(:value => 'Complete the Adoption').click

complete_order_with('Jim Bob', '123 Main St.\nCleveland, OH 44113', 'jimbob@atdd.com', 'Check')
