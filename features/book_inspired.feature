# priority 1
Feature: Indicate what book inspired the user to read a book
  As a reader
  I want to indicate what books inspired me to read this book
  So that I can trace influences on my reading.

  Scenario: Find a new influencing book by scanning its ISBN
    Given I am logged into looking notes
      And I am looking at *A Tale for the Time Being*
    When I click scan
    Then looking notes should bring up the camera

  Scenario: Find an existing influencing book by scanning its ISBN
    Given I am logged into looking notes
      And I am looking at *A Tale for the Time Being*
      And *Reflections on the Way to the Gallows* has a note
    When I scan 978-0520084216
    Then I should be able to select *Reflections on the Way to the Gallows*

  Scenario: Search for an existing book as the influencing book
    Given I am logged into looking notes
      And I am looking at *A Tale for the Time Being*
      And *Reflections on the Way to the Gallows* has a note
    When I click search
    Then I should see a search box
     And I should see a list of existing notes
     And *Reflections on the Way to the Gallows* should be in the results

  Scenario: Link an existing book as the influencing book
    Given I am logged into looking notes
      And I am looking at *A Tale for the Time Being*
      And *Reflections on the Way to the Gallows* has a note
      And I click search
    When I type "Reflections" in the search box
    Then the list of notes should narrow
     And *Reflections on the Way to the Gallows* should be in the results
