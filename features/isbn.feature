# priority 1
Feature: Scan a book's ISBN
  As a reader
  I want to search for information about a book in my hand
  So that I do not have to manually enter that data

  Scenario: Scan ISBN with camera
    Given I have a book
      And I have my phone
      And I am logged into looking notes
    When I click scan
    Then looking notes should bring up the camera

  Scenario: Cancel scanning
    Given I am logged into looking notes
    When I click scan
     And I click cancel
    Then looking notes should remove the camera

  Scenario: Search WorldCat by ISBN-10
    Given I am logged into looking notes
    When I scan 0345497503
    Then I should be able to select *Kraken*

  Scenario: Search WorldCat by ISBN-13
    Given I am logged into looking notes
    When I scan 978-0345497505
    Then I should be able to select *Kraken*

  Scenario: Confirm search result
    Given I am logged into looking notes
      And I have scanned 978-0345497505
      And I see *Kraken* in the search results
    When I confirm that *Kraken* is the book
    Then *Kraken* should be added to my catalogue
