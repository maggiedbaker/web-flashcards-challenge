class Card < ActiveRecord::Base

  belongs_to :deck

  validates :prompt, :answer, :deck_id, :presence => true
  # Remember to create a migration!
end
