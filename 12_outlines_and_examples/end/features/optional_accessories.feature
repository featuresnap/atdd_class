Feature: Shopping Cart Validation
  As a prospective puppy owner
  I want to see accessories that I may need for my puppy
  So that I am well equipped to care for it

  Scenario Outline: Shopping cart offers common accessories
    Given I am looking for a puppy to adopt
    When I adopt puppy 1
    Then I should see "<accessory>" as an optional accessory
  Examples:
    | accessory       |
    | Collar & Leash  |
    | Chew Toy        |
    | Travel Carrier  |
    | First Vet Visit |
