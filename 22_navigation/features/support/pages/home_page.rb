class HomePage
  include PageObject

  page_url 'http://puppies.herokuapp.com'

  divs(:name, :class => 'name')
  buttons(:view_detail, :value=> 'View Details')

  def select_puppy(name = 'Brook')
    index = name_elements.find_index {|div| div.text == name}
    view_detail_elements[index].click
  end

end