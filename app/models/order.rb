class Order < ApplicationRecord
  # 支払方法
  enum pay_method:[:入金待ち,:入金確認,:製作中,:発送準備中,:発送済み]
  # 注文ステータス
  enum status: { クレジットカード: 0, 銀行振込: 1 }
  belongs_to :customer
  has_many :order_items, dependent: :destroy
end
