@~ignore
Feature: Create Token

  Background: Reusable Steps
    * url apiUrlDemo
    * def environment = env
    * def paths = read('classpath:resources/paths.json')

  Scenario: Demo2 Get Request
    Given path paths.demo
    And param page = 2
    When method Get
    Then status 200


