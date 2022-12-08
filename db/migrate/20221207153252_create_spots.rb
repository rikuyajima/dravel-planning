class CreateSpots < ActiveRecord::Migration[6.1]
  def change
    create_table :spots do |t|
      t.integer :user_id
      t.string :address
      t.float :latitude
      t.float :longitude
      t.integer :perfecture_id
      t.integer :status
      t.timestamps
    end
  end
end
