class User < ActiveRecord::Base

  has_many :rounds
  has_many :guesses

  validates :username, :password, :presence => true
  # Remember to create a migration!
end
