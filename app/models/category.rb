class Category < ApplicationRecord
  serialize :subcategories, Hash

  enum realm: [:decorated, :traditional]

  has_many :cakes, dependent: :nullify
end

# == Schema Information
#
# Table name: categories
#
#  id            :bigint           not null, primary key
#  active        :boolean
#  name          :string
#  realm         :integer
#  slug          :string
#  subcategories :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
