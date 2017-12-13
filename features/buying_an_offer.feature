Feature: Buying an Offer
  In order to buy an Offer
  As a Logged User
  I want to go to checkout page

  Scenario: User can see the checkout page
    Given I am logged in
    And I am in the checkout page
    Then I should see make payment button
    Then I should see the apply coupon button
