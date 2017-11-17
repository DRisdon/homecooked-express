class RecipesController < ApplicationController
  def show
    recipe = Recipe.find(params[:id]).parse_recipe
    render json: recipe
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.save
    render json: @recipe
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(recipe_params)
    render json: @recipe
  end

  def search
    url = "https://api.edamam.com/search?q=#{params[:query]}&app_id=#{ENV['APP_ID']}&app_key=#{ENV['APP_KEY']}"
    results = HTTParty.get(url)
    results = JSON.parse(results.body)
    @results = results["hits"].map do |result|
      {
        name: result["recipe"]["label"],
        source: result["recipe"]["source"],
        recipe_url: result["recipe"]["url"],
        image_url: result["recipe"]["image"],
        ingredients: result["recipe"]["ingredientLines"]
      }
    end
    render :json => @results
  end

  def delete
    @recipe = Recipe.find(params[:id])
    @recipe.delete
    render :json => {
      message: "recipe deleted"
    }
  end

  private

  def recipe_params
    params.permit(:name, :source, :dinner_id, :recipe_url, :recipe_text, :image_url, :ingredients)
  end
end
