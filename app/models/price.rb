class Price < ApplicationRecord
  belongs_to :cake, required: false
end

# == Schema Information
#
# Table name: prices
#
#  id         :integer          not null, primary key
#  portions   :integer
#  price      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  cake_id    :integer
#
# Indexes
#
#  index_prices_on_cake_id  (cake_id)
#
# Foreign Keys
#
#  fk_rails_...  (cake_id => cakes.id)
#
