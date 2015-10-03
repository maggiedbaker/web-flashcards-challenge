get 'decks/:id/rounds/:id/guess' do |deck_id, round_id|
  Guess.create(round_id: round_id)
  @deck = Deck.find(deck_id)

  def find_first_eligible_card(array)
    array.find{|object| object.}
  end





  @next_card =
  redirect '/decks/:id/cards/#{:id}'
end

get ''
