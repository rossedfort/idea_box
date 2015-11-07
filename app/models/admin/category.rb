class Admin::Category < ActiveRecord::Base
  has_many :ideas
  belongs_to :user

  validates :name, presence: true,
                   uniqueness: true

  validates :user_id, presence: true
end
