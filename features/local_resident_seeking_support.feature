Feature: Local Resident seeking Support
  As a local resident
  So that I can get support for a specific condition
  I want to find contact details for a local service specific to my need
  Tracker story ID: https://www.pivotaltracker.com/story/show/43946779

Background: organizations have been added to database
  
  Given the following organizations exist:
  | name                            | description                      | address        | postcode | website       |
  | Harrow Bereavement Counselling  | Harrow Bereavement Counselling   | 34 pinner road | HA1 4HZ  | http://a.com/ |
  | Indian Elders Association       | Care for the elderly             | 64 pinner road | HA1 4HA  | http://b.com/ |
  | Age UK                          | Care for the Elderly             | 84 pinner road | HA1 4HF  | http://c.com/ |

@show
@javascript
Scenario: Show all charities on homepage map
  Given I am on the home page
  Then I should see contact details for "Indian Elders Association", "Age UK" and "Harrow Bereavement Counselling"
  #And show me the page
  And I should see "Indian Elders Association", "Age UK" and "Harrow Bereavement Counselling" in the map centered on local organizations

# particularly want to provide visibility to organizations with no existing web presence
@javascript
Scenario: Find help with care for elderly
  Given I am on the home page
  When I search for "elderly"
  Then I should see contact details for "Indian Elders Association" and "Age UK"
  And I should see "Indian Elders Association"
  And I should see "Age UK"
  And I should see search results for "elderly" in the map

# starting within main site
@javascript
Scenario: Find a bereavement counsellor
  Given I am on the home page
  When I search for "Bereavement Counselling"
  Then I should see contact details for "Harrow Bereavement Counselling"



# starting with web search
Scenario: Searching Google for "death of a relative"
