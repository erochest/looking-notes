
'use strict';

function pending(cb) {
  cb(null, 'pending');
}

module.exports = function() {
  this.Given(/^I am logged into looking notes$/, pending);
  this.Given(/^I have selected multiple notes$/, pending);
  this.Given(/^I have just added (.*)$/, pending);
  this.Given(/^the day is (\d+-\d+-\d+)$/, pending);
  this.Given(/^I am looking at (.*)$/, pending);
  this.Given(/^I see (.*) in the search results$/, pending);
  this.Given(/^I have scanned ([\d-]*)$/, pending);
  this.Given(/^I have my phone$/, pending);
  this.Given(/^I have a book$/, pending);
  this.Given(/^I have a note for (.*)$/, pending);
  this.Given(/^I have an API key for looking notes$/, pending);
  this.Given(/^(.*) has a note$/, pending);

  this.When(/^I enter the tags (.*)$/, pending);
  this.When(/^I confirm that (.*) is the book$/, pending);
  this.When(/^I scan ([\d-]*)$/, pending);
  this.When(/^I query the REST interface for all notes$/, pending);
  this.When(/^I click ([\w-]+)$/, pending);
  this.When(/^I type "([^"]*)" in the (\w+) box$/, pending);

  this.Then(/^I should see the tag editing screen$/, pending);
  this.Then(/^(.*) should be a tag$/, pending);
  this.Then(/^(.*) should have (\d+) tags$/, pending);
  this.Then(/^the note's finished timestamp should be (\d+-\d+-\d+)$/,
            pending);
  this.Then(/^the note should indicate that I am finished with the book$/,
            pending);
  this.Then(/^(.*) should be added to my catalogue$/, pending);
  this.Then(/^I should be able to select (.*)$/, pending);
  this.Then(/^looking notes should bring up the camera$/, pending);
  this.Then(/^it should contain (.*)$/, pending);
  this.Then(/^it should respond with the notes as JSON\-LD$/, pending);
  this.Then(/^it should download a JSON\-LD file$/, pending);
  this.Then(/^(.*) should be in the results$/, pending);
  this.Then(/^the list of notes should narrow$/, pending);
  this.Then(/^I should see a list of existing notes$/, pending);
  this.Then(/^I should see a search box$/, pending);
  this.Then(/^I should see the existing entry$/, pending);
}
