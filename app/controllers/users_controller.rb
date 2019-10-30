class UsersController < ApplicationController

  get '/login' do
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
      response.set_cookie(:user_id, user.id)
      session[:user_id] = user.id
      redirect '/tasks'
    else
      redirect '/login'
    end
  end

  get '/signup' do
    erb :'users/signup'
  end

  post '/signup' do
    # create new user if username not taken, sign user in then route to /tasks
    @user = User.find_or_create_by(username: params[:username], email: params[:email])
    @user.password = params[:password]
    @user.save
    if @user.errors.any?
      @error_msgs = @user.errors.full_messages
      erb :fail
    else
      session[:user_id] = @user.id
      response.set_cookie(:user_id, @user.id)
      redirect '/tasks'
    end
  end

  get '/logout' do
    # clear session/cookies then route to login
    response.delete_cookie(:user_id)
    session.delete(:user_id)
    redirect '/login'
  end

end
