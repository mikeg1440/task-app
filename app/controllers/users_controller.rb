class UsersController < ApplicationController


  get '/signup' do
    erb :'users/signup'
  end

  post '/signup' do
    # create new user if username not taken, sign user in then route to /tasks
    @user = User.create(username: params[:username], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    @user.save
    if @user.errors.any?
      flash[:messages] = @user.errors.full_messages
      erb :error
    else
      @user.password = params[:password]
      session[:user_id] = @user.id
      # response.set_cookie(:user_id, @user.id)
      redirect '/tasks'
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
        binding.pry
        @user.update(password: params[:user][:password], password_confirmation: params[:user][:password_confirmation])
      end
      if @user.errors.any?
        flash[:messages] = @user.errors.full_messages.uniq
        binding.pry
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

  get '/users/:id/delete' do
    if current_user == User.find_by_id(params[:id])
      current_user.delete
      redirect '/login'
    else
      flash[:messages] = "Failed to delete account!"
      erb :error
    end

  end


end
