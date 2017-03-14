class Recipe < ActiveRecord::Base
  has_many :reviews
  belongs_to :user
  validates :name, :category, :prep_time, :cook_time, :ingredients, :instructions, presence: true
end
