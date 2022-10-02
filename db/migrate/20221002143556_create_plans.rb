class CreatePlans < ActiveRecord::Migration[6.1]
  def change
    create_table :plans do |t|
      t.integer :user_id, null: false
      t.integer :prefecture, null: false, default: 0
      t.integer :situation, null: false, default: 0
      t.string :destination, null:false
      t.string :start, null: false
      t.string :gole, null: false
      t.text :introduction
      t.integer :minutes, null: false
      t.string :attention

      t.timestamps
    end
  end
end
