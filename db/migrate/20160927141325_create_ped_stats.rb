class CreatePedStats < ActiveRecord::Migration
  def change
    create_table :ped_stats do |t|
      t.integer   :user_id, null: false
      t.integer   :steps, null: false
      t.string    :time
      t.float     :distance
      t.integer   :calories
    end
  end
end
