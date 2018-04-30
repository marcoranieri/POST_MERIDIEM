class AddStatusToMatches < ActiveRecord::Migration[5.1]
  def change
    add_column :matches, :status, :string, default: nil
  end
end
