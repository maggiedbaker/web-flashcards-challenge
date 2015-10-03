get '/decks' do
  @deck = Deck.all
  erb :'decks/index'
end

get '/decks/:id' do |id|
  round = Round.create(deck_id: id)
  redirect "/decks/#{id}/rounds/#{round.id}/guess"
end
