class Category < ActiveRecord::Base
  has_many :ideas
  belongs_to :user

  validates :name, presence: true,
                   uniqueness: true

  validates :user_id, presence: true
>>>>>>> 73111cf52fec34577f0152d738c79bc22e8a7a25
end
