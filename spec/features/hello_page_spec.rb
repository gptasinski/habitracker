require 'rails_helper'

feature "hello page" do

  let(:welcome_message) { "Welcome to Habit Tracker"}

  scenario "the page contains a link to sign up, log in and a welcome message" do
    visit("/")
    expect(page).to have_link("Sign Up")
    expect(page).to have_link("Log In")
    expect(page).to have_text
  end

  scenario "the user clicks the sign up link and visits the sign up page" do
    visit("/")
    click_link "Sign Up"
    expect(page).to have_text("Name")
    expect(page).to have_text("Email")
    expect(page).to have_text("Password")
    expect(page).to have_text("Confirm password")
    expect(page).to have_link("Sign Up")
  end

  scenario "the user clicks the log in page and visits the log in page" do
    visit("/")
    click_link "Log In"
    expect(page).to have_text("Email")
    expect(page).to have_text("Password")
    expect(page).to have_link("Log In")
  end

end