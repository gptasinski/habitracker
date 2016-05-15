module SmokerStatHelper

  def smoker_stats_order(user)
    smoker_stats = user.smoker_stats.order(date: "ASC")
  end

  def round_up(num)
    if /\.0\z/ =~ num.to_s
      num.round
    elsif /\.[01234]/ =~ num.to_s
      num.round + 1
    else
      num.round
    end
  end

  def cost(location, amount)
    return 0 if amount == nil
    location == "city" ? "#{ round_up(amount.to_f * 0.60) }": "#{ round_up(amount.to_f * 0.35) }"
  end

  def daily_amount_ave(user)
    amounts = user.smoker_stats.pluck(:amount)
    return 0 if amounts == []
    amounts.reduce(0) { |sum, amt| sum + amt } / amounts.count
  end

  def daily_cost_ave(user, location)
    amounts = user.smoker_stats.pluck(:amount)
    return 0 if amounts == []
    costs = amounts.map { |amt| cost(location, amt).to_i}
    costs.reduce(0) { |sum, amt| sum + amt } / costs.count
  end

  def current_year
    Time.now.year.to_s[2..3]
  end

  def last_year
    (current_year.to_i - 1).to_s
  end

  def year_amount(year, user)
    stats = user.smoker_stats
    year_stats = stats.select { |stat| stat.date && stat.date.include?(year) }
    amounts = year_stats.map { |stat| stat.amount}
    amounts.reduce(0) { |sum, stat| sum + stat }
  end

end