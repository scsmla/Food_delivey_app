class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :location
      t.integer :total_ratings
      t.float :ratings
      t.integer :minprice
      t.integer :maxprice
      t.string :open_time
      t.string :close_time
      t.integer :total_reviews

      t.timestamps
    end
  end
end
