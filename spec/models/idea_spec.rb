require 'rails_helper'

RSpec.describe Idea, type: :model do
  describe 'idea creation' do
    it 'is valid with valid params' do
      idea = Idea.create(name: 'idea',
                         description: 'such a good idea')

      idea.valid?
    end

    it "is not valid without a name" do
      idea = Idea.create(description: 'such a good idea')

      idea.invalid?
    end

    it "is not valid without a description" do
      idea = Idea.create(name: 'idea')

      idea.invalid?
    end

    it "belongs to a user" do
      user = User.create(first_name: 'Ross',
                         last_name: 'Edfort',
                         username: 'rossedfort',
                         password: 'password')

      user.ideas.create(name: 'idea',
                        description: 'such a good idea')

      result = user.ideas.size

      expect(result).to eq(1)
    end
  end
end
