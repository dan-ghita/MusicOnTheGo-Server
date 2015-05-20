class AddPlaylistIdToSongs < ActiveRecord::Migration

  def change
    add_column :songs, :playlist_id, :integer
    add_index  :songs, :playlist_id
  end

end
