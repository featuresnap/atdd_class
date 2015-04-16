class HomePage
  include PageObject

  buttons(:view_detail, :value => 'View Details')
  paragraph(:notice, :id => 'notice')

  def view_details_for_puppy(puppy_number)
    index = puppy_number - 1
    view_detail_elements[index].click
  end

  def adoption_completed
    notice.include? "Thank you for adopting a puppy!"
  end

end