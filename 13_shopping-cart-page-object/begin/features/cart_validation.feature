Feature: Shopping Cart Validation
  As a prospective puppy owner
  I want to confirm the details of my order before I check out
  So that I do not overspend or order a puppy I did not mean to

  Scenario: Validate cart with one puppy
    Given I am looking for a puppy to adopt
    When I adopt puppy 1
    Then I should see "Brook" as the name for line item 1
    And I should see "$34.95" as the subtotal for line item 1
    And I should see "$34.95" as the total for the cart

  Scenario: Validate cart with two puppies
    Given I am looking for a puppy to adopt
    And I adopt puppy 1
    And I adopt another puppy
    When I adopt puppy 2
    Then I should see "Brook" as the name for line item 1
    And I should see "$34.95" as the subtotal for line item 1
    And I should see "Hanna" as the name for line item 2
    And I should see "$22.99" as the subtotal for line item 2
    And I should see "$57.94" as the total for the cart