require File.dirname(__FILE__) + '/../spec_helper'

class MyTestController < ApplicationController
  before_filter :require_no_user, :only => [:hello_world]
  
  def hello_world
    render(:text => 'hello!')
  end
  
  def ar_error
    User.find(1234567890)
  end
  
end

ActionController::Routing::Routes.draw do |map|
  map.with_options(:controller => 'my_test_controller') do |m|
    m.my_hello_world '/my/hello/world', :action => 'hello_world'
    m.my_ar_error '/my/ar/error', :action => 'ar_error'
  end
end

describe MyTestController do
  integrate_views
  
  describe 'require_no_user' do
  
    it 'should not show the page if you are already logged in' do
      login
      get :hello_world
      flash[:notice].should == 'You must be logged out to access this page'
      response.should redirect_to(my_account_url)
    end
    
  end
  
  describe 'rescue_from' do
    
    it 'should rescue from an AR::NotFound error' do
      get :ar_error
      response.code.should == '404'
      response.should render_template('application/404_not_found.html.erb')
    end
    
  end
  
end
