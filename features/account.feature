Feature: Account
  In order to use the site
  As a user
  I want to be able to manage my account

  Scenario: Login
    Given I am user "bobsmith"
    And I am on the login page
    And I fill in login information for "bobsmith"
    Then I should be logged in as "bobsmith"
  
  Scenario: Logout
    Given I am logged in as "bobsmith"
    And I follow "logout"
    Then I should be logged out
    
  Scenario: Invalid Login
    Given I am on the login page
    And I fill in login information for "bobsmith"
    Then I should fail login for "bobsmith"
    
  Scenario: Registration
    Given I am on the registration page
    And I fill in "Login" with "bobsmith"
    And I fill in "Email" with "bobsmith@example.com"
    And I fill in "Password" with "password"
    And I fill in "Password Confirmation" with "password"
    And I press "Save"
    Then I should be logged in as "bobsmith"
    Then "bobsmith@example.com" should receive an email
    When I open the email
    Then I should see "Welcome to MyWebSite.com!" in the email subject
    And I should see "username: bobsmith" in the email body
    
  Scenario: Failed Registration
    Given I am on the registration page
    And I fill in "Login" with "bobsmith"
    And I fill in "Email" with "bobsmith@example.com"
    And I fill in "Password" with "password"
    And I fill in "Password Confirmation" with "23456789"
    And I press "Save"
    Then I should see "Password doesn't match confirmation"
    
  Scenario: Update Account
    Given I am logged in as "bobsmith"
    And I am on the account edit page
    And I fill in "Login" with "bobsmith"
    And I fill in "Email" with "bobsmith@example.com"
    And I fill in "Password" with "password"
    And I fill in "Password Confirmation" with "password"
    And I press "Save"
    Then I should see "Account updated!"
    
  Scenario: Update Account
    Given I am logged in as "bobsmith"
    And I am on the account edit page
    And I fill in "Login" with "bobsmith"
    And I fill in "Email" with "bobsmith@example.com"
    And I fill in "Password" with "password"
    And I fill in "Password Confirmation" with "1234567890"
    And I press "Save"
    Then I should see "Password doesn't match confirmation"