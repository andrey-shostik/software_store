class CreatePositions < ActiveRecord::Migration[5.0]
  def change
    create_table :positions do |t|
      t.integer :cart_id
      t.integer :item_id
      t.integer :quantity
    end
  end
end
