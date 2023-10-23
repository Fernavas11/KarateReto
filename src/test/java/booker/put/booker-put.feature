Feature: UpdateBooking test


  Scenario: Update reservation details

    * def otroEscenario = call read('../post/booker-post.feature@uno')
    * def authToken = otroEscenario.authToke
    * def getId = call read('../post/booker-post.feature@create')
    * def ID = getId.id

    Given url 'https://restful-booker.herokuapp.com/booking/' + ID
    And request read ("request.json")
    And header Accept = 'application/json'
    And header Cookie = "token=" + authToken
    When method put
    Then status 200
    And match response.firstname == "Fer"
    And match response.lastname == "Navas"
    And match response.totalprice == 222


