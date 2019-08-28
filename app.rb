require 'sinatra'
require 'sinatra/base'
require_relative './lib/list'
require_relative './lib/list_item'

class MakersBnB < Sinatra::Base
  enable :sessions
  session[:list] = List.new

  get '/' do
    @list_of_items = session[:list].show 
    erb :index
  end

  get '/add_space' do
    erb :add_space
  end

  post '/add_space' do
   name = params[:name]
   description = params[:description]
   price = params[:price]
   email_address = params[:email_address]
   phone_number = params[:phone_number]
   item = ListItem.new(name, description, price, email_address, phone_number)
   session[:list].add(item)
   redirect "/"
  end
  
  run! if app_file == $0
  
end
