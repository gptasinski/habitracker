require 'rails_helper'

feature "login page" do
  scenario "the page conatains a form where a user can sign in with their email and password" do
    visit ("/login")
    expect(page).to have_content("Email Password")
  end
end