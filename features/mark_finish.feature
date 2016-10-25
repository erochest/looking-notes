# priority 1
Feature: Mark that the user has finished a book
  As a reader
  I want to indicate when I have finished a book
  So that it's clear which books I have and haven't read

  Scenario: I finish a book
    Given I am logged into booknotes
      And I find the note for my current book
    When I click that I am done with the book
    Then the note should indicate that I am finished with the book
     And the note should have a timestamp telling when I finished
