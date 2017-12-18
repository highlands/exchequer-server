Feature: Applying a Coupon
  In order to apply a Coupon
  As a Logged User with a Coupon code
  I want to go to checkout page and apply my coupon code

  Scenario: User applies a valid coupon code
    Given I am logged in
    And I am in the checkout page
    And I have a valid coupon code
    Then I should see the apply coupon button
    And I fill in my coupon code
    And I click Apply Coupon
    Then I should be redirected to the Offer page
    And I should see a message saying my coupon was applied
    And I should see the coupon applied in my invoice

  Scenario: Coupon codes are case insensitive
    Given I am logged in
    And I am in the checkout page
    And I have a valid coupon code for DAILY
    Then I should see the apply coupon button
    And I fill in my coupon code with daily, downcase
    And I click Apply Coupon
    Then I should be redirected to the Offer page
    And I should see a message saying my coupon was applied
    And I should see the coupon applied in my invoice

  Scenario: User should not see Apply Coupon button after applied
    Given I am logged in
    And I am in the checkout page
    And I have a valid coupon code
    Then I should see the apply coupon button
    And I fill in my coupon code
    And I click Apply Coupon
    Then I should be redirected to the Offer page
    And I should see a message saying my coupon was applied
    And I should see the coupon applied in my invoice
    And I should not see the apply coupon button


  Scenario: User apply an unexistent coupon code
    Given I am logged in
    And I am in the checkout page
    Then I should see the apply coupon button
    And I fill in a wrong coupon code
    And I click Apply Coupon
    Then I should be redirected to the Offer page
    And I should see a message saying my coupon does not exist

  Scenario: User tries to apply a coupon in a Offer with payments
    Given I am logged in
    And I am in the checkout page
    And I have a valid coupon code
    And I have some payments for this offer
    And I can see in the invoice some transactions
    Then I should see the apply coupon button
    And I fill in my coupon code
    And I click Apply Coupon
    Then I should be redirected to the Offer page
    And I should see a message saying I can't apply a coupon after made a payment

