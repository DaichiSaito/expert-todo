class AddIsDoneToTasks < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :is_done, :boolean, default: false, null: false
  end
end
