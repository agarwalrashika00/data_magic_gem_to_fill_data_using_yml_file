Feature: populate page with data

    Scenario Outline: populate the page with data in yaml file
        Given I am on the site
        When I populate the page with data for <user>
        Then submit the form and take screenshot of the output for <user>

    Examples:
    | user |
    | "user1" |
    | "user2" |