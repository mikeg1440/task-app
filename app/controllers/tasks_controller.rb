class TasksController < ApplicationController

  def check_session
    if !is_logged_in?
      redirect '/login'
    end
  end

  get '/tasks' do
    check_session
    @user = current_user
    @tasks = @user.sort_tasks_by_priority
    erb :'tasks/index'
  end

  get '/tasks/new' do
    check_session
    erb :'tasks/new'
  end

  post '/tasks' do
    check_session
    user = current_user
    params.delete("submit")
    datetime = convert_datetime(params[:due_date], params[:due_time])
    task = Task.create(title: params[:title], description: params[:description], due_time: datetime, priority: params[:priority])
    if task.errors.any?
      flash[:messages] = task.errors.full_messages.uniq
      erb :error
    else
      user.tasks << task
      redirect '/tasks'
    end
  end

  # this is for updating the status of tasks from the users main index page
  patch '/tasks' do
    check_session
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
    check_session
    if current_user.tasks.include?(Task.find_by_id(params[:id]))
      @task = Task.find_by_id(params[:id])
      erb :'tasks/show'
    else
      flash[:messages] = ["You cant view tasks that don't belong to you!"]
      erb :error
    end
  end

  get '/tasks/:id/edit' do
    check_session
    @task = Task.find_by_id(params[:id])
    if @task && current_user == @task.user
      erb :'tasks/edit'
    else
      flash[:messages] = ["You can only edit tasks you created!"]
      erb :error
    end
  end

  patch '/tasks/:id' do
    check_session
    task = Task.find_by_id(params[:id])
    datetime = convert_datetime(params[:due_date], params[:due_time])
    if task && task.update(title: params[:title], description: params[:description], due_time: datetime, priority: params[:priority])
      redirect "/tasks/#{params[:id]}"
    else
      redirect "/failure"
    end
  end

  delete '/tasks/:id' do
    check_session
    task = Task.find_by_id(params[:id])
    task.delete
    redirect '/tasks'
  end

  get '/clear-complete' do
    current_user.clear_completed
    redirect '/tasks'
  end

  get '/sort-by-priority' do
    @tasks = current_user.sort_by_priority
    erb :'/tasks/index'
  end

  get '/sort-by-priority' do

  end

  helpers do
    def convert_datetime(date, time)
      if date.empty? && time.empty?
        return nil
      elsif date.empty?
        datetime = Time.parse(time)
      else
        datetime = Time.parse("#{date} #{time}")
      end
      datetime
    end

  end

end
