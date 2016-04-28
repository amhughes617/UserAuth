class User < ActiveRecord::Base

  has_many :friendships
  has_many :friends, through: :friendships

  validates :username, presence: true,
                       uniqueness: true,
                       length: {minimum: 7, maximum: 12},
                       format: { with: /\A[a-zA-Z0-9]+\Z/, message: "User name must be between 7 and 12 characters and contain no spaces or special characters" }
  validates :password_digest, presence: true,
                              format: { with: /^.*(?=.{7,14})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=]).*$/,  message: "Password must be between 7 and 14 characters and include at least one number, one letter, and one special character(@#$%^&+=)" }
end
