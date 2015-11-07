require 'rails_helper'

feature "Admin Image Creation" do

  scenario "logged in admin sees category index" do
    admin = User.create(first_name: 'Ross',
                        last_name: 'Edfort',
                        username: 'rossedfort',
                        password: 'password',
                        role: 1)

    admin.images.create(name: "The Boating Party",
                        url: "http://www.ibiblio.org/wm/paint/auth/cassatt/boating.jpg")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_images_path

    expect(page).to have_content("The Boating Party")
  end

  # scenario "logged in admin can create a category" do
  #   admin = User.create(first_name: 'Emily',
  #               last_name: 'Dowdle',
  #               username: 'emily',
  #               password: 'password',
  #               role: 1)
  #
  #   visit admin_categories_path
  #
  #   click_link "Create New Category"
  #
  #   expect(current_path).to eq new_admin_categories_path
  # end


end
