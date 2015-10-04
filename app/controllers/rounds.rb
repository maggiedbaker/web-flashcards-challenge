get '/decks/:deck_id/rounds/:round_id' do |deck_id, round_id|
  erb :'rounds/show'
end