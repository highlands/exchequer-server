Feature: Seeing an Offer
  In order to buy an offer
  As a logged in user
  I would like to visit an offer and see its details

  Scenario: User sees the Purchase link on the offer page
    Given I am logged in
    When I am on an offer page
    Then I should see the Purchase link
    And I should see I dont have an invoice yet

  Scenario: User clicks on the Purchase link on the offer page
    Given I am logged in
    When I am on an offer page
    Then I should see the Purchase link
    And I should see I dont have an invoice yet
    When I click on Purchase link
    Then I should be redirected to my invoices
