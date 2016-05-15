class CreateSwimStats < ActiveRecord::Migration
  def change
    create_table :swim_stats do |t|
      t.integer   :user_id
      t.string    :date
      t.string    :warm_50
      t.string    :warm_100
      t.string    :warm_200
      t.string    :warm_400
      t.string    :pre_50
      t.string    :first_500
      t.string    :second_500
      t.string    :third_500
      t.string    :fourth_500
      t.string    :set_100
      t.string    :post_50
      t.string    :cool_400
      t.string    :cool_200
      t.string    :cool_100
      t.string    :cool_50
      t.integer   :set_distance
      t.string    :set_time
      t.string    :first_800_time
      t.string    :second_800_time
      t.string    :first_km_time
      t.string    :second_km_time
      t.string    :time_1500
      t.string    :mile_time
      t.integer   :total_distance
      t.string    :swim_time
      t.string    :total_time

      t.timestamps null: false
    end
  end
end
