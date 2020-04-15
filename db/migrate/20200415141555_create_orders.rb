class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :pay_method
      t.integer :status
      t.integer :freight
      t.integer :total
      t.string :ship_name
      t.string :ship_postcode
      t.string :ship_address

      t.timestamps
    end
  end
end
