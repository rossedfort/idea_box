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

    visit '/login'

    fill_in "Username", with: admin.username
    fill_in "Password", with: admin.password
    click_button "Sign in"

    expect(current_path).to eq user_path(admin.id)

    visit admin_categories_path

    click_link "Create New Category"

    expect(page).to have_content("Create a New Category")

    expect(current_path).to eq new_admin_category_path

    fill_in "Name", with: "Pizza Recipes"
    fill_in "Description", with: "Delicious pizza recipes for everyone"
    click_button "Create Category"

    expect(page).to have_content("Pizza Recipes")
    expect(page).to have_content("Delicious pizza recipes for everyone")
    expect(admin.categories.count).to eq 1
  end

  scenario "user cannot category index" do
    user = User.create(first_name: 'Emily',
                        last_name: 'Dowdle',
                        username: 'emily',
                        password: 'password',
                        role: 0)

    visit admin_categories_path

    expect(page).to have_content("404")
  end

  scenario "admin can delete category" do
    admin = User.create(first_name: 'Ross',
                        last_name: 'Edfort',
                        username: 'rossedfort',
                        password: 'password',
                        role: 1)

    admin.categories.create(name: "Farm Animals",
                            description: "Awesome stuff about cows, goats and chickens")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_categories_path
    click_link "Delete"

    expect(current_path).to eq admin_categories_path
  end

end
