class Guess < ActiveRecord::Base

  belongs_to :user
  belongs_to :card
  belongs_to :round

  validates :user_id, :card_id, :correct, :presence => true
  # Remember to create a migration!
end
