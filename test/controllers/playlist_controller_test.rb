require 'test_helper'

class PlaylistControllerTest < ActionController::TestCase
  test "should get play_song" do
    get :play_song
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

end
