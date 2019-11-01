class Task < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true


  # def convert_datetime(date, time)
  #   if date.empty? && time.empty?
  #     return nil
  #   else
  #     date = DateTime.parse(date)
  #     time = DateTime.parse(time)
  #     (date.strftime("%Y-%m-%d") + " " + time).to_datetime
  #   end
  # end

  def past_due?
    self.due_time.to_time < DateTime.now.to_time
  end
end
