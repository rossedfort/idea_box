require 'rails_helper'

feature "Signing up" do
  background do

  end

  scenario "Signing up with correct creditionals" do
    visit '/users/new'
    within("#signup-form") do
      fill_in 'First name', :with => 'Ross'
      fill_in 'Last name', :with => 'Edfort'
      fill_in 'Username', :with => 'rossedfort'
      fill_in 'Password', :with => 'password'
    end

    click_button 'Sign up'

    expect(page).to have_content 'Welcome Ross'
  end

  scenario "Signing up with incorrect creditionals" do
    visit '/users/new'
    within("#signup-form") do
      fill_in 'First name', :with => 'Ross'
      fill_in 'Username', :with => 'rossedfort'
      fill_in 'Password', :with => 'password'
    end

    click_button 'Sign up'

    expect(page).to_not have_content 'Welcome Ross'
  end
end
