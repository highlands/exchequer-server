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
  Scenario: User buys an offer when He has a Payment Method
    Given I am logged in with a Payment Method
    Then I am in the checkout page
    And I fill out the amount I want to pay
    And I choose the Payment Method
    And I click Make Payment
    Then I should be redirected to the Offer page
    And I should see a message I just paid for this offer

  @javascript
  Scenario: User tries to buy an expired an offer
    Given I am logged in
    And I have a Payment Method
    Then I am in the checkout page seeing an expired offer
    And I fill out the amount I want to pay
    And I click Make Payment
    Then I should be redirected to the Offer page
    And I should see a message You cannot pay for this offer anymore

  @javascript
  Scenario: User tries to pay not the full price for a undeferrable offer
    Given I am logged in
    And I have a Payment Method
    Then I am in the checkout page seeing an undeferrable offer whose amount is 100
    And I fill out 1 USD as the amount I want to pay
    And I click Make Payment
    Then I should be redirected to the Offer page
    And I should see a message You cannot make a partial payment towards this offer
