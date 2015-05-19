class MusicController < ApplicationController

  layout 'application'

  before_action :confirm_logged_in

  def songs_index

    # select from current user - session[:user_id] si group by artist
    @my_music   = Song.where(:user_id => session[:user_id])

    @trending   = Song.all.order(view_count: :desc, like_count: :desc ).limit(5)

    @new_songs  = Song.all.order(created_at: :desc).limit(5)

  end

  def playlists_index

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
