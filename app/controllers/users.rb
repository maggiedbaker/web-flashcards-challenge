require 'pry'

get '/login' do
  erb :'users/login'
end

require 'pry'

post '/login' do
  user = User.find_by(username: params[:username])
  # binding.pry
  if user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect "/users/#{user.id}"
  else
    erb :'users/login'
  end
end

get '/users/new' do
  erb :'users/signup'
end

post '/users' do
  user= User.new(params[:user])
  if user.save
    session[:user_id] = user.id
    redirect '/'
  else
    redirect '/users/new'
  end
end

get '/users/:id' do |user_id|
  @all_decks = Deck.all
  @user = User.find(user_id)
  @rounds = @user.rounds
  @guesses = @user.guesses
  @user_deck_ids = @rounds.collect{ |round| round.deck_id }.uniq
  erb :'users/show'
end

get '/logout' do
  session[:user_id] = nil
  redirect '/login'
end

