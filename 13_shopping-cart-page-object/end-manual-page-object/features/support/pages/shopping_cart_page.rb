class ShoppingCartPage

  NAME_COLUMN = 1
  PRICE_COLUMN = 3

  def initialize(browser)
    @browser = browser
  end

  def proceed_to_checkout
    @browser.button(:value => 'Complete the Adoption').click
  end

  def continue_shopping
    @browser.button(:value => 'Adopt Another Puppy').click
  end

  def name_for_line(line_number)
    row_index = (line_number - 1) * 6
    @browser.table(:index => 0)[row_index][NAME_COLUMN].text
  end

  def price_for_line(line_number)
    row_index = (line_number - 1) * 6
    @browser.table(:index => 0)[row_index][PRICE_COLUMN].text
  end

  def total_amount
    @browser.td(:class => 'total_cell').text
  end

end