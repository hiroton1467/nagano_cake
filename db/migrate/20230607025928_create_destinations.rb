class CreateDestinations < ActiveRecord::Migration[6.1]
  def change
    create_table :destinations do |t|
      t.string :postcode, null: false
      t.string :address, null: false
      t.string :name, null: false

      t.timestamps
    end
  end
end
