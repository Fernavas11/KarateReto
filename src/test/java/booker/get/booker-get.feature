Feature: GetBooking tests


  Scenario Outline: Get details of reservation <caseName>

    Given url 'https://restful-booker.herokuapp.com/booking/<Id>'
    And header Accept = 'application/json'
    When method GET
    Then status <code>
    Examples:
      | caseName       | Id    | code |
      | Id correcto    | 50    | 200  |
      | Id incorrecto  | 10000 | 404  |
      | Id no numerico | hj    | 404  |


    Scenario: Response validation JSON

      * def jsonResponse = read('user.json')

      Given url 'https://restful-booker.herokuapp.com/booking/6'
      And header Accept = 'application/json'
      When method GET
      Then match $.firstname == jsonResponse.firstname
      * match $.lastname == jsonResponse.lastname
      * match $.totalprice == jsonResponse.totalprice
      * match $.depositpaid == jsonResponse.depositpaid
      * match $ == jsonResponse












