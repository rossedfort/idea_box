require 'rails_helper'

feature "Signing in" do
  background do
    User.create(first_name: 'Ross',
              last_name: 'Edfort',
              username: 'rossedfort',
              password: 'password')
  end

  pending"Signing in with correct credentials" do
    visit '/sessions/new'
    within("#session") do
      fill_in 'Username', :with => 'rossedfort'
      fill_in 'Password', :with => 'password'
    end
    click_button 'Sign in'
    expect(page).to have_content 'Welcome Ross'
  end
end
