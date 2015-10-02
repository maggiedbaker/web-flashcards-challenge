get '/decks' do
  @deck = Deck.all
  erb :'decks/index'
end

get '/decks/:id' do |id|
  @deck = Deck.find(id)
  erb :'decks/show'
end

