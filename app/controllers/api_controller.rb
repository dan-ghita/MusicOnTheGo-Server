class ApiController < ApplicationController

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

end
