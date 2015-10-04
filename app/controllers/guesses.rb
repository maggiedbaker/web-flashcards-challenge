get '/decks/:deck_id/rounds/:round_id/guess' do |deck_id, round_id|
  Guess.create(user_id: 1, round_id: round_id)
  @round = Round.find(round_id)
  @deck = Deck.find(deck_id)
  erb :'cards/show'

  @next_card = @deck.cards.find { |card| card.guesses.select {|guess| guess.correct == true }.empty? }

  if @next_card == nil
    erb :'decks/index'
  else
    erb :'cards/show'
    redirect "/decks/#{deck_id}/cards/#{next_card}"
  end
end

