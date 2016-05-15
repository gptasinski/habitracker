class SmokerStat < ActiveRecord::Base
  belongs_to :user

  def cost(location, amount)
    return 0 if amount == nil
    location == "city" ? "#{ (amount * 0.60).round }": "#{ (amount * 0.35).round }"
  end
end
