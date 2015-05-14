class UsersController < ApplicationController


  def new
    @user = User.new()
  end

  def create

    @user = User.new(user_params)

    if @user.valid?
      @user.save
      flash[:notice] = "User created successfully."
      redirect_to(:controller => 'home', :action => 'index')
    else
      flash[:notice] = @user.errors.full_messages
      render('new')
    end

  end


  private
  def user_params
    params.require(:user).permit(:last_name, :first_name, :username, :password, :password_confirmation, :email, :created_at)
  end

end