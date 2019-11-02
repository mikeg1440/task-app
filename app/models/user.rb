class User < ActiveRecord::Base
  has_many :tasks
  has_secure_password

  validates :username, :email, uniqueness: true

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


end
