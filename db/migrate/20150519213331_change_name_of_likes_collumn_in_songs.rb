class ChangeNameOfLikesCollumnInSongs < ActiveRecord::Migration
  def self.up
    rename_column :songs, :likes, :like_count
    rename_column :songs, :views, :view_count
  end

  def self.down
    rename_column :songs, :like_count, :likes
    rename_column :songs, :view_count, :views
  end
end
