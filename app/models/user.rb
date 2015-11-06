class User < ActiveRecord::Base
    has_secure_password

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :username, presence: true,
                         uniqueness: true
    validates :password, presence: true

    has_many :ideas
    has_many :categories,
             :class_name => "Admin::Category"

    enum role: %w(default admin)
end
