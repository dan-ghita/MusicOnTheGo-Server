class ApiController < ApplicationController

  layout false

  def like

    song = Song.find(params[:id]);
    likes = song[:likes]
    song.update_attribute(:likes, likes + 1)
    response = {:status => "complete", :likes => song[:likes]}
    @json = response.to_json

  end

  def dislike

    song = Song.find(params[:id]);
    likes = song[:likes]
    song.update_attribute(:likes, likes - 1)
    response = {:status => "complete", :likes => song[:likes]}
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
