class OrderPage
  include PageObject
  include DataMagic


  text_area(:address, :id => 'order_address')
  text_field(:email, :id => 'order_email')
  text_field(:name, :id => 'order_name')
  select(:pay_type, :id => 'order_pay_type')
  button(:place_order, :value => 'Place Order')
  div(:error_list, id: 'error_explanation')
  unordered_list(:errors) { |page|
      page.error_list_element.unordered_list_element
  }

  def checkout(order = {})
    populate_page_with data_for(:checkout_page, order)
    place_order
  end

end