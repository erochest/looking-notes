# priority 1
Feature: Add tags to describe a book
  As a reader
  I want to associate tags with a book
  So that I can search and change the visualization based on this metadata

  Scenario: Add tags to an existing book
    Given I am logged into booknotes
      And I have just added a note
    When I click to add a tag
    Then I should see the tag editing screen

  Scenario: Add tags to multiple books
    Given I am logged into booknotes
      And I have selected multiple notes
    When I click bulk edit
    Then I should see the tag editing screen
