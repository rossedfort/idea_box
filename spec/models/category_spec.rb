require 'rails_helper'

RSpec.describe Category, type: :model do
  describe "category" do
    it "is valid" do
      admin = User.create(first_name:"Emily",
                           last_name: "Dowdle",
                           username:"Emily",
                           password: "password",
                           role: 1)

      category = admin.categories.create(name: "Farm animals",
                              description: "Anything related to cows, goats or chickens")

      category.valid?
    end

    it "is invalid without name" do
      admin = User.create(first_name:"Emily",
                          last_name: "Dowdle",
                          username:"Emily",
                          password: "password",
                          role: 1)

      category = admin.categories.create(description: "Anything related to cows, goats or chickens")

      category.invalid?
    end

    it "is invalid without admin creator" do
      admin = User.create(first_name:"Emily",
                          last_name: "Dowdle",
                          username:"Emily",
                          password: "password",
                          role: 0)

      category = admin.categories.create(name: "Farm animals",
                                         description: "Anything related to cows, goats or chickens")

      category.invalid?
    end

    it "belongs to an admin" do
      admin = User.create(first_name: 'Ross',
                          last_name: 'Edfort',
                          username: 'rossedfort',
                          password: 'password',
                          role: 1)

      admin.categories.create(name: 'New Category')

      result = admin.categories.size

      expect(result).to eq(1)
    end
  end
end
