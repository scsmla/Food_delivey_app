class CreateFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :foods do |t|
      t.string :name
      t.integer :price
      t.string :image
      t.references :restaurant, foreign_key: true

      t.timestamps
    end
    add_index :foods, [:restaurant_id, :created_at]
  end
end
