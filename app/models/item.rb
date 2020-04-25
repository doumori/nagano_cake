class Item < ApplicationRecord
	attachment :image
  has_many :cart_items, dependent: :destroy
  has_many :orders,dependent: :destroy
  belongs_to :genre
  validates :is_sale_status, inclusion: {in: [true, false]}

   def self.search(search)
      return Item.all unless search
      Item.where(['content LIKE ?', "%#{search}%"])
   end

  validates :genre_id, presence: true
  validates :description, presence: true
  validates :name, presence: true
  validates :price, presence: true
  validates :image, presence: true

end
