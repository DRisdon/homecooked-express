class Recipe < ApplicationRecord

  belongs_to :dinner

  def parse_recipe
    {
      id: self.id,
      dinner_id: self.dinner_id,
      name: self.name,
      source: self.source,
      recipe_url: self.recipe_url,
      image_url: self.image_url,
      ingredients: self.ingredients.split('; ')
    }
  end

  def parse_recipe_no_ingredients
    {
      id: self.id,
      dinner_id: self.dinner_id,
      name: self.name,
      image_url: self.image_url
    }
  end

end
