module SmokerStatHelper

  def current_user_amount
    @smoker_stats.user_amount(user: current_user)
  end

  def current_user_cost(location)
    @smoker_stats.user_cost(user: current_user, location: location)
  end


end