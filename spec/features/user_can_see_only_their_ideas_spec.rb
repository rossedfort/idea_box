require 'rails_helper'

feature 'user only sees their ideas' do
  background do
    create_and_login_user
    @user.ideas.create(name: 'Great Idea',
                      description: "It's really good")
  end
  scenario "a user navigates to the index page and see all of their ideas" do
    visit ideas_path

    expect(page).to have_content 'My Ideas'
    expect(page).to have_content 'Great Idea'
    expect(page).to have_content "It's really good"
  end
end
