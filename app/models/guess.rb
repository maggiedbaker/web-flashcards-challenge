class Guess < ActiveRecord::Base

  # self.table_name = "guesses"

  belongs_to :user
  belongs_to :card
  belongs_to :round

  validates :user_id, :card_id, :guess_text, :round_id, :presence => true
  # Remember to create a migration!
end
