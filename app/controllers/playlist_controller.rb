class PlaylistController < ApplicationController

  layout 'application'

  before_action :confirm_logged_in,
                :except => ['login', 'attempt_login', :logout]

  def new

    @playlist = Playlist.new();

  end

  def create

  end

  def show

    @playlist = Playlist.find(params[:id]);

  end



end
