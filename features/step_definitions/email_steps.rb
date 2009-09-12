Then /^I should receive a welcome email for "([^\"]*)"$/ do |login|
  email = ActionMailer::Base.deliveries.first
  email.should_not be_nil
  email.subject.should == 'Welcome to NotifyHub.com!'
  email.body.should match(/username: #{login}/)
  email.from.should == [configatron.emails.welcome.from]
end