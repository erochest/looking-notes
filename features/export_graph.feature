# priority 1
Feature: Export the graph as JSON-LD
  As a site author
  I want to export my entire reading program as JSON-LD
  So that I can incorporate that information into my site.

  Scenario: Download
    Given I am logged into booknotes
      And I am looking at the settings page
    When I click export
    Then it should download a JSON-LD file

  Scenario: API
    Given I have an API key for booknotes
    When I query the REST interface for all notes
    Then it should respond with the notes as JSON-LD
