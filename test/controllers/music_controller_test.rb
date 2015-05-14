require 'test_helper'

class MusicControllerTest < ActionController::TestCase
  test "should get playlist" do
    get :playlist
    assert_response :success
  end

  test "should get song" do
    get :song
    assert_response :success
  end

  test "should get new_playlist" do
    get :new_playlist
    assert_response :success
  end

  test "should get new_song" do
    get :new_song
    assert_response :success
  end

  test "should get delete_song" do
    get :delete_song
    assert_response :success
  end

  test "should get delete_playlist" do
    get :delete_playlist
    assert_response :success
  end

end
