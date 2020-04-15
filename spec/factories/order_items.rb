FactoryBot.define do
  factory :order_item do
    item_id { 1 }
    order_id { 1 }
    product_status { 1 }
    price { 1 }
    quantity { 1 }
    name { "MyString" }
  end
end
