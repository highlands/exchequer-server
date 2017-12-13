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

  @javascript
  Scenario: User buys an offer
    Given I am logged in
    And I am in the checkout page
    Then I fill out the amount I want to pay
    And I click Make Payment
    Then I should be redirected to choose my Payment Method
    Then I should see the payment form

  Scenario: User buys an offer when user has a Payment Method
    Given I am logged in
