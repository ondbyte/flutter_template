Feature: Splash page.

  Scenario: The splash page shows on initial launch.

    Given the app is turned on
    Then I should see {'The only place to resolve an argument!'}