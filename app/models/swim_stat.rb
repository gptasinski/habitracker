class SwimStat < ActiveRecord::Base

  belongs_to :user

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

  def set_km_time
    if self.first_500 != "0" && self.second_500 != "0"
      km_in_hndths = add_times([self.first_500, self.second_500])
      self.first_km_time = revert_to_minutes(km_in_hndths)
      # self.save
    end
  end

  def set_1500_time
    if self.first_km_time != nil && self.third_500 != "0"
      time_in_hndths = add_times([self.first_500, self.second_500, self.third_500])
      self.time_1500 = revert_to_minutes(time_in_hndths)
      # self.save
    end
  end

  def set_second_km_time
    if self.fourth_500 == "0" || self.fourth_500 == nil
      self.second_km_time = "0"
    else
      time = add_times([self.third_500, self.fourth_500])
      self.second_km_time = revert_to_minutes(time)
    end
    # self.save
  end

  def set_2km_time
    two_km = add_times([self.first_500, self.second_500, self.third_500, self.fourth_500])
    time = revert_to_minutes(two_km)
    self.time_2km = time
    # self.save
  end

  def set_mile_time
    time = add_times([self.first_500, self.second_500, self.third_500, self.set_100])
    self.mile_time = revert_to_minutes(time)
    # self.save
  end

  def swim_set_time
    if self.set_distance == 500
      self.set_time = self.first_500
      # self.save
    elsif self.set_distance == 1000
      self.set_time = self.first_km_time
      # self.save
    elsif self.set_distance == 1500
      self.set_time = self.time_1500
      # self.save
    elsif self.set_distance == 1600
      self.set_time = self.mile_time
      # self.save
    else
      self.set_time = set_2km_time
      # self.save
    end
  end

  def set_times
    set_km_time
    set_second_km_time
    set_1500_time
    set_mile_time
    swim_set_time
  end






end
