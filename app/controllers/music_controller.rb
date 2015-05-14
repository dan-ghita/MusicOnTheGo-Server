class MusicController < ApplicationController

  layout 'application'

  before_action :confirm_logged_in


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
