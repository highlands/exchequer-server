Feature: Applying a Coupon
  In order to apply a Coupon
  As a Logged User with a Coupon code
  I want to go to checkout page and apply my coupon code

  Scenario: User apply a valid coupon code
    Given I am logged in
    And I am in the checkout page
    And I have a valid coupon code
    Then I should see the apply coupon button
    And I fill in my coupon code
    And I click Apply Coupon
    Then I should be redirected to the Offer page
    And I should see a message saying my coupon was applied
    And I should see the coupon applied in my invoice

  Scenario: User apply an invalid coupon code
    Given I am logged in
    And I am in the checkout page
    Then I should see the apply coupon button
    And I fill in my coupon code
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
    And I should see a message saying I can only apply coupon in the full price
