require 'pry'

get '/decks/:deck_id/rounds/:round_id/cards/:card_id/guess' do |deck_id, round_id, card_id|

  @round = Round.find(round_id)
  @deck = Deck.find(deck_id)
  @all_decks = Deck.all

  eligibile_cards = @deck.cards.reject { |card| card.guesses.select { |guess| guess.round_id == round_id.to_i && guess.correct == true }.empty? != true }
  @next_card = eligibile_cards.shuffle.first

  if @next_card == nil
    redirect "/users/#{Round.find(round_id.to_i).user_id}"
  else
    erb :'cards/show'
  end
end

post '/decks/:deck_id/rounds/:round_id/cards/:card_id/guess' do |deck_id, round_id, card_id|
  guess = params[:card][:answer]
  @deck = Deck.find(deck_id)
  @round = Round.find(round_id)
  @card = Card.find(card_id)
  @current_guess = Guess.create(user_id: @round.user_id, round_id: round_id, card_id: card_id, guess_text: guess)
  if guess.downcase.strip == @card.answer.downcase.strip
    @current_guess.correct = true
    @current_guess.save
    erb :'guesses/correct'
  else
    erb :'guesses/incorrect'
  end
  # redirect "/decks/#{deck_id}/rounds/#{round_id}/cards/#{card_id}/guess'
end


# Guess id: nil, user_id: 1, card_id: 2, correct: false, created_at: nil, updated_at: nil, guess_text: nil, round_id: nil>

