class Recipe < ActiveRecord::Base
  has_many :reviews
  belongs_to :user
  validates :name, :category, :prep_time, :cook_time, :ingredients, :instructions, presence: true
  validates :name, :category, :prep_time, :cook_time, format: { with: /\A[a-zA-Z\d]+\z/,
    message: "only allows letters and numbers" }

  def rating_avg
    if self.reviews.any?
      score = 0
      self.reviews.each do |review|
        score += review.rating
      end
      score = score / self.reviews.count.to_f
    else
      score = 0
    end
    score
  end
end
