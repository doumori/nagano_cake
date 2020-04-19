class Order < ApplicationRecord
  # 支払方法
  enum pay_method: { 入金待ち: 0,入金確認: 1,製作中: 2,発送準備中:3 ,発送済み:4 }
  # 注文ステータス
  enum status: { クレジットカード: 0,銀行振込: 1 }
  belongs_to :customer
  has_many :order_items, dependent: :destroy
end