class ChangeDatatypeStatusOfSpot < ActiveRecord::Migration[6.1]
  def change
    change_column :spots, :status, :integer
  end
end
