require 'rails_helper'

RSpec.describe Admin::Image, type: :model do
  describe 'image creation' do
    it 'is valid with valid params' do
      admin = User.create(first_name:"Emily",
                          last_name: "Dowdle",
                          username:"Emily",
                          password: "password",
                          role: 1)

      image = admin.images.create(name: 'Awesome image',
                                  url: 'http://www.ibiblio.org/wm/paint/auth/cassatt/boating.jpg',
                                  user_id: 1)

      expect(image).to be_valid
    end

    it 'is invalid without url' do
      admin = User.create(first_name:"Emily",
                          last_name: "Dowdle",
                          username:"Emily",
                          password: "password",
                          role: 1)

      image = admin.images.create(name: 'Awesome image')

      expect(image).to_not be_valid
    end

    it 'is invalid if duplicate url' do
      admin = User.create(first_name:"Emily",
                          last_name: "Dowdle",
                          username:"Emily",
                          password: "password",
                          role: 1)

      image = admin.images.create(name: 'Awesome image',
                                  url: 'http://www.ibiblio.org/wm/paint/auth/cassatt/boating.jpg')

      expect(image).to be_valid

      image_two = admin.images.create(name: 'Another awesome image',
                                      url: 'http://www.ibiblio.org/wm/paint/auth/cassatt/boating.jpg')

      expect(image_two).to_not be_valid
    end
  end
end
