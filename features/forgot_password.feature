Feature: Forgot password
  In order to manage my account
  As a user
  I want to be able to reset my password

  Scenario: Forgot Password
    Given I am user "bobsmith"
    When I am on the login page
    And I follow "Forgot Your Password?"
    And I fill in "Email" with "bobsmith@example.com"
    And I press "Reset my password"
    Then I should be on the login page
    And I should see "Instructions to reset your password have been emailed to you. Please check your email."
    And I should receive a password reset email for "bobsmith"
    When I click on the password reset link for "bobsmith"
    And I should see "Change My Password"
    And I fill in "Password" with "123456"
    And I fill in "Password Confirmation" with "123456"
    Then I press "Update my password and log me in"
    And I should be logged in as "bobsmith"
    And I should see "Password successfully updated"
    
  Scenario: Forgot Password mistype password
    Given I am user "bobsmith"
    When I am on the login page
    And I follow "Forgot Your Password?"
    And I fill in "Email" with "bobsmith@example.com"
    And I press "Reset my password"
    Then I should be on the login page
    And I should see "Instructions to reset your password have been emailed to you. Please check your email."
    And I should receive a password reset email for "bobsmith"
    When I click on the password reset link for "bobsmith"
    And I should see "Change My Password"
    And I fill in "Password" with "123456"
    And I fill in "Password Confirmation" with "1234567"
    Then I press "Update my password and log me in"
    Then I should see "Password doesn't match confirmation"
    
  Scenario: Forgot Password invalid user
    Given I am on the login page
    And I follow "Forgot Your Password?"
    And I fill in "Email" with "unknown@example.com"
    And I press "Reset my password"
    Then I should be on the unknown reset password page
    And I should see "No user was found with that email address."

  Scenario: Forgot Password with bad token
    Given I am user "bobsmith"
    When I am on the login page
    And I follow "Forgot Your Password?"
    And I fill in "Email" with "bobsmith@example.com"
    And I press "Reset my password"
    Then I should be on the login page
    And I should see "Instructions to reset your password have been emailed to you. Please check your email."
    And I should receive a password reset email for "bobsmith"
    When I click on a bad password reset link
    Then I should see "Sorry, but we could not locate your account. If you are having issues try copying and pasting the URL from your email into your browser or restarting the reset password process."
  
  