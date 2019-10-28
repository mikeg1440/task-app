class UsersController < ApplicationController

  get '/login' do
    erb :'users/login'
  end

  post '/login' do
    # login user if cred are correct and set cookies/session params, then route to /tasks
    binding.pry
  end

  get '/signup' do
    erb :'users/signup'
  end

  post '/signup' do
    # create new user if username not taken
    binding.pry
  end

end
