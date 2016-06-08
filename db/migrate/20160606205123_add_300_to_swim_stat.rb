class Add300ToSwimStat < ActiveRecord::Migration
  def change
    add_column :swim_stats, :set_300, :string
  end
end
