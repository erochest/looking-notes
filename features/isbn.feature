# priority 1
Feature: Scan a book's ISBN
  As a reader
  I want to search for information about a book in my hand
  So that I do not have to manually enter that data

  Scenario: Scan ISBN with camera
    Given I have a book I wish to read
      And I have my phone
      And I am logged into booknotes
    When I click to scan a book
    Then I should get a camera

  Scenario: Search WorldCat by ISBN
    Given I am logged into booknotes
    When I scan a barcode
    Then I should see a result from WorldCat

  Scenario: Confirm search result
    Given I am logged into booknotes
      And I have scanned a barcode
      And I have a search result from WorldCat
    When I confirm that the result is correct
    Then The book should be added to my catalogue
