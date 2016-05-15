class CreateSmokerStats < ActiveRecord::Migration
  def change
    create_table :smoker_stats do |t|
      t.integer   :user_id, null: false
      t.integer   :amount, null: false
      t.string    :date, null: false
      t.timestamps null: false
    end
  end
end
