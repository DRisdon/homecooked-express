class CreateRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :recipes do |t|

      t.bigint :dinner_id
      t.string :source
      t.string :name
      t.string :image_url
      t.string :recipe_url
      t.string :ingredients
      t.text :recipe_text

      t.timestamps
    end
  end
end
