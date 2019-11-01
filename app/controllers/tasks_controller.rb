class UsersController < ApplicationController

  get '/tasks' do
    if is_logged_in?
      user = current_user
      @tasks = user.tasks
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
      user = current_user
      params.delete("submit")
      task = Task.create(title: params[:title], description: params[:description])
      datetime = convert_datetime(params[:due_date], params[:due_time])
      task.due_time = datetime
      user.tasks << task
      binding.pry
      redirect '/tasks'
    else
      redirect '/login'
    end
  end

  patch '/tasks' do
    task = Task.find_by_id(params[:task_id])
    if task.complete
      task.complete = false
    else
      task.complete = true
    end
    task.save
    redirect '/tasks'
  end

  get '/tasks/:id' do
    if is_logged_in? && current_user.tasks.include?(Task.find_by_id(params[:id]))
      @task = Task.find_by_id(params[:id])
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
      datetime = convert_datetime(params[:due_date], params[:due_time])
      if task && task.update(title: params[:title], description: params[:description], due_time: datetime)
        binding.pry
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
      task.delete
      redirect '/tasks'
    else
      redirect '/login'
    end
  end

  helpers do
    def convert_datetime(date, time)
      if date.empty? && time.empty?
        return nil
      elsif date.empty?
        # datetime = DateTime.parse(time)
        datetime = Time.parse(time)
      else
        # datetime = DateTime.parse("#{date} #{time}")
        datetime = Time.parse("#{date} #{time}")
        # time = DateTime.parse(time)
        # (date.strftime("%Y-%m-%d") + " " + time).to_datetime
      end
      # datetime.change(:offset => "-0400")
      binding.pry
      datetime
    end

  end

end
