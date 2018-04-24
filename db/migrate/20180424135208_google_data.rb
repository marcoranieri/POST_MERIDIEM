class GoogleData < ActiveRecord::Migration[5.1]
  def change
    add_column :places, :google_data, :jsonb
  end
end
