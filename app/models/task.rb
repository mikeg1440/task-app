class Task < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true


  def past_due?
    self.due_time.to_time < DateTime.now.to_time
  end

end
