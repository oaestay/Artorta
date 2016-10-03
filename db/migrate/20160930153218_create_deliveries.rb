class CreateDeliveries < ActiveRecord::Migration
  def change
    create_table :deliveries do |t|
      t.string :address
      t.string :province
      t.text :references
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :cellphone
      t.datetime :datetime

      t.timestamps null: false
    end
  end
end
