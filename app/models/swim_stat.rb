class SwimStat < ActiveRecord::Base

  belongs_to :user


  def self.set_km_time
    # self.first_km_time = self.first_500 + self.second_500
    added = add_times([self.first_500, self.second_500])
    self.first_km_time = convert_to_minutes(added)
  end

end
