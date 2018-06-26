class RemoveIsDoneFromTasks < ActiveRecord::Migration[5.1]
  def change
    remove_column :tasks, :is_done, :boolean
  end
end
