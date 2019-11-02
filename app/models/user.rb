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

end
