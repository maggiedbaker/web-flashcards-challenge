# require 'pry'

get '/decks' do
  @deck = Deck.all
  erb :'decks/index'
end

get '/decks/:id' do |id|
  new_round = Round.create(user_id: 1, deck_id: id)
  @deck = Deck.find(id)
  redirect "/decks/#{id}/rounds/#{new_round.id}/cards/1/guess"
end

post '/decks' do
  erb :'cards/index'
end
