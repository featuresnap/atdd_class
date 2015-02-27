require 'rubygems'
require 'watir-webdriver'
browser=Watir::Browser.new
browser.goto 'http://puppies.herokuapp.com'
browser.button(:value => 'View Details', :index => 0).click
browser.button(:value => 'Adopt Me!').click
browser.button(:value => 'Adopt Another Puppy').click
browser.button(:value => 'View Details', :index => 1).click
browser.button(:value => 'Adopt Me!').click
browser.button(:value => 'Complete the Adoption').click
