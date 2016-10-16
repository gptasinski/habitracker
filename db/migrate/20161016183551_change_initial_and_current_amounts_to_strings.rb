class ChangeInitialAndCurrentAmountsToStrings < ActiveRecord::Migration
  def change
    change_column :debts, :initial_amount, :string
    change_column :debts, :current_amount, :string
  end
end
