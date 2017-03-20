class User < ActiveRecord::Base
  has_many :recipes
  has_many :reviews
  has_secure_password
  validates :password, length: { in: 6..20 }
  validates_presence_of :password, message: "Password cannot be blank."
  validates_presence_of :username, message: "Username cannot be blank."
  validates :username, length: { in: 6..20 }
  validates :username, uniqueness: true
end
