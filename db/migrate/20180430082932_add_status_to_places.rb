class AddStatusToPlaces < ActiveRecord::Migration[5.1]
  def change
    add_column :places, :status, :string, default: nil
  end
end
