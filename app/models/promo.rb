class Promo < ApplicationRecord
  belongs_to :category, required: false

  validates :name, presence: { message: "Debe ingresar un nombre" }
  validates :image, attachment_presence: { message: "Debe subir una imagen" }
  has_attached_file :image, styles: { medium: "600x600", small: "240x240" }, default_url: ActionController::Base.helpers.asset_path(":style/missing.png")
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  enum realm: [:decorated, :traditional]
end

# == Schema Information
#
# Table name: promos
#
#  id                 :bigint           not null, primary key
#  image_content_type :string
#  image_file_name    :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#  name               :string
#  priority           :integer
#  realm              :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  category_id        :bigint
#
# Indexes
#
#  index_promos_on_category_id  (category_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#
