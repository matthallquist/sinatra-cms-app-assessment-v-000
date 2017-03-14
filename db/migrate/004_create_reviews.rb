class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :content
      t.integer :user_id
      t.integer :recipe_id
    end
  end
end
