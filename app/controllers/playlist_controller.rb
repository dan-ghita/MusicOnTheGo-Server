class PlaylistController < ApplicationController

  layout 'application'

  before_action :confirm_logged_in,
                :except => ['login', 'attempt_login', :logout]

  def new

    @playlist = Playlist.new();

  end

  def create

    playlist = Playlist.new(playlist_params)
    playlist.user_id = session[:user_id]

    if playlist.valid?
      playlist.save
      flash[:notice] = "Playlist created successfully."
      redirect_to(:controller => 'music', :action => 'playlists_index')
    else
      flash[:notice] = playlist.errors.full_messages
      render('new')
    end

  end

  def show

    @playlist = Playlist.find(params[:id]);

  end

  private
  def playlist_params
    params.require(:playlist).permit(:title, :user_id)
  end

end
