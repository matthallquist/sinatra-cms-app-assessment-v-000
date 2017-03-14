class Review < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :user
  validates :rating, :content, presence: true
  validates :rating, numericality: { only_integer: true }
end
