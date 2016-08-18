class AddAttachmentImageToWeddingToppings < ActiveRecord::Migration
  def self.up
    change_table :wedding_toppings do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :wedding_toppings, :image
  end
end
