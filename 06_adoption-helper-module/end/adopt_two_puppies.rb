require 'rubygems'
require 'watir-webdriver'
require_relative 'adoption_helper_module'

include AdoptionHelper

goto_puppy_adoption_site
adopt_puppy_number 1 
continue_adopting_puppies
adopt_puppy_number 2 
checkout_with('Jim Bob', "123 Main Street\nCleveland, OH 44113", 'jimbob@atdd.com', 'Check')
verify_page_contains 'Thank you for adopting a puppy!' 
close_the_browser
