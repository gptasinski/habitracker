class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer   :debt_id, null: false
      t.string    :amount, null: false
      t.string    :date
      t.timestamps null: false
    end
  end
end
