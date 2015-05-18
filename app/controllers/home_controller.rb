class HomeController < ApplicationController

  layout 'application'

  before_action :confirm_logged_in

  def index

    @trending   = Song.all.order(likes: :desc, views: :desc ).limit(5)

    @most_viewed = Song.all.order(views: :desc ).limit(5)

    @fresh  = Song.all.order(created_at: :desc).limit(5)

  end

  def search_results
    @par = params[:query]
    search_query = '%' + @par.downcase + '%'
    @results  = Song.where('lower(artist) like ? or lower(title) like ?', search_query, search_query).limit(5)
  end

end
