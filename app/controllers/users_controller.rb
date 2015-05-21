class UsersController < ApplicationController


  def new
    @user = User.new()
  end

  def create

    @user = User.new(user_params_signup)

    if @user.valid?
      @user.save
      flash[:notice] = "User created successfully."
      redirect_to(:controller => 'home', :action => 'index')
    else
      flash[:notice] = @user.errors.full_messages
      render('new')
    end

  end

  def show
    @user = User.find(session[:user_id])
  end

  def edit
    @user = User.find(session[:user_id])
  end

  def update
    @user = User.find(session[:user_id])
    if @user.update_attributes(user_params_edit)
      flash[:notice] = "User updated successfully."
      redirect_to(:action => 'show')
    else
       render('edit')
    end
  end

  private
  def user_params_signup
    params.require(:user).permit(:last_name, :first_name, :username, :password, :password_confirmation, :email)
  end

  def user_params_edit
    params.require(:user).permit(:last_name, :first_name, :email)
  end

end