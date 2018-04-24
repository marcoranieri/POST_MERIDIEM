class CreatePlaces < ActiveRecord::Migration[5.1]
  def change
    create_table :places do |t|
      t.string :name
      t.string :address
      t.string :phone_number
      t.string :lat
      t.string :lng
      t.text :review_text
      t.float :average_rating
      t.string :photo
      t.string :type

      t.timestamps
    end
  end
end
