class AddPriorityToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :priority, :integer, default: 0
  end
end
