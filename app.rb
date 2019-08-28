require 'sinatra'
require 'sinatra/base'
require_relative './lib/list'
require_relative './lib/space'

class MakersBnB < Sinatra::Base

  @@list = List.new

  get '/' do
    erb :log_in
  end

  get '/sign_up' do
    erb :sign_up
  end

  get '/spaces' do
    @spaces = Space.all
    erb :spaces
  end

  get '/add_space' do
    erb :add_space
  end

  post '/add_space' do
   name = params[:name]
   description = params[:description]
   price = params[:price]
   space = Space.new(name, description, price)
   @@list.add(item)
   redirect "/spaces"
  end

  run! if app_file == $0

end
