@javascript
Feature: Buying an Offer
  In order to buy an Offer
  As a Logged User
  I want to go to checkout page

  Scenario: User can see the checkout page
    Given I am logged in
    And I am in the checkout page
    Then I should see make payment button
    Then I should see the apply coupon button

  Scenario: User buys an offer when He doesn't have a Payment Method
    Given I am logged in
    And I am in the checkout page
    Then I fill out the amount I want to pay
    And I click Make Payment
    Then I should be redirected to add a Payment Method
    Then I should see the payment form

  Scenario: User buys an offer when He has a Payment Method
    Given I am logged in
    And I have a Payment Method
    Then I am in the checkout page
    And I fill out the amount I want to pay
    And I click Make Payment
    Then I should be redirected to choose a Payment Method
    And I click Make Payment
    Then I should be redirected to the Offer page
    And I should see a message I just paid for this offer
