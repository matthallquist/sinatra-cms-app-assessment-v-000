class User < ActiveRecord::Base
  has_many :recipes
  has_many :reviews
  has_secure_password
  validates :password, :username, presence: true
  validates :username, uniqueness: true

end
