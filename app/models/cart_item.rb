class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item

  # validates :cart_items, presence: true
end
