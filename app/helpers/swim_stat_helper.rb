module SwimStatHelper

  def swim_stats_order
    @user = User.find(session[:id])
    @user.swim_stats.order(created_at: "ASC")
  end

  def targets(distance)
    user = User.find(session[:id])
    swimstats = user.swim_stats
    swimstats.pluck(distance)
  end

  def reject_zeros(times)
    times.reject { |time| time == "0" || time == nil }
  end

  def best_time(distance)
    reject_zeros(targets(distance)).min
  end

  def worst_time(distance)
    reject_zeros(targets(distance)).max
  end

  def bw_date(distance, best_time)
    swimstat = SwimStat.find_by("#{distance}": best_time)
    swimstat == nil ? "" : swimstat.date
  end


end