class SessionsController < ApplicationController

  get '/login' do
    if is_logged_in?
      redirect '/tasks'
    else
      erb :'users/login'
    end
  end

  post '/login' do
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect '/tasks'
    else
      flash[:messages] = ["Invalid Username or Password!"]
      erb :error
    end
  end


  get '/logout' do
    response.delete_cookie(:user_id)
    # session.delete(:user_id)
    session.clear
    redirect '/login'
  end


end
