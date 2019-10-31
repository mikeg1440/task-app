class Task < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true


  def past_due?
    self.due <= DateTime.now
  end

  def due
    binding.pry
    date = self.due_date
    time = self.due_time
    DateTime.new(date.year, date.month, date.day, time.hour, time.min)
  end
end
