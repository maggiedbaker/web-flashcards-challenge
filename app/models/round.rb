class Round < ActiveRecord::Base

  belongs_to :user
  belongs_to :deck

  validates :user_id, :deck_id, :presence => true
  # Remember to create a migration!
end
