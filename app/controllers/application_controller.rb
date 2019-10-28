require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "This has to be changed quick" 
  end

  get "/" do
    erb :index
  end



end
