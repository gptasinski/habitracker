require 'rails_helper'
include SmokerStatHelper


describe "SmokerStat" do
  let(:user) { User.create(name: "Greg", email: "greg@gmail.com", password: "123")}
  let(:test_one) { SmokerStat.create(user_id: user.id, date: "04.14.2014", amount: 14) }
  let(:test_two) { SmokerStat.create(user_id: user.id, date: "03.15.2015", amount: 15) }
  let(:test_three) { SmokerStat.create(user_id: user.id, date: "04.15.2015", amount: 16) }



  it "has a string date" do
    expect(test_one.date).to be_a(String)
  end

  it "has an integer amount" do
    expect(test_one.amount).to be_a(Integer)
  end

  describe"#smoker_stats_order" do
    it "orders a given user's smoker_stats by date, oldest to newest" do
      user.smoker_stats << test_one << test_two << test_three
      first = smoker_stats_order(user).first.date
      last = smoker_stats_order(user).last.date
      expect(first).to be < last
    end
  end

  describe "#round_up" do
    it "rounds any float up to the next whole integer" do
      expect(round_up(1.1)).to be(2)
      expect(round_up(1.49)).to be(2)
      expect(round_up(1.00001)).to be(2)
      expect(round_up(1.9)).to be(2)
    end
  end

  describe "#cost" do
    it "finds the cost of a given amount purchased in the city" do
      expect(cost("city", test_one.amount)).to eq("9")
    end

    it "finds the cost of a given amount purchased in the burbs" do
      expect(cost("burbs", test_one.amount)).to eq("5")
    end
  end

  describe "#daily_amount_ave" do
    it "returns 0 if there are not smoker_stats associated with the user" do
      expect(daily_amount_ave(user)).to eq(0)
    end
    it "returns average amount of cigs smoked in a day" do
      user.smoker_stats << test_one << test_two << test_three
      expect(daily_amount_ave(user)).to eq(15)
    end
  end

  describe "#daily_cost_ave" do
    it "returns 0 if there are not smoker_stats associated with the user" do
      expect(daily_cost_ave(user, "city")).to eq(0)
      expect(daily_cost_ave(user, "burbs")).to eq(0)
    end

    it "returns the average cost of cigs smoked by a user in a day rounded up on a dollar" do
      user.smoker_stats << test_one << test_two << test_three
      expect(daily_cost_ave(user, "city")).to eq(9)
      expect(daily_cost_ave(user, "burbs")).to eq(5)
    end
  end

  describe "#current_year" do
    it "returns the last two digits of the current year as a string" do
      expect(current_year).to eq("16")
    end
  end

  describe "#last_year" do
    it "returns the last two digits of the last year as a string" do
      expect(last_year).to eq("15")
    end
  end

  describe "#year_amount" do
    it "returns the amount of cigs smoked in a specified year for a given user" do
      user.smoker_stats << test_one << test_two << test_three
      expect(year_amount("2014", user)).to eq(14)
      expect(year_amount("2015", user)).to eq(31)
    end
  end

end