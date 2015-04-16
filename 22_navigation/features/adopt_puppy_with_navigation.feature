Feature: Remove implementation details
  In order to remove implementation details from my steps
  As a student
  I want to express behavior in terms of the business and more concisely

  Scenario: Simple adoption checkout test
    Given I am shopping for puppies
    When I complete the adoption
    Then I should see "Thank you for adopting a puppy"
