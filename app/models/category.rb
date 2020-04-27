class Category < ApplicationRecord
  include TagBehaviour

  serialize :subcategories, Hash

  enum realm: [:decorated, :traditional]

  has_many :cakes, dependent: :nullify

  default_scope { order(priority: :asc) }

  scope :active, -> { where(active: true) }

  def subcategories_input
    subcategories.values.join(',')
  end

  def subcategories_input=(values)
    _subcategories = values.split(",")
    self.subcategories = _subcategories.map do |subcategory|
      [normalize_string(subcategory), subcategory]
    end.to_h
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
