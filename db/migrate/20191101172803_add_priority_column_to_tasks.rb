class AddPriorityColumnToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :priority, :string 
  end
end
