class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.integer :kinds, default: 0, null: false
      t.integer :user_id
      t.string :subject, null: false
      t.integer :contact_status, default: 0
      t.text :message, null: false

      t.timestamps
    end
  end
end
