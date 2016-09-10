require 'rails_helper'

describe "User" do
  let!(:test) { User.create(name: "greg", email: "greg@gmail.com", password: "123") }
  let!(:townes) { User.create(name: "Townes Van Zandt", email: "townesvanzandt@gmail.com", password: "123") }

  it "has a name" do
    expect(test.name).to eq("greg")
  end

  it "has an email" do
    expect(test.email).to eq("greg@gmail.com")
  end

  it "has a password" do
    expect(test.password).to eq("123")
  end

  describe "Validations" do
    it "is not valid witout a name" do
      test.name = nil
      expect(test).to_not be_valid
    end

    it "is not valid witout an email" do
      test.email = nil
      expect(test).to_not be_valid
    end

    it "is not valid without a unique email" do
      test.email = townes.email
      expect(test).to_not be_valid
    end

    it "is not valid witout a password" do
      test.password = nil
      expect(test).to_not be_valid
    end

    it "is valid with valid attributes" do
      expect(townes).to be_valid
    end
  end
end