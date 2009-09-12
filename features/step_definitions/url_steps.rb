Then /^I should see the 404 page$/ do
  And %{I should see "We could not find the page you are looking for"}
  response.status.should == '404 Not Found'
end