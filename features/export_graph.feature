# priority 1
Feature: Export the graph as JSON-LD
  As a site author
  I want to export my entire reading program as JSON-LD
  So that I can incorporate that information into my site.

  Scenario: Download
    Given I am logged into booknotes
      And I am looking at the settings page
      And I have a note for *A Tale for the Time Being*
    When I click export
    Then it should download a JSON-LD file
     And it should contain *A Tale for the Time Being*

  Scenario: API
    Given I have an API key for booknotes
      And I have a note for *A Tale for the Time Being*
    When I query the REST interface for all notes
    Then it should respond with the notes as JSON-LD
     And it should contain *A Tale for the Time Being*
