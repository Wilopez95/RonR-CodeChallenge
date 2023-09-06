class ClearanceBatch < ApplicationRecord
  has_many :items

  def total_price
    items.sum(&:price_sold)
  end
end
