# require 'pry'

get '/decks/:deck_id/rounds/:round_id/guess' do |deck_id, round_id|
  Guess.create(user_id: 1, round_id: round_id, card_id: 2, guess_text: "hallo")
  @round = Round.find(round_id)
  @deck = Deck.find(deck_id)

  @next_card = @deck.cards.shuffle.find { |card| card.guesses.select {|guess| guess.correct == true }.empty? }

  if @next_card == nil
    erb :'decks/index'
  else
    erb :'cards/show'
  end
  #   # redirect "/decks/#{deck_id}/cards/#{@next_card.id}"
end

post '/decks/:deck_id/rounds/:round_id/guess' do |deck_id, round_id|
  "Hello World"
end


# Guess id: nil, user_id: 1, card_id: 2, correct: false, created_at: nil, updated_at: nil, guess_text: nil, round_id: nil>

