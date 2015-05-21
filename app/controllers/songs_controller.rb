class SongsController < ApplicationController

  before_action :confirm_logged_in

  layout 'application';

  def new
    @song = Song.new();

  end

  def upload

    uploaded_io = params[:file]

    file_name = params[:title] + '-' + params[:artist] + '.mp3'

    directory_name = Rails.root.join('public', 'Uploads', session[:username])
    Dir.mkdir(directory_name) unless File.exists?(directory_name)


    # Write file to public/Uploads
    File.open(Rails.root.join('public', 'Uploads', session[:username], file_name), 'wb') do |file|
      file.write(uploaded_io.read)

    end

    current_user = User.find(session[:user_id])
    song = Song.create(:title => params[:title], :artist => params[:artist], :album => params[:album], :path => 'Uploads/' + session[:username] + '/' + file_name)
    current_user.songs << song

    flash[:notice] = "File uploaded successfully!"

    redirect_to(:controller => 'music', :action => 'songs_index')

  end

  def show
    @song = Song.find(params[:id])
    @liked = false

    like = Like.where(:user_id => session[:user_id],  :song_id => params[:id])
    if(like[0])
      @liked = true
    end

    views = @song[:view_count]
    @song.update_attribute(:view_count, views + 1)
  end

  def edit
  end

  def delete

    begin
      @song = Song.find(params[:id])
      file_name = @song[:title] + '-' + @song[:artist] + '.mp3'
      File.delete(Rails.root.join('public', 'Uploads', session[:username], file_name)) if File.exist?(Rails.root.join('public', 'Uploads', session[:username], file_name))
      @song.destroy
      flash[:notice] = "Song removed successfully."
    rescue => ex
      logger.error ex.message
      flash[:notice] = "Song is already removed."
    end
    redirect_to(:controller => 'music', :action => 'songs_index')


  end

end
