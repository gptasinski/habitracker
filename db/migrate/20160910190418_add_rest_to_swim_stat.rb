class AddRestToSwimStat < ActiveRecord::Migration
  def change
    add_column :swim_stats, :rest, :string
  end
end
