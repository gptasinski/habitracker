module SwimStatHelper

  def convert_to_hundredths(time)
    converted_minutes(time) + converted_seconds(time) + time.split(".")[2].to_i
  end

  def add_times(times)
    hndth_times = times.map { |time| convert_to_hundredths(time) }
    hndth_times.reduce(0) { |sum, time| sum += time }
  end

  def convert_to_minutes(converted_time)
    minutes = (converted_time / 6000).to_s
    seconds = ((converted_time % 6000) / 100).to_s
    hundredths = (converted_time % 100).to_s
    "#{format(minutes)}.#{format(seconds)}.#{format(hundredths)}"
  end

  def format(measure)
    measure.length == 1 ? ("0" << measure) : measure
  end

  def converted_seconds(time)
    time.split(".")[1].to_i * 100
  end

  def converted_minutes(time)
    time.split(".")[0].to_i * 6000
  end

  def set_first_km_time(stat)
    km = add_times([stat.first_500, stat.second_500])
    stat.first_km_time = convert_to_minutes(km)
  end

  def set_second_km_time(stat)
    km2 = add_times([stat.third_500, stat.fourth_500])
    stat.second_km_time = convert_to_minutes(km2)
  end

  def set_1500_time(stat)
    fift_hund = add_times([stat.first_500, stat.second_500, stat.third_500])
    stat.time_1500 = convert_to_minutes(fift_hund)
  end

  def set_mile_time(stat)
  end

  def set_main_set_time(stat)
  end


end