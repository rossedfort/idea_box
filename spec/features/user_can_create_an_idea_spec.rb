require 'rails_helper'

feature 'create idea' do
  background do
    user = User.create(first_name: 'Ross',
                       last_name: 'Edfort',
                       username: 'rossedfort',
                       password: 'password')

    visit login_path

    visit '/login'
    within("#session") do
      fill_in 'Username', :with => 'rossedfort'
      fill_in 'Password', :with => 'password'
    end
    click_button 'Sign in'
  end

  scenario 'creating idea while signed in' do
    visit new_idea_path

    within('#new-idea') do
      fill_in 'Name', with: 'Great Idea'
      fill_in 'Description', with: 'What a great idea'
    end
    click_button 'Create Idea'

    expect(page).to have_content 'Idea Saved!'
    expect(page).to have_content 'Your Idea!'
    expect(page).to have_content 'Great Idea'
    expect(page).to have_content 'What a great idea'
  end

  scenario 'creating idea while signed in from the ideas index page' do
    visit ideas_path

    click_link 'New Idea'

    within('#new-idea') do
      fill_in 'Name', with: 'Great Idea'
      fill_in 'Description', with: 'What a great idea'
    end
    click_button 'Create Idea'

    expect(page).to have_content 'Idea Saved!'
    expect(page).to have_content 'Your Idea!'
    expect(page).to have_content 'Great Idea'
    expect(page).to have_content 'What a great idea'
  end
end
