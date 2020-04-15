class CreateShips < ActiveRecord::Migration[5.2]
  def change
    create_table :ships do |t|
      t.integer :customer_id
      t.string :address
      t.string :name
      t.string :code

      t.timestamps
    end
  end
end
