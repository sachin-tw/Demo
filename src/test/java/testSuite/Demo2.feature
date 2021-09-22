@Demo2
Feature: Demo2 Feature

  Background: Demo2 Background
    * url apiUrlDemo
    * def timeValidator = read('classpath:utilities/timeValidator.js')
    * def userReqBody = read('classpath:resources/demo.json')
    * def paths = read('classpath:resources/paths.json')
#    Calling Custom Java Code
    * def message = Java.type('utilities.JavaCodeExample').callJavaCode()
    * print message
#    Calling only once for whole Test suite
    * def totalPages = karate.callSingle('classpath:testSuite/Auth.feature').response.total
#    callonce - per feature/module, call will run each scenario
    * print totalPages

    * configure logPrettyResponse = true

  @SignUp @perf
  Scenario: Demo2 Get Request
    Given path paths.demo
    And param page = 3
    When method Get
    Then status 200

  @Login
  Scenario: Demo2 Post Request
    Given path paths.demo
    And request userReqBody.request
    When method Post
    Then status 201
    And match response == userReqBody.response

    @NewTestCase @perf
    Scenario: New Test Case
      Given path '/newPath'
      When Get
      Then status 200
      And match response == {"name":"Demo"}


#      Basic Auth, Authorization , Signature Validation, Encryption

