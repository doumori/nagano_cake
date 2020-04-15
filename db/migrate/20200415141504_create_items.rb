class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :genre_id
      t.text :description
      t.string :name
      t.integer :price
      t.string :image_id
      t.boolean :is_sale_status

      t.timestamps
    end
  end
end
