class AddItemIdFromComments < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :item_id, :integer
  end
end
