class SessionsController < ApplicationController

  get '/login' do
    binding.pry
    if is_logged_in?
      redirect '/tasks'
    else
      erb :'users/login'
    end
  end

  post '/login' do
    # login user if cred are correct and set cookies/session params, then route to /tasks
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      # response.set_cookie(:user_id, user.id)
      session[:user_id] = user.id
      redirect '/tasks'
    else
      flash[:messages] = ["Invalid Username or Password!"]
      erb :error
    end
  end


  get '/logout' do
    # clear session/cookies then route to login
    response.delete_cookie(:user_id)
    # session.delete(:user_id)
    session.clear
    redirect '/login'
  end


end
