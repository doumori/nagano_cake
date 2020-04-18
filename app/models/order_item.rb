class OrderItem < ApplicationRecord
  belongs_to :customer
  has_many :orders, dependent: :destroy
end
