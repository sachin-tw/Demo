@Demo1
Feature: Demo1 Feature

  Background: Demo1 Background
#    Fetched from karate-config.js
    * url apiUrlDemo

#    Calling JS Code
    * def timeValidator = read('classpath:utilities/timeValidator.js')

#    Using common data file - Data Driven Scenarios
    * def userReqBody = read('classpath:testData/dataFormat.json')

#    For Logging pretty format response
    * configure logPrettyResponse = true

  @ScenarioExample @perf
#    Below TC will run only once
  Scenario: Demo1 Get Request
    Given path userReqBody.demo.path
    And param page = 2
    When method Get
    Then status 200
#    Printing response and validating type
    And print response
    And match responseType == 'json'
#    Validating individual fields or objects
    And match response.data[0] == {"last_name":"Lawson","id":7,"avatar":"https:\/\/reqres.in\/img\/faces\/7-image.jpg","first_name":"Michael","email":"michael.lawson@reqres.in"}
#    Fetching fields from response
    And def variableExample1 = get response.data[0].last_name
    And print variableExample1

  @ScenarioOutlineExample
#    Below TC will run for each of the examples listed below - Data Driven Scenarios
  Scenario Outline: Demo1 Post Request
    And path userReqBody.demo.path
#    Passing request body from common data file and iterating it for examples
    And request userReqBody.demo.<requestBody>
    When method Post
    Then status 201
#    Schema Validation
    And match response == userReqBody.demo.<responseBody>
    Examples:
      | requestBody | responseBody |
      | request     | response     |
      | request2    | response2    |

# Topics to be covered as part of 1st Session
#  Configuration Management
#  Data Driven Scenarios and Parameterization
#  Code/Schema Validation
#  API Call frequency
#  Running custom Java/Js code
#  Performance Testing
#  Reporting