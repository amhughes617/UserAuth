class User < ActiveRecord::Base
  has_secure_password

  has_many :friendships
  has_many :friends, through: :friendships

  validates :username, presence: true,
                       uniqueness: true,
                       length: {minimum: 7, maximum: 12},
                       format: { with: /\A[a-zA-Z0-9]+\Z/, message: "User name must include at least one number and one letter, be between 7 and 12 characters, and contain no spaces or special characters" }
end
