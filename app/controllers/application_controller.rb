require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, ENV['SESSION_SECRET'] { SecureRandom.hex(64) }
    use Rack::Flash
  end


  get "/" do
    binding.pry
    erb :'users/login'
  end

  get '/failure' do
    erb :fail
  end

  helpers do
    def is_logged_in?
      !!request.cookies["user_id"] || !!session[:user_id]
    end

    def current_user
      User.find_by_id(request.cookies["user_id"]) || User.find_by_id(session[:user_id])
    end
  end


end
