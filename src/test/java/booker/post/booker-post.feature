Feature: create booking test

  @uno
  Scenario: successful token creation

    Given url 'https://restful-booker.herokuapp.com/auth'
    And request { "username" : "admin", "password" : "password123" }
    When method post
    Then status 200
    And def authToke = $.token


  Scenario Outline:  authentication token <case name>
    Given url 'https://restful-booker.herokuapp.com/auth'
    And request { "<username>": "<vauser>", "<password>": "<vapassword>" }
    When method post
    Then status 200
    And def <authToken> = $.reason
    And def mensajeAlerta = <authToken>

    Examples:
      | case name        | username | vauser | password | vapassword  | authToken     |
      | empty name       | username |        | password | password123 | mensajeAlerta |
      | empty password   | username | admin  | password |             | mensajeAlerta |
      | empty fields     | username |        | password |             | mensajeAlerta |



 @create
  Scenario: create booking
    * def val = read ("req.json")
    Given url 'https://restful-booker.herokuapp.com/booking'
    And request val
    And header Accept = 'application/json'
    When method post
    Then status 200
    * def obj = $.booking
    * match obj == val
    * def id = $.bookingid


  Scenario Outline: post users

    Given url 'https://restful-booker.herokuapp.com/booking'
    And request { "firstname": "#(firstname)", "lastname": "#(lastname)", "totalprice": 111, "depositpaid": true, "bookingdates": { "checkin": "2018-01-01", "checkout": "2019-01-01" }, "additionalneeds": "Breakfast" }
    And header Accept = 'application/json'
    When method post
    Then status 200
    * match response == { "bookingid": '#number', "booking": "#object" }
    * match response.booking.firstname == '<firstname>'
    * match response.booking.lastname == '<lastname>'
    * match response.booking.additionalneeds == "Breakfast"
    * match response.booking.totalprice == 111

    Examples:
      | firstname | lastname |
      | Fernando  | Navas    |
      | Jose      | Burgos   |
      | Camilo    | Mercado  |


