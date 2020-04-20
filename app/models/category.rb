class Category < ApplicationRecord
  serialize :subcategories, Hash

  enum realm: [:decorated, :traditional]

  has_many :cakes, dependent: :nullify

  default_scope { order(priority: :asc) }

  scope :active, -> { where(active: true) }

  def subcategories_input
    subcategories.values
  end
end

# == Schema Information
#
# Table name: categories
#
#  id            :bigint           not null, primary key
#  active        :boolean
#  name          :string
#  priority      :integer
#  realm         :integer
#  slug          :string
#  subcategories :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
