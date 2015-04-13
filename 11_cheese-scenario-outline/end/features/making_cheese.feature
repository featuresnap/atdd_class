Feature: Make Different Kinds of Cheese
  As a cheese maker
  I want to make different kinds of cheese
  So that I have more flavor in my life

  Scenario Outline: Making cheese
    Given I have no cheese
    When I press the make <cheese type> button
    Then I expect to have cheese
    Examples:
    |cheese type|
    |blue       |
    |swiss      |
