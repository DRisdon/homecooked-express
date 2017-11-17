class Recipe < ApplicationRecord

  belongs_to :dinner

  def parse_recipe
    {
      dinner_id: self.dinner_id,
      name: self.name,
      source: self.source,
      recipe_url: self.recipe_url,
      image_url: self.image_url,
      ingredients: self.ingredients.split('; ')
    }
  end

end
