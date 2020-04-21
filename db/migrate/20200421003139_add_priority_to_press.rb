class AddPriorityToPress < ActiveRecord::Migration[5.2]
  def change
    add_column :presses, :priority, :integer, default: 0
  end
end
