class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|

      t.string "title"
      t.string "album"
      t.string "artist"
      t.string "path"
      t.integer "views", :default => 0
      t.integer "likes", :default => 0

      t.timestamps null: false
    end
  end
end
