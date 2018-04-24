class AddOpenDistanceDurationToPlaces < ActiveRecord::Migration[5.1]
  def change
    add_column :places, :distance, :float
    add_column :places, :duration, :float

    add_column :places, :open, :boolean

  end
end
