class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.integer :popularity, default: 0

      t.timestamps null: false
    end
  end
end
