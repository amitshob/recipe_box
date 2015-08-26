require('sinatra')
require('sinatra/reloader')
require('sinatra/activerecord')
also_reload('./lib/**/*.rb')
require('./lib/recipe')
require('./lib/ingredient')
require('pg')
require('pry')

get("/") do
  @recipes = Recipe.all() # it stores all the recipe values in the instancce variable and passes all recipes to the index page
  binding.pry
  erb(:index)
end

get("/recipe_link") do
  @recipes = Recipe.all()
  erb(:recipe)
end

post("/recipes") do
  temporary_name = params.fetch("name")
  temporary_recipe = Recipe.create({:name => temporary_name}) # created a new instance of recipe and saved it in the database

  @recipes = Recipe.all()
  erb(:index)
end

get("/recipes/:id") do
  @selected_recipe = Recipe.find(params.fetch("id").to_i) #
  # @recipes = Recipe.all()
  erb(:recipe)
end

post("/add_ingredient") do
  ingredient=params.fetch("ingredient")
  temporary_ingredient = Ingredient.create({:name => ingredient})
  # recipe_id=params.fetch("id").to_i()
  # ingredients = Recipe.find(recipe_id)
  # previous_ingredients = @selected_recipe.ingredients
  # previous_ingredients.push(temporary_ingredient.id)
  # @selected_recipe.update({:ingredients => previous_ingredients})
  ingredients.recipes.push(temporary_ingredient)

  erb(:recipe)
end
