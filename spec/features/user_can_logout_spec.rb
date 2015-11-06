require 'rails_helper'

feature "Signing out" do
  background do
    User.create(first_name: 'Ross',
                last_name: 'Edfort',
                username: 'rossedfort',
                password: 'password')

    visit login_path

    fill_in "Username", with: "rossedfort"
    fill_in "Password", with: "password"

    click_button "Sign in"
  end

  scenario "Signing in with correct credentials" do

    click_link 'Logout'

    expect(page).to have_content 'Goodbye'
    expect(page).to have_content 'Login'
  end
end
