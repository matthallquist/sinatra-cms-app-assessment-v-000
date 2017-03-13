class User < ActiveRecord::Base
  has_many :recipes
  has_secure_password
  validates :password, presence: true
  validates :username, uniqueness: true

end
