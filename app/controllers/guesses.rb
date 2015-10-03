get 'decks/:d_id/rounds/:r_id/guess' do |d_id, r_id|
  Guess.create(round_id: r_id)
  @round = Round.find(r_id)
  @deck = Deck.find(d_id)
  erb :'cards/show'
  # @deck = Deck.find(deck_id)

  # # def find_first_eligible_card(array)
  # #   array.find{|object| object.}
  # # end

  # redirect "/decks/:id/cards/#{:id}"
end

