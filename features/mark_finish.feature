# priority 1
Feature: Mark that the user has finished a book
  As a reader
  I want to indicate when I have finished a book
  So that it's clear which books I have and haven't read

  Scenario: I finish a book
    Given I am logged into booknotes
      And I am looking at *A Tale for the Time Being*
      And the day is 2016-10-25
    When I click finished
    Then the note should indicate that I am finished with the book
     And the note's finished timestamp should be 2016-10-25
