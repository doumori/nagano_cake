FactoryBot.define do
  factory :order do
    customer_id { 1 }
    pay_method { 1 }
    status { 1 }
    freight { 1 }
    total { 1 }
    ship_name { "MyString" }
    ship_postcode { "MyString" }
    ship_address { "MyString" }
  end
end
