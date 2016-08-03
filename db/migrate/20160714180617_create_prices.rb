class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.belongs_to :cake, index: true, foreign_key: true
      t.integer :portions
      t.integer :price

      t.timestamps null: false
    end
  end
end
