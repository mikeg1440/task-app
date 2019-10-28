class CreateTasksTable < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.boolean :complete, default: false
      t.integer :user_id
    end
  end
end

# eventually put in sub-tasks logic
# will need to add a way to keep track of sub-tasks and parent tasks
