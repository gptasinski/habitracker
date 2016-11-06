class PedStat < ActiveRecord::Base
  belongs_to :user

  def set_user(user)
    self.user_id = user.id
  end

  def set_distance
    feet = self.steps.to_f * 2.5
    self.distance = (feet / 5280).round(2)
    self.save
  end
end