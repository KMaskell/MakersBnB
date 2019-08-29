require 'sinatra'
require 'sinatra/base'
require_relative './lib/space'
#require_relative './lib/user'

class MakersBnB < Sinatra::Base

  enable :sessions

  get '/' do
    erb :log_in
  end

  post '/' do
    # connect to DB
    redirect '/spaces'
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up' do
    # connect to DB
    @user = User.add(username: params[:username], password: params[:password], email: params[:email])
    session[:username] = @user.username
    redirect '/spaces'
  end

  get '/spaces' do
    @spaces = Space.all
    erb :spaces
  end

  get '/add_space' do
    erb :add_space
  end

  post '/add_space' do
   Space.add(name: params[:name], description: params[:description], price: params[:price], session[:user].id)
   redirect "/spaces"
  end

  run! if app_file == $0

end
