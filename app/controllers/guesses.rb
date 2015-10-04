# require 'pry'

get '/decks/:deck_id/rounds/:round_id/cards/:card_id/guess' do |deck_id, round_id, card_id|

  @round = Round.find(round_id)
  @deck = Deck.find(deck_id)
  @next_card = @deck.cards.shuffle.find { |card| card.guesses.select {|guess| guess.correct == true }.empty? }
  if @next_card == nil
    erb :'decks/index'
  else
    erb :'cards/show'
  end
end

post '/decks/:deck_id/rounds/:round_id/cards/:card_id/guess' do |deck_id, round_id, card_id|
  guess = params[:card][:answer]
  @deck = Deck.find(deck_id)
  @round = Round.find(round_id)
  @card = Card.find(card_id)
  @current_guess = Guess.create(user_id: 1, round_id: round_id, card_id: card_id, guess_text: guess)
  if guess == @card.answer
    @current_guess.correct = true
    erb :'guesses/correct'
  else
    erb :'guesses/incorrect'
  end
  # redirect "/decks/#{deck_id}/rounds/#{round_id}/cards/#{card_id}/guess'
end


# Guess id: nil, user_id: 1, card_id: 2, correct: false, created_at: nil, updated_at: nil, guess_text: nil, round_id: nil>

