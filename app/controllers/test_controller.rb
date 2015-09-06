class TestController < ApplicationController

  def test_login
    pass = 'test'
    @test_user = User.create(:first_name => 'test', :last_name => 'test', :username => 'test', :email => 'test@test.com', :password => pass, :password_confirmation => 'test')

    AccessController.try_login(@test_user, 'Wrong password', session)

    success = session[:username] == @test_user.username

    @test_user.destroy

    raise "Login failed" unless success

    session[:user_id] = nil
    session[:username] = nil

  end

  def index

  end

end
