Then /^I should receive a password reset email for "([^\"]*)"$/ do |login|
  user = User.find_by_login(login)
  email = ActionMailer::Base.deliveries.first
  email.should_not be_nil
  email.subject.should == 'Password Reset Instructions'
  email.body.should match(/\/password_resets\/#{user.perishable_token}/)
  email.from.should == [configatron.emails.password_reset_instructions.from]
end

When /^I click on the password reset link for "([^\"]*)"$/ do |login|
  user = User.find_by_login(login)
  visit(password_reset_path(user.perishable_token))
end

When /^I click on a bad password reset link$/ do
  visit(password_reset_path(123456789))
end