require 'rails_helper'

feature "sign up page" do
  let(:new_user) { User.new(name: "Jerry Garcia", email: "jerrygarcia@gmail.com", password: "123") }

  scenario "a new user signs up to the site" do
    visit new_user_path
    fill_in "user_name", :with => new_user.name
    fill_in "user_email", :with => new_user.email
    fill_in "user_password", :with => new_user.password
    fill_in "user_password_confirmation", :with => new_user.password
    click_button "Sign Up"
    expect(page).to have_text("Your sign up is complete. Have fun tracking your habits!")
  end
end