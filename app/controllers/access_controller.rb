class AccessController < ApplicationController

  layout 'application'

  before_action :confirm_logged_in,
                :except => ['login', 'attempt_login', :logout]

  def login
  end

  def attempt_login

    if params[:username] && params[:password]

      user = User.where(:username => params[:username]).first

      if user && user.authenticate(params[:password])
        flash[:notice] = "Logged in successfully!"
        session[:user_id] = user.id
        session[:username] = user.username
        redirect_to(root_path)
      else
        flash[:notice] = "Wrong username or password!"
        redirect_to(:action => 'login')
      end


    end

  end

  def logout
    flash[:notice] = "Logged out"
    session[:user_id] = nil
    session[:username] = nil
    redirect_to(:controller => 'home', :action => 'index')
  end

end
