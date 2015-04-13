Feature: Make Different Kinds of Cheese
  As a cheese maker
  I want to make different kinds of cheese
  So that I have more flavor in my life


Scenario: Making blue cheese
  Given I have no cheese
  When I press the make blue cheese button
  Then I expect to have cheese

  Scenario: Making swiss cheese
    Given I have no cheese
    When I press the make swiss cheese button
    Then I expect to have cheese