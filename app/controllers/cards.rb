get '/decks/:deck_id/cards' do |deck_id|
  @cards = Deck.find(deck_id).cards
  erb :'cards/index'
end

get '/cards/:id' do |id|
  @card = Card.find(id)
  erb :'cards/show'
end
