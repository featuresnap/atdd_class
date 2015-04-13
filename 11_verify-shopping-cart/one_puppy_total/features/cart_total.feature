Feature: Shopping Cart Displays Total
  As a prospective puppy owner
  I want to see the total for the puppies and optional items in my shopping cart
  So that I know I can afford my order before completing the adoption

  Scenario: Shopping cart displays name, item price, and cart total for one puppy
    Given I am looking for a puppy to adopt
    When I adopt puppy 1
    Then I should see "Brook" as the name for line item 1
    And I should see $34.95 as the subtotal for line item 1
    And I should see $34.95 as the total for the cart