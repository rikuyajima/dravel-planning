class CreateRelays < ActiveRecord::Migration[6.1]
  def change
    create_table :relays do |t|
      t.integer :plan_id, null: false
      t.string :reley_point, null: false
      t.text :point_introduction
      t.integer :travel_time, null: false
      t.string :travel_attention

      t.timestamps
    end
  end
end
