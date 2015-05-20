class Song < ActiveRecord::Base

  belongs_to :user
  belongs_to :playlist
  has_many :comments
  has_many :likes

end
