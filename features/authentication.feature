Feature: Users authentication
  As I user
  I want to sign up and make logins

  Scenario: Signing in
    Given a user exists with email: "user@gmail.com", password: "123456"
    And I go to the home page
    And I follow "Sign in"
    And I fill in "user[email]" with "user@gmail.com"
    And I fill in "user_password" with "123456"
    And I press "Sign in"
    Then I should see "Login realizado com sucesso."

  Scenario:  
    Given I go to the home page
    And I follow "Sign up"
    And I fill in "user_email" with "user@gmail.com"
    And I fill in "user_password" with "123456"
    And I fill in "user_password_confirmation" with "123456"
    And I press "Sign up"
    Then I should see "Login realizado com sucesso. Se não autorizado, a confirmação foi enviada por email."
    And I follow "Sign out"
    Then I should see "Logout realizado com sucesso."

