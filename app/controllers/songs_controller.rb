class SongsController < ApplicationController

  layout 'application';

  def new
    @song = Song.new();

  end

  def upload

    uploaded_io = params[:file]

    # Write file to public/Uploads
    File.open(Rails.root.join('public', 'Uploads', uploaded_io.original_filename), 'wb') do |file|
      file.write(uploaded_io.read)
    end

    current_user = User.find(session[:user_id])
    song = Song.create(:title => params[:title], :artist => params[:artist], :album => params[:album], :path => 'Uploads/' + uploaded_io.original_filename)
    current_user.songs << song

    flash[:notice] = "File uploaded successfully!"

    redirect_to(:controller => 'music', :action => 'songs_index')

  end

  def show
    @song = Song.find(params[:id])
    user = User.find(session[:user_id])
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
      @song.destroy
      flash[:notice] = "Song removed successfully."
    rescue => ex
      logger.error ex.message
      flash[:notice] = "Song is already removed."
    end
    redirect_to(:controller => 'music', :action => 'songs_index')


  end
end
