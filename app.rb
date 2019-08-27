require 'sinatra'
require 'sinatra/base'

class MakersBnB < Sinatra::Base

  get '/' do
    "Hello MakersBnB!"
  end
  
  run! if app_file == $0
  
end
