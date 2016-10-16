class CreateDebts < ActiveRecord::Migration
  def change
    create_table :debts do |t|
      t.integer   :user_id, null: false
      t.string    :title, null: false
      t.float     :initial_amount, null: false
      t.float     :current_amount
      t.string    :target_payoff_date
      t.timestamps null: false
    end
  end
end
