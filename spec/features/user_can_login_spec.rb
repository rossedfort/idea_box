require 'rails_helper'

feature "Signing in" do
  background do
    User.create(first_name: 'Ross',
              last_name: 'Edfort',
              username: 'rossedfort',
              password: 'password')
  end

  scenario "Signing in with correct credentials" do
    visit '/login'
    within("#session") do
      fill_in 'Username', :with => 'rossedfort'
      fill_in 'Password', :with => 'password'
    end
    click_button 'Sign in'
    expect(page).to have_content 'Welcome Ross'
  end

  scenario "Signing in with incorrect username" do
    visit '/login'
    within("#session") do
      fill_in 'Username', :with => 'notrossedfort'
      fill_in 'Password', :with => 'password'
    end
    click_button 'Sign in'
    within("#errors") do
      expect(page).to have_content 'Incorrect Credentials'
    end
  end

  scenario "Signing in with incorrect password" do
    visit '/login'
    within("#session") do
      fill_in 'Username', :with => 'rossedfort'
      fill_in 'Password', :with => 'notapassword'
    end
    click_button 'Sign in'
    within("#errors") do
      expect(page).to have_content 'Incorrect Credentials'
    end
  end
end
