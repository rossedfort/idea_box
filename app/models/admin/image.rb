class Admin::Image < ActiveRecord::Base
  belongs_to :user

  validates :url, presence: true,
                  uniqueness: true

  validates :user_id, presence: true
end
