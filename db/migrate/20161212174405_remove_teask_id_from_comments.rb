class RemoveTeaskIdFromComments < ActiveRecord::Migration[5.0]
  def change
    remove_column :comments, :task_id, :integer
  end
end
