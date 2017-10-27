Feature: Viewing Home
  In order to interact with the User framework
  As a visitor
  I want to view the home page

  Scenario: Visitor views the home page
    Given I am a visitor on the homepage
    Then I should see the exchequer headline
