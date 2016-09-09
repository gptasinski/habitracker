require 'rails_helper'



describe "Swim Stat" do
  let!(:user) { User.create(name: "Test Swimmer", email: "testswimmer@gmail.com", password: "123") }
  let!(:workout) { SwimStat.create(user_id: user.id,
                                 date: "04.22.16",
                                 warm_50: "00:40.01",
                                 warm_100: "01:39.43",
                                 warm_200: "03:19.89",
                                 warm_400: "06:54.33",
                                 pre_50: "00:44.95",
                                 first_500: "08:15.66",
                                 set_300: "03:31.45",
                                 second_500: "08:18.82",
                                 third_500: "08:22.38",
                                 fourth_500: "08:37.99",
                                 set_100: "01:47.61",
                                 post_50: "00:49.65",
                                 cool_400: "07:01.10",
                                 cool_200: "03:27.55",
                                 cool_100: "01:48.42",
                                 cool_50:  "00:48.88",
                                 set_distance: 1600,
                                 total_distance: 3200,
                                 swim_time: "53:58.68",
                                 total_time: "59:23.84"
                                 )}
  let!(:workout_two) { SwimStat.create(user_id: user.id,
                                 date: "04.23.16",
                                 warm_50: "00:34.01",
                                 warm_100: "01:42.43",
                                 warm_200: "03:12.89",
                                 warm_400: "07:01.33",
                                 pre_50: "00:48.95",
                                 first_500: "08:15.91",
                                 set_300: "03:31.59",
                                 second_500: "08:19.82",
                                 third_500: "08:24.38",
                                 fourth_500: "0",
                                 set_100: "01:27.61",
                                 post_50: "00:29.65",
                                 cool_400: "07:47.10",
                                 cool_200: "03:07.55",
                                 cool_100: "01:34.42",
                                 cool_50:  "00:48.08",
                                 set_distance: 1600,
                                 total_distance: 3200,
                                 swim_time: "53:58.68",
                                 total_time: "59:23.84"
                                 )}



  it "has a date" do
    expect(workout.date).to eq("04.22.16")
  end

  it "has a time for the warm up 50 M" do
    expect(workout.warm_50).to eq("00:40.01")
  end

  it "has a value for the warm up 100 M" do
    expect(workout.warm_100).to eq("01:39.43")
  end

  it "has a value for the warm up 200 M" do
    expect(workout.warm_200).to eq("03:19.89")
  end

  it "has a value for the warm up 400 M" do
    expect(workout.warm_400).to eq("06:54.33")
  end

  it "has a value for the pre-set 50 M" do
    expect(workout.pre_50).to eq("00:44.95")
  end

  it "has a value for the first 500 M" do
    expect(workout.first_500).to eq("08:15.66")
  end

  it "has a value to the set_300" do
    expect(workout.set_300).to eq("03:31.45")
  end

  it "has a value for the second 500 M" do
    expect(workout.second_500).to eq("08:18.82")
  end

  it "has a value for the third 500 M" do
    expect(workout.third_500).to eq("08:22.38")
  end

  it "has a value for the fourth 500 M" do
    expect(workout.fourth_500).to eq("08:37.99")
  end

  it "has a value for the set 100 M" do
    expect(workout.set_100).to eq("01:47.61")
  end

  it "has a value for the post-set 50 M" do
    expect(workout.post_50).to eq("00:49.65")
  end

  it "has a value for the cool down 400 M" do
    expect(workout.cool_400).to eq("07:01.10")
  end

  it "has a value for the cool down 200 M" do
    expect(workout.cool_200).to eq("03:27.55")
  end

  it "has a value for the cool down 100 M" do
    expect(workout.cool_100).to eq("01:48.42")
  end

  it "has a value for the cool down 50 M" do
    expect(workout.cool_50).to eq("00:48.88")
  end

  it "has a value for the set distance" do
    expect(workout.set_distance).to eq(1600)
  end

  it "has a nil value for the set time" do
    expect(workout.set_time).to be(nil)
  end

  it "has a nil value for the first 800 M" do
    expect(workout.first_800_time).to be(nil)
  end

  it "has a nil value for the second 800 M" do
    expect(workout.second_800_time).to be(nil)
  end

  it "has a nil value for the first KM" do
    expect(workout.first_km_time).to be(nil)
  end

  it "has a nil value for the second KM" do
    expect(workout.second_km_time).to be(nil)
  end

  it "has a nil value for the 1500 M" do
    expect(workout.time_1500).to be(nil)
  end

  it "has a nil value for the mile time" do
    expect(workout.mile_time).to be(nil)
  end

  it "has a nil value for the 2km time" do
    expect(workout.time_2km).to be(nil)
  end

  it "has a value for the total distance" do
    expect(workout.total_distance).to eq(3200)
  end

  it "has a value for the swim time" do
    expect(workout.swim_time).to eq("53:58.68")
  end

  it "has a value for the total time" do
    expect(workout.total_time).to eq("59:23.84")
  end


  describe ".target_times" do
    it "returns an array of times for a given distance for a given user" do
      expect(SwimStat.target_times("first_500", user)).to eq(["08:15.66", "08:15.91"])
    end
  end

  describe ".user_best_time" do
    it "returns the fastest time for a given distance and user" do
      expect(SwimStat.user_best_time("cool_50", user)).to eq("00:48.08")
    end
  end

  describe ".user_worst_time" do
    it "returns the slowest time for a given distance and user" do
      expect(SwimStat.user_worst_time("set_100", user)).to eq("01:47.61")
    end
  end

  describe ".find_date_for" do
    it "returns the corresponding date for a matching distance and time for a given user" do
      expect(SwimStat.find_date_for("third_500", "08:24.38")).to eq("04.23.16")
    end
  end



  # =================================================

  describe ".minutes(time)" do
    it "finds the minutes value as a fixnum for a given stat's time" do
      time = workout.minutes(workout.first_500)
      expect(time).to eq(8)
      expect(time.class).to be(Fixnum)
    end
  end

  describe ".seconds(time)" do
    it "finds the seconds value as a Fixnum for a given stat's time" do
      time = workout.seconds(workout.first_500)
      expect(time).to eq(15)
      expect(time.class).to be(Fixnum)
    end
  end

  describe ".hundredths(time)" do
    it "finds the hundredths value as a Fixnum for a given stat's time" do
      time = workout.hundredths(workout.first_500)
      expect(time).to eq(66)
      expect(time.class).to be(Fixnum)
    end
  end

  describe ".minutes_in_hundredths(time)" do
    it "converts a time's minute value to hundredths of a second" do
      time = workout.third_500
      expect(workout.minutes_in_hundredths(time)).to eq(48_000)
    end
  end

  describe ".seconds_in_hundredths(time)" do
    it "converts a time's second value to hundredths of a second" do
      time = workout.third_500
      expect(workout.seconds_in_hundredths(time)).to eq(2_200)
    end
  end

  describe ".convert_to_hundredths" do
    it "converts a stat's given time to hundredths" do
      time = workout.second_500
      expect(workout.convert_to_hundredths(time)).to eq(49882)
    end
  end

  describe ".revert_to_minutes(converted_time)" do
    it "reverts a time in hundredths to the form of mm:ss.hh" do
      hndths = workout.convert_to_hundredths(workout.cool_400)
      reverted = workout.revert_to_minutes(hndths)
      expect(reverted).to eq("07:01.10")
    end
  end

  describe ".add_times(time)" do
    it "adds the given stat's times and returns a hundredths value" do
      times = [workout.first_500, workout.second_500]
      added = workout.add_times(times)
      expect(added).to eq(99448)
    end
  end

  describe ".set_times" do
    let(:slow) { SwimStat.new(user_id: user.id,
                                 date: "04.22.16",
                                 warm_50: "00:40.01",
                                 warm_100: "01:39.43",
                                 warm_200: "03:19.89",
                                 warm_400: "06:54.33",
                                 pre_50: "00:44.95",
                                 first_500: "0",
                                 set_300: "0",
                                 second_500: "0",
                                 third_500: "0",
                                 fourth_500: "0",
                                 set_100: "0",
                                 post_50: "00:49.65",
                                 cool_400: "07:01.10",
                                 cool_200: "03:27.55",
                                 cool_100: "01:48.42",
                                 cool_50:  "00:48.88",
                                 set_distance: 0,
                                 total_distance: 1600,
                                 swim_time: "53:58.68",
                                 total_time: "59:23.84"
                                 )}
    before { workout.set_times }
    before { slow.set_times }

    context "setting the first km time" do
      it "sets the first_km_time if the stat has first and second 500 times" do
        expect(workout.first_km_time).to eq("16:34.48")
      end

      it "does not set the first_km_time if either the first or second 500 value is '0'" do
        expect(slow.first_km_time).to be(nil)
      end
    end

    context "setting the second_km_time" do
      it "sets the second_km_time if the stat has third and fourth 500 values that are not '0'" do
        expect(workout.second_km_time).to eq("17:00.37")
      end

      it "does not set the second_km_time if the stat's fourth 500 value is '0'" do
        expect(slow.second_km_time).to be(nil)
      end
    end

    context "setting the time_1500" do
      it "sets the time_1500 if the stat's third 500 value is not '0'" do
        expect(workout.time_1500).to eq("24:56.86")
      end
      it "does not set the time_1500 if the stat's third 500 value is '0'" do
        expect(slow.time_1500).to be(nil)
      end
    end

    context "setting the mile_time" do
      it "sets the mile time if the stat's set_100 value is not '0'" do
        expect(workout.mile_time).to eq("26:44.47")
      end

      it "does not set the mile_time if the stat's set_100 value is '0'" do
        expect(slow.mile_time).to be(nil)
      end
    end

    context "setting the first_800_time" do
      it "sets the first_800_time if the set_300 value is not '0'" do
        expect(workout.first_800_time).to eq("11:47.11")
      end

      it "does not set the first_800_time if the set_300 value is '0'" do
        expect(slow.first_800_time).to be(nil)
      end
    end

    context "setting the second_800_time" do
      it "sets the second_km_time if the stat's set_100 value is '0'" do
        expect(workout.second_km_time).to eq("17:00.37")
      end

      it "does not set the second_km_time if the stat's set_100 value is '0'" do
        expect(slow.second_km_time).to be(nil)
      end
    end

    context "setting the 2km time" do
      it "sets the time_2km if the stat has a non nil value for the second_km_time" do
        expect(workout.time_2km).to eq("33:34.85")
      end

      it "does not set the time_2km if the stat has a nil value for second_km_time" do
        expect(slow.time_2km).to be(nil)
      end
    end

    context "setting the swim_set_time" do
      it "sets the total time of the stat's swim set, if there the set distance is greater than 500 M" do
        expect(workout.swim_set_time).to eq("26:44.47")
      end

      it "does not set the swim set time if the stat's distance is less than 500 M" do
        expect(slow.swim_set_time).to eq("0")
      end
    end
  end
end
