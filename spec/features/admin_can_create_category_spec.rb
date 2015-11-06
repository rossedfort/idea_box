require 'rails_helper'

feature "Admin Category Creation" do

  scenario "logged in admin sees category index" do
    admin = User.create(first_name: 'Ross',
                last_name: 'Edfort',
                username: 'rossedfort',
                password: 'password',
                role: 1)

    admin.categories.create(name: "Farm Animals",
                            description: "Awesome stuff about cows, goats and chickens")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    visit admin_categories_path

    expect(page).to have_content("All Categories")
    expect(page).to have_content("Farm Animals")
  end

  scenario "logged in admin can create a category" do
    admin = User.create(first_name: 'Emily',
                last_name: 'Dowdle',
                username: 'emily',
                password: 'password',
                role: 1)

    visit admin_categories_path

    click_link "Create New Category"

    expect(current_path).to eq new_admin_categories_path
  end

  scenario "user cannot category index" do

    visit admin_categories_path

    expect(page).to have_content("404")
  end

end
