class MusicController < ApplicationController

  layout 'application'

  before_action :confirm_logged_in

  def songs_index
    # select from current user - session[:user_id] and group by artist
    @my_music   = Song.where(:user_id => session[:user_id])
  end

  def playlists_index
    @my_playlists = Playlist.where(:user_id => session[:user_id])
  end

  def playlist
  end

  def song
  end

  def new_playlist
  end

  def new_song
  end

  def delete_song
  end

  def delete_playlist
  end
end
