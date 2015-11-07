require 'rails_helper'

RSpec.describe Image, type: :model do
  describe 'image creation' do
    it 'is valid with valid params' do
      idea = Idea.create(name: 'Awesome image',
                         url: 'http://www.ibiblio.org/wm/paint/auth/cassatt/boating.jpg')

      idea.valid?
    end

  end
end
