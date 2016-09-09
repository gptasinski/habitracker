class SwimStat < ActiveRecord::Base

  belongs_to :user

  validates :warm_50, :warm_100, :warm_200, :warm_400, :pre_50, :first_500, :second_500, :third_500, :fourth_500, :set_100, :cool_400, :cool_200, :cool_100, :cool_50, :set_distance, :set_time, :total_time, presence: true
  validates :date, uniqueness: true
  validates :date, format: { with: /\A\d{2}.\d{2}.\d{2}\z/,
                             message: "must be in the format of 'mm.dd.yy'."}
  validates :warm_50, :warm_100, :warm_200, :warm_400, :pre_50, :cool_400, :cool_200, :cool_100, :cool_50, :set_time, :total_time, format: { with: /\A\d{2}:\d{2}.\d{2}\z/, message: "must be in the format of 'nn:nn.nn'"}
  validates :set_distance, numericality: true
  validates :set_distance, length: { minimum: 3 }
  validates :set_distance, length: { maximum: 4 }

  def self.target_times(distance, user)
    stats = SwimStat.where(user_id: user.id)
    stats.pluck(distance)
  end

  def self.user_best_time(distance, user)
    times = target_times(distance, user)
    reject_zeroes(times).min
  end

  def self.user_worst_time(distance, user)
    times = target_times(distance, user)
    reject_zeroes(times).max
  end

  def self.find_date_for(distance, time)
    stat = SwimStat.find_by("#{distance}": time)
    stat == nil ? "" : stat.date
  end

  def minutes(time)
    time.split(":")[0].to_i
  end

  def seconds(time)
    time.split(":")[1].split(".")[0].to_i
  end

  def hundredths(time)
    time.split(":")[1].split(".")[1].to_i
  end

  def minutes_in_hundredths(time)
    minutes(time) * 6000
  end

  def seconds_in_hundredths(time)
    seconds(time) * 100
  end

  def convert_to_hundredths(time)
    minutes_in_hundredths(time) + seconds_in_hundredths(time) + hundredths(time)
  end

  def format(measure)
    measure.length == 1 ? ("0" << measure) : measure
  end

  def revert_to_minutes(converted_time)
    minutes = (converted_time / 6000).to_s
    seconds = ((converted_time % 6000) / 100).to_s
    hundredths = (converted_time % 100).to_s
    "#{format(minutes)}:#{format(seconds)}.#{format(hundredths)}"
  end

  def add_times(times)
    hndth_times = times.map { |time| convert_to_hundredths(time) }
    hndth_times.reduce(0) { |sum, time| sum += time }
  end

  def find_time(times)
    time_in_hundredths = add_times(times)
    revert_to_minutes(time_in_hundredths)
  end

  def set_800_time
    if self.set_300 != "0"
      self.first_800_time = find_time([self.first_500, self.set_300])
    end
  end

  def set_second_800_time
    if self.set_100 != "0"
      mile = convert_to_hundredths(self.mile_time)
      first_800 = convert_to_hundredths(self.first_800_time)
      second_in_hunds = mile - first_800
      self.second_800_time = revert_to_minutes(second_in_hunds)
    end
  end

  def set_km_time
    if self.first_500 != "0" && self.second_500 != "0"
      self.first_km_time = find_time([self.first_500, self.second_500])
    end
  end

  def set_1500_time
    if self.third_500 != "0"
      self.time_1500 = find_time([self.first_500, self.second_500, self.third_500])
    end
  end

  def set_second_km_time
    if self.fourth_500 != "0"
      self.second_km_time = find_time([self.third_500, self.fourth_500])
    end
  end

  def set_2km_time
    if self.second_km_time != nil
      self.time_2km = find_time([self.first_500, self.second_500, self.third_500, self.fourth_500])
    end
  end

  def set_mile_time
    if self.set_100 != "0" || self.set_100 == nil
      self.mile_time = find_time([self.first_500, self.second_500, self.third_500, self.set_100])
    end
  end

  def swim_set_time
    if self.set_distance == 500
      self.set_time = self.first_500
    elsif self.set_distance == 1000
      self.set_time = self.first_km_time
    elsif self.set_distance == 1500
      self.set_time = self.time_1500
    elsif self.set_distance == 1600
      self.set_time = self.mile_time
    elsif self.set_distance == 2000
      self.set_time = set_2km_time
    else
      self.set_time = "0"
    end
  end

  def set_times
    set_km_time
    set_second_km_time
    set_2km_time
    set_1500_time
    set_mile_time
    set_800_time
    set_second_800_time
    swim_set_time
  end

  private
    def self.reject_zeroes(times)
      times.reject { |time| time == "0" || time == nil }
    end

end
