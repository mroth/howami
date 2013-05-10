Feature: My bootstrapped app kinda works
  In order to get going on coding my awesome app
  I want to have aruba and cucumber setup
  So I don't have to do it myself

  Scenario: displaying help
    When I get help for "howami"
    Then the exit status should be 0
    And the banner should be present
    And the banner should document that this app takes options
    And the following options should be documented:
      |--version|
      |--auth|
    And the banner should document that this app takes no arguments

  Scenario: graceful error message when not authenticated
    Given howami is not authenticated
    When I run `howami`
    Then the output should contain "You need to authenticate first"
    And the exit status should be 1

  Scenario: clean configuring the app
    When I run `howami --auth` interactively
    And I type "6uaeuvtk7m5fe3q4o75invkbpf"
    Then the output should contain "Go to http://www.fitbit.com/oauth/authorize"

  Scenario: overwrites authentication when already authenticated
