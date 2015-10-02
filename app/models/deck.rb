class Deck < ActiveRecord::Base

  has_many :rounds
  has_many :cards

  validates :name, :file, :presence => true
  # Remember to create a migration!
end
