class RenameLatitudeColumnToSpots < ActiveRecord::Migration[6.1]
  def change
    rename_column :spots, :longitude, :lng
    rename_column :spots, :latitude, :lat
  end
end
