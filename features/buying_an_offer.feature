@javascript
Feature: Buying an Offer
  In order to buy an Offer
  As a Logged User
  I want to go to checkout page

  Scenario: User can see the checkout page
    Given I am logged in
    And I am in the checkout page
    Then I should not see the Make Payment button
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
  Scenario: User tries to buy when he does not have a Payment Method
    Given I am logged in
    Then I am in the checkout page
    And I should see a link to Add a Payment Method
    And I fill out the amount I want to pay
    And I should not see the Make Payment button

  @javascript
  Scenario: User can only pay the full amount for a not deferrable offer
    Given I am logged in
    And I have a Payment Method
    Then I am in the checkout page seeing an undeferrable offer whose amount is 100
    And I choose the Payment Method
    And I click Pay full amount
    Then I should be redirected to the Offer page
    And I should see a message I just paid for this offer

  @javascript
  Scenario: User can only see the Pay full amount button and not the make payment button for a not deferrable offer
    Given I am logged in
    And I have a Payment Method
    Then I am in the checkout page seeing an undeferrable offer whose amount is 100
    And I can see the Pay full amount button
    And I dont see the Make payment button
