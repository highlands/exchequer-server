Feature: Adding a Payment Method
  In order to buy an offer
  As a logged in user
  I want to add my payment details

  Scenario: User without a Payment Method attempts to buy an offer
    Given I am logged in
    And I am on an offer page
    And I click on Purchase link
    And I am on the invoice page
    When I click Add a Payment Method
    Then I should be redirected to add a Payment Method
    And I should see the payment form
