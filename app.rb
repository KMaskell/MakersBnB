require 'sinatra'
require 'sinatra/base'
require_relative './lib/list'
require_relative './lib/list_item'

class MakersBnB < Sinatra::Base

  @@list = List.new


  get '/' do
    erb :sign_in
  end


  get '/spaces' do
    p @@list
    @list_of_items = @@list.show
    erb :spaces
  end

  get '/add_space' do
    erb :add_space
  end

  post '/add_space' do
   name = params[:name]
   description = params[:description]
   price = params[:price]
   item = ListItem.new(name, description, price)
   @@list.add(item)
   p @@list
   redirect "/spaces"
  end

  run! if app_file == $0

end
