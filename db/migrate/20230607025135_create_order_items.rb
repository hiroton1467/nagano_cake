class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      t.integer :order_production, null:false
      t.integer :price, null:false
      t.integer :quantity, null:false

      t.timestamps
    end
  end
end
