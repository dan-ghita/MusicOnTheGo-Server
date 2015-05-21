class ApiController < ApplicationController

  before_action :confirm_logged_in

  layout false

  def like

    song = Song.find(params[:id])
    user = User.find(session[:user_id])
    like = Like.create()
    user.likes << like
    song.likes << like

    likes = song[:like_count]
    song.update_attribute(:like_count, likes + 1)
    response = {:status => "complete", :like_count => song[:like_count]}
    @json = response.to_json

  end

  def dislike

    song = Song.find(params[:id])

    like = Like.where(:user_id => session[:user_id], :song_id => params[:id])
    like[0].destroy

    likes = song[:like_count]
    song.update_attribute(:like_count, likes - 1)
    response = {:status => "complete", :like_count => song[:like_count]}
    @json = response.to_json

  end

  def new_comment

    song = Song.find(params[:id])
    user = User.find(session[:user_id])
    comment = Comment.create(:text => params[:message])
    song.comments << comment
    user.comments << comment
    response = {:status => "complete", :username => user[:username], :created_at => comment[:created_at].strftime("%d/%m/%Y %H:%M")}
    @json = response.to_json

  end

  def get_user_playlists

    user = User.find(session[:user_id])
    playlists = user.playlists
    response = {:status => "complete", :playlists => playlists}
    @json = response.to_json

    end

  def search

    par = params[:query]
    search_query = '%' + par.downcase + '%'
    results  = Song.where('lower(artist) like ? or lower(title) like ?', search_query, search_query).limit(15)

    response = {:status => "complete", :songs => results}
    @json = response.to_json

  end

  def add_to_playlist

    song = Song.find(params[:id])
    playlist = Playlist.find(params[:playlist_id])

    if playlist.songs.where(:id => song[:id]).present?
      response = {:status => "error", :message => "Song is already in this playlist"}
    else
      playlist.songs << song
      response = {:status => "complete", :title => song[:title], :artist => song[:artist], :album => song[:album], :id => song[:id]}
    end
    @json = response.to_json

  end

end
