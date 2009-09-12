Given /^I am user "([^\"]*)"$/ do |login|
  Factory(:user, :login => login)
end

Given /^I fill in login information for "([^\"]*)"$/ do |login|
  fill_in('Login', :with => login)
  fill_in('Password', :with => 'password')
  click_button('Login')
end

Then /^I should be logged in as "([^\"]*)"$/ do |login|
  And %{I should be on the account page}
  controller.send(:current_user).should == User.find_by_login(login)
end

Given /^I am logged in as "([^\"]*)"$/ do |login|
  user = Factory(:user, :login => login)
  visit(login_path)
  fill_in('Login', :with => login)
  fill_in('Password', :with => 'password')
  click_button('Login')
  And %{I should be on the account page}
  controller.current_user.should == user
end

Then /^I should be logged out$/ do
  controller.current_user.should be_nil
end

Then /^I should fail login for "([^\"]*)"$/ do |login|
  And %{I should be on the login failed page}
  And %{I should be logged out}
end