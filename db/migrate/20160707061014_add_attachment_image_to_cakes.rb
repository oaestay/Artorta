class AddAttachmentImageToCakes < ActiveRecord::Migration
  def self.up
    change_table :cakes do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :cakes, :image
  end
end
