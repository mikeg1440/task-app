class UsersController < ApplicationController


  get '/signup' do
    erb :'users/signup'
  end

  post '/signup' do
    # create new user if username not taken, sign user in then route to /tasks
    @user = User.create(username: params[:username], email: params[:email])
    @user.save
    if @user.errors.any?
      # @error_msgs = @user.errors.full_messages
      flash[:messages] = @user.errors.full_messages
      erb :error
    else
      @user.password = params[:password]
      session[:user_id] = @user.id
      response.set_cookie(:user_id, @user.id)
      redirect '/tasks'
    end
  end

  get '/users/:id' do
    @user = User.find_by_id(params[:id])
    if current_user == @user
      erb :'/users/show'
    else
      flash[:message] = ["You can't view other users settings!"]
      erb :fail
    end
  end


  get '/users/:id/edit' do
    @user = User.find_by_id(params[:id])
    if current_user == @user
      erb :'/users/edit'
    else
      flash[:message] = ["You can't view other users settings!"]
      erb :fail
    end
  end


end
