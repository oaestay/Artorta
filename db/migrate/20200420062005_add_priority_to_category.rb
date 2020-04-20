class AddPriorityToCategory < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :priority, :integer
    ["decoradas", "novios", "tradicionales", "cupcakes", "coctel", "postres"].each_with_index do |slug, index|
      Category.find_by(slug: slug)&.update! priority: index
    end
  end
end
