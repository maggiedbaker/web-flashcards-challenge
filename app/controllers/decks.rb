get '/decks' do
  @deck = Deck.all
  erb :'decks/index'
end

get '/decks/:id' do |id|
  @deck = Deck.find(id)
  erb :'decks/show'
end

get '/decks/:id' do |id|
  @deck = Deck.find(id)
  @cards = @deck.cards.dup
  @current_card = @cards.sample
  # redirect '/cards/#{current_card.id}'
  erb :'cards/show'
end





