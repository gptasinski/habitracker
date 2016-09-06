class SmokerStat < ActiveRecord::Base
  belongs_to :user

  def self.order(user)
    SmokerStat.where(user_id: user.id).order(date: "ASC")
  end

  def cost(location)
    return 0 if self.amount == nil
    location == "city" ? round_up(self.amount.to_f * 0.60) : round_up(self.amount.to_f * 0.35)
  end

  def self.user_daily_cost_ave(user, location)
    stats = user_stats(user)
    costs = location_costs(stats, location)
    find_average(costs)
  end

  def self.user_daily_amount_ave(user)
    stats = user_stats(user)
    amounts = gather_amounts(stats)
    find_average(amounts)
  end

  def self.user_year_amount(year, user)
    stats = year_stats(user, year)
    amounts = gather_amounts(stats)
    reduce_amounts(amounts)
  end

  def self.user_year_cost(year, user, location)
    stats = year_stats(user, year)
    amounts = location_costs(stats)
    reduce_amounts(amounts)
  end

  private

    def self.user_stats(user)
      user_stats = SmokerStat.where(user_id: user.id)
      return 0 if user_stats == []
      user_stats
    end

    def self.year_stats(user, year)
      user_stats = user_stats(user)
      user_stats.select { |stat| stat.date && stat.date.include?(year) }
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

    def self.reduce_amounts(amounts)
      amounts.reduce(0) { |sum, amount| sum + amount }
    end

    def self.find_average(array)
      reduce_amounts(array) / array.count
    end

    def self.gather_amounts(stats)
      stats.map { |stat| stat.amount }
    end

    def self.location_costs(stats, location)
      stats.map { |stat| stat.cost(location)}
    end
end
