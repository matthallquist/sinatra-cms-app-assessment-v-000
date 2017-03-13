class Recipe < ActiveRecord::Base
  belongs_to :user
  validates :name, :category, :prep_time, :cook_time, :ingredients, :instructions, presence: true

end
