class SmokerStat < ActiveRecord::Base
  belongs_to :user

  def self.order(user)
    SmokerStat.where(user_id: user.id).order(date: "ASC")
  end

  def cost(location)
    return 0 if self.amount == nil
    location == "city" ? round_up(self.amount.to_f * 0.60) : round_up(self.amount.to_f * 0.35)
  end

  def self.daily_cost_ave(user, location)
    costs = SmokerStat.find_user_stats(user).map { |stat| stat.cost(location) }
    costs.reduce(0) { |sum, cost| sum + cost } / costs.count
  end

  def self.daily_amount_ave(user)
    amounts = SmokerStat.find_user_stats(user).map { |stat| stat.amount }
    amounts.reduce(0) { |sum, amount| sum + amount } / amounts.count
  end

  def self.year_amount(year, user)
    amounts = SmokerStat.find_year_stats(user, year).map { |stat| stat.amount }
    amounts.reduce(0) { |sum, amount| sum + amount }
  end

  def self.year_cost(year, user, location)
    amounts = SmokerStat.find_year_stats(user, year).map { |stat| stat.cost(location)}
    amounts.reduce(0) { |sum, amount| sum + amount }
  end

  private

    def self.find_user_stats(user)
      user_stats = SmokerStat.where(user_id: user.id)
      return 0 if user_stats == []
      user_stats
    end

    def self.find_year_stats(user, year)
      user_stats = SmokerStat.find_user_stats(user)
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



end
