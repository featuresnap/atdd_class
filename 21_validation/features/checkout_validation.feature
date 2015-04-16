Feature: Validating correct checkout values
  In order to have fulfill a requested puppy adoption
  As an adoption agency fulfillment agent
  I want to ensure the adopter provides all necessary information

  Scenario: Example using default data
    Given I am shopping for puppies
    When I view the puppy "Brook"
    And I click the adopt me button
    And I click the complete adoption button
    And I checkout with the name blank
    Then I should see "Name can't be blank"





