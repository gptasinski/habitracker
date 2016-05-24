class AddTime2kToSwimStat < ActiveRecord::Migration
  def change
    add_column :swim_stats, :time_2km, :string
  end
end
