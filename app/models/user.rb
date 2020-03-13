class User < ActiveRecord::Base
  has_many :tasks
  has_secure_password

  validates :username, uniqueness: true, presence: true
  validates :email, presence: true
  validates :password_confirmation, confirmation: true, on: :update
  validates :password, confirmation: true



  def clear_completed
    self.tasks.each do |task|
       if task.complete
         task.delete
       end
     end
  end

  def sort_tasks_by_priority
    sorted = []
    high = self.tasks.find_all {|t| t.priority == "High"}
    sorted += sort_by_due_time(high)

    medium = self.tasks.find_all {|t| t.priority == "Medium"}
    sorted += sort_by_due_time(medium)

    low = self.tasks.find_all {|t| t.priority == "Low"}
    sorted += sort_by_due_time(low)

    sorted
  end

  private

  def sort_by_due_time(tasks)
    sorted_tasks = tasks.select {|task| task.due_time }.sort_by {|task| task.due_time }
    sorted_tasks += tasks.select {|task| !task.due_time }

    sorted_tasks
  end

end
