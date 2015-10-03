get '/decks' do
  @deck = Deck.all
  erb :'decks/index'
end

get '/decks/:id' do |id|
  new_round = Round.create(deck_id: id)
  @deck = Deck.find(id)
  # redirect "/decks/#{id}/rounds/#{new_round.id}/guess"
  erb :'cards/show'
end

post '/decks' do
  erb :'cards/index'
end
