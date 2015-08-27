require('sinatra')
require('sinatra/reloader')
require('sinatra/activerecord')
also_reload('./lib/**/*.rb')
require('./lib/recipe')
require('./lib/ingredient')
require('./lib/instruction')
require('./lib/tag')
require('pg')
require('pry')

get("/") do
  @recipes = Recipe.all() # it stores all the recipe values in the instancce variable and passes all recipes to the index page
  erb(:index)
end

get("/recipe_link") do
  @recipes = Recipe.all()
  erb(:recipe)
end

get("/tags_link") do
  @tags=Tag.all()
  erb(:tags)
end


post("/recipes") do
  temporary_name = params.fetch("name")
  temporary_recipe = Recipe.create({:name => temporary_name}) # created a new instance of recipe and saved it in the database


  @recipes = Recipe.all()
  erb(:index)
end

get("/recipes/:id") do
  @selected_recipe = Recipe.find(params.fetch("id").to_i) #
  @tags = Tag.all()
  # @recipes = Recipe.all()
  erb(:recipe)
end

post("/add_ingredient") do
  ingredient=params.fetch("ingredient")
  temporary_ingredient = Ingredient.create({:name => ingredient})
  recipe_id=params.fetch("id").to_i() # fetched id from hidden input box
  @selected_recipe = Recipe.find(recipe_id) # finds recipe based from the id done previously
  previous_ingredients = @selected_recipe.ingredients
  previous_ingredients.push(temporary_ingredient)
  @selected_recipe.update({:ingredients => previous_ingredients})
  # ingredients.recipes.push(temporary_ingredient)
  # recipe.ingredients.push(new_ingredient)
  @tags = Tag.all()
  erb(:recipe)
end

post("/add_instruction") do
  instruction=params.fetch("instruction")
  recipe_id=params.fetch("id").to_i()
  temporary_instruction = Instruction.create({:description => instruction, :recipe_id => recipe_id})
  @selected_recipe = Recipe.find(recipe_id)
  previous_instructions = @selected_recipe.instructions
  previous_instructions.push(temporary_instruction)
  @selected_recipe.update({:instructions => previous_instructions})
  @tags = Tag.all()
  erb(:recipe)
end

post("/tags") do
  tag=params.fetch("tag")
  temporary_tag=Tag.create({:name=>tag})
  @tags=Tag.all()
  erb(:tags)
end

get("/tags/:id") do
  @tags=Tag.find(params.fetch("id").to_i)
  @tags
  erb(:tags)
end

post("/tag_associate") do
#binding.pry
  tags = params.fetch("tag_checkbox")
  @selected_recipe= Recipe.find(params.fetch("id"))

  tags.each() do |tag|
    checked_tags = @selected_recipe.tags
    checked_tags.push(Tag.find(tag))
    @selected_recipe.update({:tags => checked_tags})
  end

  # tag_checkbox:params.fetch("tag_checkbox")
  #
  # temporary_tag_checkbox=Tag.create({:name=>temporary_tag_checkbox})
  # @tag_checkbox=Tag.all()
  #@tags = Tag.all()
  erb(:recipe)
end

post("/add_ratings") do
  rating=params.fetch("rating")
  @selected_recipe=Recipe.find(params.fetch("id"))
  @selected_recipe.update({:rating=>rating})

  @tags = Tag.all()
  erb(:recipe)
end
