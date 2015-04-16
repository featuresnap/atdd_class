Feature: Supplying data
  In order to have enough information to complete a puppy adoption
  As a adoption agency fulfillment agent
  I want to ensure the adopter provides all necessary information


  Scenario: Example using default data
    Given I am shopping for puppies
    When I view the puppy "Brook"
    And I click the adopt me button
    And I click the complete adoption button
    And I checkout
    Then I should see "Thank you for adopting a puppy"

  Scenario: Example using overriding default data
    Given I am shopping for puppies
    When I view the puppy "Brook"
    And I click the adopt me button
    And I click the complete adoption button
    And I checkout using a purchase order
    Then I should see "Thank you for adopting a puppy"





