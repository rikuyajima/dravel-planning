class CreatePlanComments < ActiveRecord::Migration[6.1]
  def change
    create_table :plan_comments do |t|
      t.text :comment
      t.integer :user_id
      t.integer :plan_id

      t.timestamps
    end
  end
end
