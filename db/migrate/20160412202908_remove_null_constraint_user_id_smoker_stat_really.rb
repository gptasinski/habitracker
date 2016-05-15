class RemoveNullConstraintUserIdSmokerStatReally < ActiveRecord::Migration
  def change
    change_column_null  :smoker_stats, :user_id, true
  end
end
