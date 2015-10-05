# require 'pry'

get '/decks' do
  @all_decks = Deck.all
  erb :'decks/index'
end

get '/decks/:id' do |id|
  if session[:user_id]
    user_id = session[:user_id]
  else
    user = User.create(username: "guest", password: "guest", guest: true)
    user_id = user.id
  end
  new_round = Round.create(user_id: user_id, deck_id: id)
  @deck = Deck.find(id)
  redirect "/decks/#{id}/rounds/#{new_round.id}/cards/1/guess"
end

post '/decks' do
  erb :'cards/index'
end
