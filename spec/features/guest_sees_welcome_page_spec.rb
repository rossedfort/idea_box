require 'rails_helper'

feature "Viewing welcome" do

  scenario "a user visits the root path of the app" do
    visit root_path
    within("#welcome") do
      expect(page).to have_content 'Welcome to IdeaBox!'
    end
    within('#login') do
      expect(page).to have_content('Create Account')
      expect(page).to have_content('First name')
      expect(page).to have_content('Last name')
      expect(page).to have_content('Username')
      expect(page).to have_content('Password')
    end
  end
end
