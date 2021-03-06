require 'sinatra'
require 'sinatra/base'
require 'sinatra/flash'
require_relative './lib/database_connection'
require_relative './lib/space'
require_relative './lib/user'

class MakersBnB < Sinatra::Base

  enable :sessions, :method_override
  
  get '/' do
    @fail = session[:login_fail]
    erb :log_in
  end

  post '/log_in' do
  login_id = User.log_in(params[:email], params[:password])
    if login_id
      session[:user_id] = login_id
      session[:login_fail] = false
      redirect '/spaces'
    else
      session[:login_fail] = true
      redirect '/'
    end
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up' do
    User.add(params[:username], params[:password], params[:email])
    session[:user_id] = User.log_in(params[:email], params[:password])
    redirect '/spaces'
  end

  get '/spaces' do
    @user = User.find(session[:user_id]) if session[:user_id]
    @spaces = Space.all
    erb :spaces
  end

  get '/add_space' do
    erb :add_space
  end

  post '/add_space' do
   Space.add(params[:name], params[:description], params[:price], session[:user_id])
   redirect "/spaces"
  end

  post '/sessions/destroy' do
    session.clear
    redirect "/"
  end

  get '/my_spaces' do
    @user = User.find(session[:user_id])
    erb :my_spaces
  end

  delete '/my_spaces/:id' do
    Space.find(params[:id]).delete 
    redirect "/my_spaces"
  end

  patch '/my_spaces/:id' do
    
    Space.find(params[:id]).update(name: params[:name], description: params[:description],price: params[:price])
    redirect '/my_spaces'
  end

  get '/my_spaces/:id/edit_space' do
   
    @id = params[:id]
    @space = Space.find(params[:id])
    erb :edit_space
  end

  run! if app_file == $0

end
         