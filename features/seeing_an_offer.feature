Feature: Seeing an Offer
  In order to buy an Offer
  As a Logged User
  I am in the Offer Page

  Scenario: User can see the Create Invoice link
    Given I am logged in
    And I am in the offer page
    Then I should see the Create Invoice link
    And I should see I dont have any invoice yet

  Scenario: User clicks on Create Invoice
    Given I am logged in
    And I am in the offer page
    Then I should see the Create Invoice link
    And I should see I dont have any invoice yet
    Then I click on Create Invoice link
    Then I should be redirected to
