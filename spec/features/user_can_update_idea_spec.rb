require 'rails_helper'

feature 'edit idea' do
  background do
    user = User.create(first_name: 'Ross',
                       last_name: 'Edfort',
                       username: 'rossedfort',
                       password: 'password')
    cool = Admin::Category.create(name: 'Cool',
                           description: 'Only cool ideas here',
                           user_id: user.id)

    image = Admin::Image.create(name: 'cat',
                                url: 'https://pbs.twimg.com/profile_images/378800000532546226/dbe5f0727b69487016ffd67a6689e75a.jpeg',
                                user_id: user.id)


    visit login_path

    visit '/login'
    within("#session") do
      fill_in 'Username', :with => 'rossedfort'
      fill_in 'Password', :with => 'password'
    end
    click_button 'Sign in'

    visit new_idea_path

    within('#new-idea') do
      fill_in 'Name', with: 'Great Idea'
      fill_in 'Description', with: 'What a great idea'
      find('#categorySelect').find(:xpath, 'option[1]').select_option
      find('#imageSelect').find(:xpath, 'option[1]').select_option
    end
    click_button 'Create Idea'

    expect(page).to have_content 'Idea Saved!'
    expect(page).to have_content 'Your Idea!'
    expect(page).to have_content 'Great Idea'
    expect(page).to have_content 'What a great idea'
  end

  scenario "user can update an idea" do
    visit edit_idea_path(Idea.last.id)

    within('#edit-idea') do
      fill_in 'Name', with: "Not a great idea"
      fill_in 'Description', with: "Probably the worst you've had"
      find('#categorySelect').find(:xpath, 'option[1]').select_option
      find('#imageSelect').find(:xpath, 'option[1]').select_option
    end
    click_button 'Update Idea'

    expect(page).to have_content 'Idea Updated!'
    expect(page).to have_content 'Not a great idea'
    expect(page).to have_content "Probably the worst you've had"
  end
end
