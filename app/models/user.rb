class User < ActiveRecord::Base
  has_many :tasks
  has_secure_password

  validates :username, :email, uniqueness: true, presence: true
  validates :password_confirmation, confirmation: true, on: :update
  validates :password, confirmation: true



  def clear_completed
    binding.pry
    self.tasks.each do |task|
       if task.complete
         task.delete
       end
     end
  end

  def sort_by_priority
    sorted = []
    high = self.tasks.find_all {|t| t.priority == "High"}
    medium = self.tasks.find_all {|t| t.priority == "Medium"}
    low = self.tasks.find_all {|t| t.priority == "Low"}

    sorted += high
    sorted += medium
    sorted += low
    sorted
  end

  def sort_by_due_time
    self.tasks.sort_by {|task| task.due_time }
  end


end
