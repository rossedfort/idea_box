require 'rails_helper'

RSpec.describe User, type: :model do
  describe "user" do
    it "is valid" do
      user = User.create(first_name:"Emily",
                         last_name: "Dowdle",
                         username:"Emily",
                         password: "password")

      user.valid?
    end

    it "is not valid without first name" do
      user = User.create(last_name: "Dowdle",
                         username:"Emily",
                         password: "password")

      user.invalid?
    end

    it "is not valid without last name" do
      user = User.create(first_name:"Emily",
                         username:"Emily",
                         password: "password")

      user.invalid?
    end

    it "is not valid without username" do
      user = User.create(first_name: "Emily",
                         last_name: "Dowdle",
                         password: "password")

      user.invalid?
    end

    it "is not valid without password" do
      user = User.create(first_name:"Emily",
                         last_name: "Dowdle",
                         username:"Emily")

      user.invalid?
    end

    it "is not valid with duplicate username" do
      user_one = User.create(first_name:"Emily",
                         last_name: "Dowdle",
                         username:"Emily",
                         password: 'password')

      user_two = User.create(first_name:"Emily",
                         last_name: "Smith",
                         username:"Emily",
                         password: 'password')

      user_one.valid?
      user_two.invalid?
    end
  end

end
