require 'rails_helper'



RSpec.describe SmokerStat, type: :model do
  let!(:user) { User.create(name: "Test Subject", email: "test@gmail.com", password: "123") }
  let!(:one) { SmokerStat.create(user_id: user.id, amount: 16, date: "09.02.16") }
  let!(:two) { SmokerStat.create(user_id: user.id, amount: 17, date: "09.03.16") }
  let!(:three) { SmokerStat.create(user_id: user.id, amount: 18, date: "09.04.16") }
  let!(:four) { SmokerStat.create(user_id: user.id, amount: 12, date: "09.04.15") }


  describe "Validations" do
    it "is not valid without an amount" do
      one.amount = nil
      expect(one).to_not be_valid
    end

    it "is not valid without a date" do
      one.date = nil
      expect(one).to_not be_valid
    end

    it "is valid with valid attributes" do
      expect(one).to be_valid
    end
  end

  describe "#cost" do
    it "returns an integer" do
      expect(one.cost("city")).to be_an(Integer)
    end

    it "returns a rounded cost relative to the amount of a SmokerStat based on location" do
      expect(one.cost("city")).to eq(10)
      expect(one.cost("burbs")).to eq(6)
    end
  end

  describe ".user_daily_cost_ave" do
    it "returns an integer" do
      expect(SmokerStat.user_daily_cost_ave(user: user)).to be_an(Integer)
    end

    it "returns the average cost per date for a SmokerStat amount for given user" do
      expect(SmokerStat.user_daily_cost_ave(user: user)).to be(6)
    end
  end

  describe ".user_daily_amount_ave" do
    it "returns an integer" do
      expect(SmokerStat.user_daily_amount_ave(user: user)).to be_an(Integer)
    end

    it "returns the average of amounts for SmokerStats belonging to a user" do
      expect(SmokerStat.user_daily_amount_ave(user: user)).to eq((16 + 17+ 18 + 12) / 4)
    end
  end

  describe ".user_amount" do
    it "returns an integer" do
      expect(SmokerStat.user_amount(user: user)).to be_an(Integer)
    end

    it "returns the total of amounts from SmokerStats belonging to a user" do
      expect(SmokerStat.user_amount(user: user)).to be(63)
    end

    it "can return the total of amounts from SmokerStats belonging to a user for given specific year" do
      expect(SmokerStat.user_amount(user: user, year: "16")).to be(51)
    end
  end

  describe ".user_cost" do
    it "returns an integer" do
      expect(SmokerStat.user_cost(user: user, year: "16", location: "city")).to be_an(Integer)
    end

    it "returns the total cost of SmokerStats belonging to given user for a given location" do
      expect(SmokerStat.user_cost(user: user, location: "burbs")).to be(24)
    end

    it "returns the total cost of SmokerStats belonging to a given user for a given location in a given year" do
      expect(SmokerStat.user_cost(user: user, year: "15", location: "city")).to be(8)
    end
  end

  describe ".user_stats" do
    it "returns all SmokerStats belonging to a given user if no year is given" do
      expect(SmokerStat.user_stats(user: user).length).to be(4)
    end

    it "retunrs SmokerStats belonging to a given user for a given year" do
      expect(SmokerStat.user_stats(user: user, year: "15").length).to be(1)
    end
  end


end