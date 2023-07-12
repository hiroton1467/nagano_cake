class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
       t.integer :customer_id, null: false
       t.string :name, null: false
       t.string :address, null: false
       t.string :postcode, null: false
       t.integer :billing, null: false
       t.integer :postage, null: false
       t.integer :payment_method, null: false

      t.timestamps
    end
  end
end
