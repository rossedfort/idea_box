require 'rails_helper'

feature "Signing in" do
  background do
    # admin = User.create(first_name: 'Ross',
    #             last_name: 'Edfort',
    #             username: 'rossedfort',
    #             password: 'password',
    #             role: 1)

    # visit '/login'
    # within("#session") do
    #   fill_in 'Username', :with => 'rossedfor'
    #   fill_in 'Password', :with => 'password'
    # end
    # click_button 'Sign in'
  end

  scenario "logged in admin sees category index" do
    admin = User.create(first_name: 'Ross',
                last_name: 'Edfort',
                username: 'rossedfort',
                password: 'password',
                role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    visit admin_categories_path

    assert page.has_content?("All Categories")
  end

  scenario "user cannot category index" do

    visit admin_categories_path

    assert page.has_content?("404")
  end

end
