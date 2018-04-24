class AddWebsiteTimetableUrlmapsToPlaces < ActiveRecord::Migration[5.1]
  def change
    remove_column :places, :distance
    remove_column :places, :duration
    remove_column :places, :open
    add_column :places, :website, :string
    add_column :places, :timetable, :text
    add_column :places, :urlmaps, :string
  end
end
