class RemoveNullConstraintUserIdSmokerStat < ActiveRecord::Migration
  def change
    change_column_null  :smoker_stats, :user_id, false
  end
end
