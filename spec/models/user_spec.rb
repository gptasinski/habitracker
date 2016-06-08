require 'rails_helper'

describe "User" do
  let(:test) { User.create(name: "greg", email: "greg@gmail.com", password: "123") }

  it "should have a name" do
    expect(test.name).to eq("greg")
  end

  it "should have an email" do
    expect(test.email).to eq("greg@gmail.com")
  end

  it "should have a password" do
    expect(test.password).to eq("123")
  end
end