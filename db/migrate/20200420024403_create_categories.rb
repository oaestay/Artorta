class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name
      t.text :subcategories
      t.boolean :active
      t.integer :realm

      t.timestamps
    end
  end
end
