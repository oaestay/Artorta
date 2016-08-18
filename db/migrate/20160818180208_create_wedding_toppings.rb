class CreateWeddingToppings < ActiveRecord::Migration
  def change
    create_table :wedding_toppings do |t|
      t.string :name
      t.string :code
      t.integer :popularity, default: 0

      t.timestamps null: false
    end
  end
end
