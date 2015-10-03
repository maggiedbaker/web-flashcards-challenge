get '/' do
  redirect '/decks'
end

get '/signup' do
  erb :'users/signup'
end

post '/signup' do
  user = User.new(params[:user])
  if user.save
    redirect "/decks"  # go to your happy place
  else
    "Error"
  end
end

get '/login' do
  erb :'users/login'
end

post '/login' do
  user = User.find_by(username: params[:user][:username])
  if user.password == params[:user][:password]
    session[:user_id] = user.id
    "Success"
  else
    "Error"
    redirect '/signup'
  end
end
