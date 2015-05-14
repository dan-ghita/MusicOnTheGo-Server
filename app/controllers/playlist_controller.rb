class PlaylistController < ApplicationController

  layout 'application'

  before_action :confirm_logged_in,
                :except => ['login', 'attempt_login', :logout]

  def play_song

  end

  def index

  end

  def search


    song = Song.where('title LIKE ?', "%#{params[:search]}%");
    if song.any?
      redirect_to(:action => 'play_song', :id => song[0].id)
    else
      flash[:notice] = "song not found"
      redirect_to(:action => 'index')
    end

  end

end
