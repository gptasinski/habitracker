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

  def set_km_time(stat)
    if stat.first_500 != "0" && stat.second_500 != "0"
      km_in_hndths = add_times([stat.first_500, stat.second_500])
      stat.first_km_time = revert_to_minutes(km_in_hndths)
      stat.save
    end
  end

  def set_1500_time(stat)
    if stat.first_km_time != nil && stat.third_500 != "0"
      time_in_hndths = add_times([stat.first_500, stat.second_500, stat.third_500])
      stat.time_1500 = revert_to_minutes(time_in_hndths)
      stat.save
    end
  end

  def set_second_km_time(stat)
    if stat.fourth_500 == "0" || stat.fourth_500 == nil
      stat.second_km_time = "0"
    else
      time = add_times([stat.third_500, stat.fourth_500])
      stat.second_km_time = revert_to_minutes(time)
    end
    stat.save
  end

  def set_2km_time(stat)
    two_km = add_times([stat.first_500, stat.second_500, stat.third_500, stat.fourth_500])
    time = revert_to_minutes(two_km)
  end

  def set_mile_time(stat)
    time = add_times([stat.first_500, stat.second_500, stat.third_500, stat.set_100])
    stat.mile_time = revert_to_minutes(time)
    stat.save
  end

  def swim_set_time(stat)
    if stat.set_distance == 500
      stat.set_time = stat.first_500
      stat.save
    elsif stat.set_distance == 1000
      stat.set_time = stat.first_km_time
      stat.save
    elsif stat.set_distance == 1500
      stat.set_time = stat.time_1500
      stat.save
    elsif stat.set_distance == 1600
      stat.set_time = stat.mile_time
      stat.save
    else
      stat.set_time = set_2km_time(stat)
      stat.save
    end
  end

  def set_times(stat)
    set_km_time(stat)
    set_second_km_time(stat)
    set_1500_time(stat)
    set_mile_time(stat)
    swim_set_time(stat)
  end


end
