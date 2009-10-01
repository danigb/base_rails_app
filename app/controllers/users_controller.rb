class UsersController < ApplicationController
  inherit_resources
  
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:show, :edit, :update, :index]
  
  actions :all, :except => [:destroy]
  
  def index
    redirect_to(my_account_url)
  end
  
  def create
    create! do |success, failure|
      success.html {
        PostmanWorker.deliver_welcome_email(@user)
        flash[:notice] = "Account registered!"
        redirect_back_or_default my_account_url
      }
    end
  end
  
  def update
    update! do |success, failure|
      success.html {
        flash[:notice] = "Account updated!"
        redirect_to my_account_url
      }
    end
  end
  
  private
  def resource
    @user = current_user
  end

end