require 'rails_helper'

feature "Admin Category Creation" do
  background do

  end

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

    assert page.has_content?("All Categories")
    assert page.has_content?("Farm Animals")
  end

  scenario "user cannot category index" do

    visit admin_categories_path

    assert page.has_content?("404")
  end

end
