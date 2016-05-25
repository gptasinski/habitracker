module SwimStatHelper

  def swim_stats_order
    @user = User.find(session[:id])
    @user.swim_stats.order(created_at: "ASC")
  end


end