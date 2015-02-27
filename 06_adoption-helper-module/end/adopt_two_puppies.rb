require 'rubygems'
require 'watir-webdriver'
require_relative 'adoption_helper_module'

include AdoptionHelper

@browser=Watir::Browser.new
@browser.goto 'http://puppies.herokuapp.com'
adopt_puppy_number 1 
@browser.button(:value => 'Adopt Another Puppy').click
adopt_puppy_number 2 
@browser.button(:value => 'Complete the Adoption').click
