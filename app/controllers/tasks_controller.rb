class UsersController < ApplicationController

  get '/tasks' do
    if is_logged_in?
      @tasks = Task.all
      erb :'tasks/index'
    else
      redirect '/login'
    end
  end

  get '/tasks/new' do
    if is_logged_in?
      erb :'tasks/new', layout: :'tasks/layout'
    else
      redirect '/login'
    end
  end

  post '/tasks' do
    if is_logged_in?
      params.delete("submit")
      task = Task.create(params)
      User.first.tasks << task
      redirect '/tasks'
    else
      redirect '/login'
    end
  end

  get '/tasks/:id' do
    if is_logged_in?
      @task = Task.find_by_id(params[:id])
      # binding.pry
      erb :'tasks/show', layout: :'tasks/layout'
    else
      redirect '/login'
    end
  end

  get '/tasks/:id/edit' do
    if is_logged_in?
      @task = Task.find_by_id(params[:id])
      erb :'tasks/edit', layout: :'tasks/layout'
    else
      redirect '/login'
    end
  end

  patch '/tasks/:id' do
    if is_logged_in?
      task = Task.find_by_id(params[:id])
      binding.pry
      if task && task.update(title: params[:title], description: params[:description])
        redirect "/tasks/#{params[:id]}"
      else
        redirect "/failure"
      end
    else
      redirect '/login'
    end
  end

  delete '/tasks/:id' do
    if is_logged_in?
      task = Task.find_by_id(params[:id])
      binding.pry
      task.delete
      redirect '/tasks'
    else
      redirect '/login'
    end
  end

end
