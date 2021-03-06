require "bundler/setup"
Bundler.require :default
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }
require 'pry'
get "/" do
  erb :index
end

# CATEGORY PATH

get "/categories" do
  @categories = Category.all
  erb :categories
end

get "/categories/add" do
  @categories = Category.all
  erb :add_categories
end

post "/categories/add" do
  category_name = params["category_name"]
  @category = Category.create({:name => category_name})
  redirect "/categories/add"
end

get "/categories/:id" do
  @category = Category.find(params['id'].to_i)
  erb :category
end

get "/categories/:id/add_recipes" do
  @category = Category.find(params['id'].to_i)
  @recipes = Recipe.all
  erb :add_recipes_to_category
end

patch "/categories/:id" do
  category_id = params['id'].to_i
  @category = Category.find(category_id)
  current_ids = @category.recipes.map(&:id) ##(&:id) = {|e| e.id}

  recipe_ids = params['recipe_ids']
  all_recipes = current_ids + recipe_ids
  @category.update({:recipe_ids => all_recipes})
  redirect "/categories/#{category_id}"
end

# INGREDIENT PATH

get "/ingredients" do
  @ingredients = Ingredient.all
  erb :ingredients
end

get "/ingredients/add" do
  @ingredients = Ingredient.all
  erb :add_ingredients
end

post "/ingredients/add" do
  ingredient_name = params["ingredient_name"]
  @ingredient = Ingredient.create({:name => ingredient_name})
  redirect "/ingredients/add"
end

get "/ingredients/:id" do
  @ingredient = Ingredient.find(params['id'].to_i)
  erb :ingredient
end

get '/ingredients/:id/add_recipes' do
  @ingredient = Ingredient.find(params['id'].to_i)
  @recipes = Recipe.all
  erb :add_recipes_to_ingredients
end

patch "/ingredients/:id" do
  ingredient_id = params['id'].to_i
  @ingredient = Ingredient.find(ingredient_id)
  current_ids = @ingredient.recipes.map(&:id) ##(&:id) = {|e| e.id}
  recipe_ids = params['recipe_ids']
  all_recipes = current_ids + recipe_ids
  @ingredient.update({:recipe_ids => all_recipes})
  redirect "/ingredients/#{ingredient_id}"
end

# RECIPE PATH

get "/recipes" do
  @recipes = Recipe.all
  erb :recipes
end

get "/recipes/add" do
  @recipes = Recipe.all
  erb :add_recipes
end

post "/recipes/add" do
  @recipes = Recipe.all
  data = params["recipe"]
  recipe = Recipe.new(data)
  if recipe.save
    @message = "Recipe added successfully!"
  else
    @message = "Please enter a name and description."
  end
  erb :add_recipes
end

get "/recipes/:id" do
  @recipe = Recipe.find(params['id'].to_i)
  erb :recipe
end

get '/recipes/:id/add_categories' do
  @recipe = Recipe.find(params['id'].to_i)
  @categories = Category.all
  erb :add_categories_to_recipes
end

patch "/recipes/:id" do
  recipe_id = params['id'].to_i
  @recipe = Recipe.find(recipe_id)
  current_ids = @recipe.categories.map(&:id) ##(&:id) = {|e| e.id}
  category_ids = params['category_ids']
  all_categories = current_ids + category_ids
  @recipe.update({:category_ids => all_categories})
  redirect "/recipes/#{recipe_id}"
end

patch "/recipes/:id/updated" do
  recipe_id = params['id'].to_i
  @recipe = Recipe.find(recipe_id)
  name = params['name']
  if @recipe.update({:name => name})
    redirect "/recipes/#{recipe_id}"
  else
    @recipe.update({:name => "#{@recipe.name}"})
    redirect "/recipes/#{recipe_id}"
  end
end
