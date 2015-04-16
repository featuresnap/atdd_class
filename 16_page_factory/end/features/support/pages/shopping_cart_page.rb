class ShoppingCartPage
  include PageObject

  NAME_COLUMN = 1
  PRICE_COLUMN = 3

  button(:proceed_to_checkout, :value => 'Complete the Adoption')
  button(:continue_shopping, :value => 'Adopt Another Puppy')
  table(:cart, :index => 0)
  cell(:cart_total, :class => 'total_cell')

  def name_for_line(line_number)
    row_index = (line_number - 1) * 6
    cart_element[row_index][NAME_COLUMN].text
  end

  def price_for_line(line_number)
    row_index = (line_number - 1) * 6
    cart_element[row_index][PRICE_COLUMN].text
  end

  def total_amount
    cart_total_element.text
  end

end