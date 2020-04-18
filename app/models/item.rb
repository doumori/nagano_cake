class Item < ApplicationRecord
	attachment :image
  has_many :cart_items, dependent: :destroy
  belongs_to :genre
end
>>>>>>> 9840f0f26d52323986a5b20c3532b21d3bc1bfc4
