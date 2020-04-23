class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item

  enum product_status: { 着手不可: 0,製作待ち: 1,製作中: 2,製作完了:3 }

  validates :item_id, presence: true
  validates :order_id, presence: true
  validates :product_status, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
  validates :name, presence: true
end
