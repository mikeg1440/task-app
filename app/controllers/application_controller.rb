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
