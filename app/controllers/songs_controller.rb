class SongsController < ApplicationController

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
  end

  def edit
  end

  def delete
  end
end
