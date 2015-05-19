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

end
