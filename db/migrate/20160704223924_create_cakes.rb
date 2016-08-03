class CreateCakes < ActiveRecord::Migration
  def change
    create_table :cakes do |t|
      t.string :name, null: false
      t.string :code, null: false, unique: false
      t.string :category, null: false
      t.integer :minimum_portions, default: 0
      t.integer :portion_price, default: 0
      t.boolean :includes_couple, default: false
      t.integer :warranty, default: false

      t.timestamps null: false
    end
  end
end
