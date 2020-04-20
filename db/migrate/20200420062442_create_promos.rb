class CreatePromos < ActiveRecord::Migration[5.2]
  def change
    create_table :promos do |t|
      t.attachment :image
      t.references :category, foreign_key: true
      t.string :name
      t.integer :realm
      t.integer :priority

      t.timestamps
    end
  end
end
