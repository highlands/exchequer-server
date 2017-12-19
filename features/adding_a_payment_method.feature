Feature: Adding a Payment Method
  In order to buy an Offer
  As a Logged User
  I want to buy and add a Payment Method

  Scenario: User buys an offer when He doesn't have a Payment Method
    Given I am logged in
    And I am in the offer page
    Then I click on Create Invoice link
    And I am in the invoice page
    Then I fill out the amount I want to pay
    And I click Make Payment
    Then I should be redirected to add a Payment Method
    Then I should see the payment form
