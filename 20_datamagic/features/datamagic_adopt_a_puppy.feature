Feature: Checkout with default data
  In order to checkout without specifying made up data
  As a adoption agency fulfillment agent
  I want to ensure the checkout works with default data

  Background:
    Given I am shopping for puppies

  Scenario: Example using default data
    When I view the puppy "Brook"
    And I click the adopt me button
    And I click the complete adoption button
    And I checkout
    Then I should see "Thank you for adopting a puppy"

  Scenario: Example using overriding default data
    When I view the puppy "Brook"
    And I click the adopt me button
    And I click the complete adoption button
    And I checkout using a purchase order
    Then I should see "Thank you for adopting a puppy"





