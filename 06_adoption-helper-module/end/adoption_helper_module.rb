module AdoptionHelper
 
  def adopt_puppy_number(puppy_number)
    @browser.button(:value => 'View Details', :index => puppy_number - 1).click
    @browser.button(:value => 'Adopt Me!').click
  end

end
