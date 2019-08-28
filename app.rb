require 'sinatra'
require 'sinatra/base'
require_relative './lib/database_connection'
require_relative './lib/space'
require_relative './lib/user'

class MakersBnB < Sinatra::Base

  get '/' do
    p @@list
    @list_of_items = @@list.show 
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
   @@list.add(item)
   p @@list
   redirect "/"
  end
  
  run! if app_file == $0
  
end
