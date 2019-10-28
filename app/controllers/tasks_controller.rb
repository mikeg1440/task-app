class UsersController < ApplicationController

  get '/tasks' do
    @tasks = Task.all
    erb :'tasks/index'
  end

  get '/tasks/new' do
    erb :'tasks/new'
  end

  post '/tasks' do
    params.delete("submit")
    task = Task.create(params)
    User.first.tasks << task
    redirect '/tasks'
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
    task = Task.find_by_id(params[:id])
    binding.pry
    if task && task.update(title: params[:title], description: params[:description])
      redirect "/tasks/#{params[:id]}"
    else
      redirect "/failure"
    end
  end

  delete '/tasks/:id' do
    task = Task.find_by_id(params[:id])
    binding.pry
    task.delete
    redirect '/tasks'
  end

end
