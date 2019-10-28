class UsersController < ApplicationController

  get '/tasks' do
    @tasks = Task.all
    erb :'tasks/index'
  end

  get '/tasks/new' do
    erb :'tasks/new'
  end

  get '/tasks/:id' do
    @task = Task.find_by_id(params[:id])
    # binding.pry
    erb :'tasks/show'
  end

  get '/tasks/:id/edit' do
    @task = Task.find_by_id(params[:id])
    erb :'tasks/edit'
  end

  patch '/tasks/:id' do
  end 

end
