class UsersController < ApplicationController
  def login 
    session[:user_id] = nil
    if request.post?
      user = User.authenticate(params[:username], params[:password])
      if user
        session[:user_id] = user.id
        redirect_to :controller => 'tweets', :action => 'index'
      else
        flash[:notice] = 'Invalid username/password'
      end
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to :controller => 'tweets', :action => 'index'
  end
end
