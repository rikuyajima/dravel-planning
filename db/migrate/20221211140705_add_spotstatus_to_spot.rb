class AddSpotstatusToSpot < ActiveRecord::Migration[6.1]
  def change
    add_column :spots, :spotstatus, :boolean
  end
end
