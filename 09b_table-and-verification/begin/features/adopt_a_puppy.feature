Feature: Adopt A Puppy
  As an animal lover
  I want to adopt a puppy
  So that I can have a great companion and give a puppy a better life

  Background:
    Given I am looking for a puppy to adopt

  Scenario: Adopt One Puppy
    When I adopt puppy 1
    And I complete the adoption
    And I enter the name "Jim Bob"
    And I enter the address "123 Main Street\nCleveland, OH 44113"
    And I enter the contact email "jimbob@atdd.com"
    And I enter "Check" as the payment type
    And I place my order
    Then I should see the message "Thank you for adopting a puppy!"

 Scenario: Adopt Two Puppies
   When I adopt puppy 1
   And I adopt another puppy
   And I adopt puppy 2
   And I complete the adoption
   And I enter the name "Jim Bob"
   And I enter the address "123 Main Street Cleveland, OH 44113"
   And I enter the contact email "jimbob@atdd.com"
   And I enter "Check" as the payment type
   And I place my order
   Then I should see the message "Thank you for adopting a puppy!"