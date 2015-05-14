class HomeController < ApplicationController

  layout 'application'

  before_action :confirm_logged_in

  def index
  end

  def search_results
    @par = params[:query]
    search_query = '%' + @par.downcase + '%'
    @results  = Song.where('lower(artist) like ? or lower(title) like ?', search_query, search_query).limit(5)
  end

end
