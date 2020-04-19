# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


if Rails.env == "development"
  (1..9).each do |i|
    Customer.create!(last_name: "test#{1}", first_name: "test#{1}", last_name_kana: "test#{1}", first_name_kana: "test#{1}", post_code: "123123#{1}", address: "test#{1}", phone_number: "1234567890#{1}",email: "test#{i}@example.com", password: "password", password_confirmation: "password")
  end
end


if Rails.env == "development"
  (1..9).each do |i|
    Ship.create!(customer_id: "#{1}", address: "test#{1}", name: "test#{1}", code: "123456#{1}")
  end
end


if Rails.env == "development"
  (1..9).each do |i|
    Genre.create!(name: "test#{1}", is_active: "test#{1}")
  end
end


if Rails.env == "development"
  (1..9).each do |i|
    Item.create!(genre_id: "test#{1}", description: "test#{1}", name: "test#{1}", price: "100#{1}", image_id: "test#{1}", is_sale_status: "test#{1}")
  end
end


if Rails.env == "development"
  (1..9).each do |i|
    OrderItem.create!(item_id: "test#{1}", order_id: "test#{1}", product_status: "test#{1}", price: "test#{1}", quantity: "test#{1}", name: "test#{1}")
  end
end

if Rails.env == "development"
  (1..9).each do |i|
    Admin.create!(email: "test#{i}@example.com", password: "password")

  end
end
