class CreatePresses < ActiveRecord::Migration
  def change
    create_table :presses do |t|
      t.string :name
      t.integer :popularity, default: 0

      t.timestamps null: false
    end
  end
end
