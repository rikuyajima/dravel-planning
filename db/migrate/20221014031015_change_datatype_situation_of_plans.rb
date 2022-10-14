class ChangeDatatypeSituationOfPlans < ActiveRecord::Migration[6.1]
  def change
    change_column :plans, :situation, :string
  end
end
