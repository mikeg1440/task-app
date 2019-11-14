class UsersController < ApplicationController


  get '/signup' do
    erb :'users/signup'
  end

  post '/signup' do
    # create new user if username not taken, sign user in then route to /tasks
    @user = User.create(username: params[:username], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])

    if @user.save
      @user.password = params[:password]
      session[:user_id] = @user.id
      redirect '/tasks'
    else
      flash[:messages] = @user.errors.full_messages
      erb :error
    end
  end

  get '/users/:id' do
    @user = User.find_by_id(params[:id])
    if current_user == @user
      erb :'/users/show'
    else
      flash[:messages] = ["You can't view other users settings!"]
      erb :error
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

  patch '/users/:id' do
    @user = User.find_by_id(params[:id])
    if current_user == @user
      @user.update(username: params[:user][:username], email: params[:user][:email])
      if !params[:user][:password].empty? || !params[:user][:password_confirmation].empty?
        @user.update(password: params[:user][:password], password_confirmation: params[:user][:password_confirmation])
      end
      if @user.errors.any?
        flash[:messages] = @user.errors.full_messages.uniq
        erb :error
      else
        flash[:messages] = "Successfuly updated account!"
        erb :"/users/show"
      end
    else
      flash[:message] = ["You can't change other users settings!"]
      erb :error
    end
  end

  delete '/users/:id' do
    if current_user == User.find_by_id(params[:id]) && is_logged_in?
      current_user.delete
      session.delete(:user_id)
      session[:msg] = "Successfuly Deleted Account!"
      redirect '/login'
    else
      flash[:messages] = "Failed to delete account!"
      erb :error
    end

  end


end
