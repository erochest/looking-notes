# priority 1
Feature: Indicate what book inspired the user to read a book
  As a reader
  I want to indicate what books inspired me to read this book
  So that I can trace influences on my reading.

  Scenario: Find a new influencing book by scanning its ISBN
    Given I am logged into booknotes
      And I am looking at *A Tale for the Time Being*
    When I click to scan an influence
    Then I should get a camera

  Scenario: Find an existing influencing book by scanning its ISBN
    Given I am logged into booknotes
      And I am looking at *A Tale for the Time Being*
      And *Reflections on the Way to the Gallows* has a note
    When I scan a barcode
    Then I should see the existing entry

  Scenario: Search for an existing book as the influencing book
    Given I am logged into booknotes
      And I am looking at *A Tale for the Time Being*
      And *Reflections on the Way to the Gallows* has a note
    When I click to search for an influence
    Then I should see a search box
     And I should see a list of existing notes
     And *Reflections on the Way to the Gallows* should be in the results

  Scenario: Link an existing book as the influencing book
    Given I am logged into booknotes
      And I am looking at *A Tale for the Time Being*
      And "Reflections on the Way to the Gallows* has a note
      And I click to search for an influence
    When I type "Reflections" in the search box
    Then the list of notes should narrow
     And *Reflections on the Way to the Gallows* should be in the results
