class PlaylistController < ApplicationController

  before_action :confirm_logged_in

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

  def delete

    begin
      playlist = Playlist.find(params[:id])
      playlist.destroy

      flash[:notice] = "Playlist removed successfully."
    rescue => ex
      logger.error ex.message
      flash[:notice] = "Playlist is already removed."
    end
    redirect_to(:controller => 'music', :action => 'playlists_index')

  end

  def remove_song
    song = Song.find(params[:id])
    playlist = Playlist.find(params[:playlist_id])
    playlist.songs.delete(song)

    flash[:notice] = "Song successfully removed from playlist."
    redirect_to(:controller => 'playlist', :action => 'show', :id => params[:playlist_id])
  end

  private
  def playlist_params
    params.require(:playlist).permit(:title, :user_id)
  end

end
