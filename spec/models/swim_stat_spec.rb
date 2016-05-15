require 'rails_helper'

describe "Swim Stat" do
  let(:user) { User.create!(name: "Test Swimmer", email: "testswimmer@gmail.com", password: "123") }
  let(:workout) { SwimStat.create!(user_id: user.id,
                                 date: "04.22.16",
                                 warm_50: "00.40.01",
                                 warm_100: "01.39.43",
                                 warm_200: "03.19.89",
                                 warm_400: "06.54.33",
                                 pre_50: "00.44.95",
                                 first_500: "08.15.66",
                                 second_500: "08.18.82",
                                 third_500: "08.22.38",
                                 fourth_500: "0",
                                 set_100: "01.47.61",
                                 post_50: "00.49.65",
                                 cool_400: "07.01.10",
                                 cool_200: "03.27.55",
                                 cool_100: "01.48.42",
                                 cool_50:  "00.48.88",
                                 set_distance: 1600,
                                 set_time: "26.44.47",
                                 first_800_time: "0",
                                 second_800_time: "0",
                                 first_km_time: "16.34.48",
                                 second_km_time: "0",
                                 time_1500: "24.56.86",
                                 total_distance: 3200,
                                 swim_time: "53.58.68",
                                 total_time: "59.23.84"
                                 )}
  it "has a date" do
    expect(workout.date).to eq("04.22.16")
  end

  it "has a time for the warm up 50 M" do
    expect(workout.warm_50).to eq("00.40.01")
  end

  it "has a value for the warm up 100 M" do
    expect(workout.warm_100).to eq("01.39.43")
  end

  it "has a value for the warm up 200 M" do
    expect(workout.warm_200).to eq("03.19.89")
  end

  it "has a value for the warm up 400 M" do
    expect(workout.warm_400).to eq("06.54.33")
  end

  it "has a value for the pre-set 50 M" do
    expect(workout.pre_50).to eq("00.44.95")
  end

  it "has a value for the first 500 M" do
    expect(workout.first_500).to eq("08.15.66")
  end

  it "has a value for the second 500 M" do
    expect(workout.second_500).to eq("08.18.82")
  end

  it "has a value for the third 500 M" do
    expect(workout.third_500).to eq("08.22.38")
  end

  it "has a value for the fourth 500 M" do
    expect(workout.fourth_500).to eq("0")
  end

  it "has a value for the set 100 M" do
    expect(workout.set_100).to eq("01.47.61")
  end

  it "has a value for the post-set 50 M" do
    expect(workout.post_50).to eq("00.49.65")
  end

  it "has a value for the cool down 400 M" do
    expect(workout.cool_400).to eq("07.01.10")
  end

  it "has a value for the cool down 200 M" do
    expect(workout.cool_200).to eq("03.27.55")
  end

  it "has a value for the cool down 100 M" do
    expect(workout.cool_100).to eq("01.48.42")
  end

  it "has a value for the cool down 50 M" do
    expect(workout.cool_50).to eq("00.48.88")
  end

  it "has a value for the set distance" do
    expect(workout.set_distance).to eq(1600)
  end

  it "has a value for the set time" do
    expect(workout.set_time).to eq("26.44.47")
  end

  it "has a value for the first 800 M" do
    expect(workout.first_800_time).to eq("0")
  end

  it "has a value for the second 800 M" do
    expect(workout.second_800_time).to eq("0")
  end

  it "has a value for the first KM" do
    expect(workout.first_km_time).to eq("16.34.48")
  end

  it "has a value for the second KM" do
    expect(workout.second_km_time).to eq("0")
  end

  it "has a value for the 1500 M" do
    expect(workout.time_1500).to eq("24.56.86")
  end

  it "has a value for the total distance" do
    expect(workout.total_distance).to eq(3200)
  end

  it "has a value for the swim time" do
    expect(workout.swim_time).to eq("53.58.68")
  end

  it "has a value for the total time" do
    expect(workout.total_time).to eq("59.23.84")
  end
end
