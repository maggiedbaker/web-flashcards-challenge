class Card < ActiveRecord::Base

  has_many :guesses
  belongs_to :deck

  validates :prompt, :answer, :deck_id, :presence => true

end




