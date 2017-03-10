class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :category
      t.boolean :private, default: false
      t.string :prep_time
      t.string :cook_time
      t.text :ingredients
      t.text :instructions
    end
  end
end
