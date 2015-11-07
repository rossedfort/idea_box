<<<<<<< HEAD:app/models/admin/category.rb
class Admin::Category < ActiveRecord::Base
||||||| merged common ancestors
class Category < ActiveRecord::Base
=======
class Category < ActiveRecord::Base
  has_many :ideas
>>>>>>> user-flow:app/models/category.rb
  belongs_to :user

  validates :name, presence: true,
                   uniqueness: true

  validates :user_id, presence: true
end
