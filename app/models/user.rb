class User < ActiveRecord::Base

  has_secure_password
  has_many :songs
  has_many :comments

  EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i
  FORBIDDEN_USERNAMES = ['ionutbudisteanu', 'mariaioana']

  validates :first_name, :presence => true,
            :length => { :maximum => 25}
  validates :last_name, :presence => true,
            :length => { :maximum => 50}
  validates :username, :presence => true,
            :length => {:within => 8..25},
            :uniqueness => true
  validates :email, :presence => true,
            :length => { :maximum => 50 },
            :uniqueness => true,
            :format => { :with => EMAIL_REGEX },
            :confirmation => true
  validate :username_is_allowed

  def username_is_allowed

    if FORBIDDEN_USERNAMES.include?(username)
      errors.add(:username, "has been restricted from use")
    end

  end


end