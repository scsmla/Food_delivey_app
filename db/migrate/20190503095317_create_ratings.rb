class CreateRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :ratings do |t|
      t.float :quality_point
      t.float :service_point
      t.float :location_point
      t.float :space_point
      t.float :price_point
      t.references :user, foreign_key: true
      t.references :restaurant, foreign_key: true


      t.timestamps
    end
  end
end
