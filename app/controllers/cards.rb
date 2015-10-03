get '/decks/:deck_id/cards' do |deck_id, card_id|
  @deck = Deck.find(deck_id)
  @cards = @deck.cards
  erb :'cards/index'
end

get '/decks/:deck_id/cards/:card_id' do |deck_id, card_id|
  @card = Card.find(card_id)
  erb :'cards/show'
end

