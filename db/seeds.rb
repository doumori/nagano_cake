# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



if Rails.env == "development"
  (1..9).each do |i|
    Item.create!(genre_id: "100#{i}", description: "test#{i}", name: "test#{i}", price: "100#{i}", image_id: "test#{i}", is_sale_status: "test#{i}")
  end
end


if Rails.env == "development"
  (1..9).each do |i|
    OrderItem.create!(item_id: "item#{i}", order_id: "order#{i}", product_status: "test#{i}", price: "50#{i}", quantity: "test#{i}", name: "test#{i}")
  end
end
