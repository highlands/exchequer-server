@javascript
Feature: Buying an Offer
  In order to buy an offer
  As a logged in User
  I want to go to an invoice page

  Scenario: User can visit an invoice page
    Given I am logged in
    And I am on an offer page
    When I click on Purchase link
    Then I am on the invoice page
    And I should not see the Make Payment button
    And I should see the apply coupon button

  @javascript
  Scenario: User gives money to an offer. Thithe or Offering.
    Given I am logged in with a Payment Method
    And I am on an offer page that is a tithe or offering
    Then I click on Purchase link
    And I am on the invoice page
    And I fill out the amount I want to pay
    And I choose the Payment Method
    And I click Make Payment
    And I should be redirected to the Invoice page
    And I should see a message I just paid for this offer

  @javascript
  Scenario: User with a payment method buys an offer
    Given I am logged in with a Payment Method
    And I am on an offer page
    Then I click on Purchase link
    And I am on the invoice page
    And I fill out the amount I want to pay
    And I choose the Payment Method
    And I click Make Payment
    And I should be redirected to the Invoice page
    And I should see a message I just paid for this offer

  @javascript
  Scenario: User without a payment method attempts to buy an offer
    Given I am logged in
    And I am on an offer page
    Then I click on Purchase link
    And I am on the invoice page
    And I should see a link to Add a Payment Method
    And I fill out the amount I want to pay
    And I should not see the Make Payment button

  @javascript
  Scenario: User can only pay the full amount for a not deferrable offer
    Given I am logged in
    And I have a Payment Method
    And I am on an offer page from an undeferrable offer
    When I click on Purchase link
    Then I am on the invoice page
    And I choose the Payment Method
    And I click Pay full amount
    And I should be redirected to the Invoice page
    And I should see a message I just paid for this offer

  @javascript
  Scenario: After a full payment, I dont see the apply coupon button
    Given I am logged in
    And I have a Payment Method
    And I am on an offer page from an undeferrable offer
    When I click on Purchase link
    Then I am on the invoice page
    And I choose the Payment Method
    And I click Pay full amount
    And I should be redirected to the Invoice page
    And I should see a message I just paid for this offer
    And I should not see the apply coupon button

  @javascript
  Scenario: User can only pay the full amount torwards a not deferrable offer
    Given I am logged in
    And I have a Payment Method
    And I am on an offer page from an undeferrable offer
    When I click on Purchase link
    Then I can see the Pay full amount button
    And I dont see the Make payment button
