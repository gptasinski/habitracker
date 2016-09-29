class AddDateToPedStats < ActiveRecord::Migration
  def change
    add_column :ped_stats, :date, :string
  end
end
